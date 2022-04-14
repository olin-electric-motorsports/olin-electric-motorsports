/*
 * Run right before flashing
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <time.h>

#include "crc32.h"
#include "image.h"

const size_t image_hdr_size = sizeof(image_hdr_t);

int patch_verify_image_magic(FILE* fp, image_hdr_t* image_hdr) {
    if (image_hdr->image_magic != IMAGE_MAGIC) {
        fprintf(stderr, "Incorrect image magic: 0x%X\n",
                image_hdr->image_magic);
        fclose(fp);
        return 1;
    }
    return 0;
}

int patch_write_timestamp(FILE* fp, image_hdr_t* image_hdr) {
    // Timestamp
    time_t timestamp = time(NULL);
    image_hdr->flash_timestamp = (uint64_t)timestamp;

    return 0;
}

int patch_write_image_size(FILE* fp, image_hdr_t* image_hdr) {
    // Image size
    fseek(fp, 0, SEEK_END);
    size_t image_size_total = ftell(fp);
    image_hdr->image_size = image_size_total - image_hdr_size;
    fseek(fp, 0, SEEK_SET);

    return 0;
}

int patch_calc_write_crc(FILE* fp, image_hdr_t* image_hdr,
                         uint16_t image_size) {
    // Seek to the beginning of the image
    fseek(fp, image_hdr_size, SEEK_SET);

    uint8_t* image = (uint8_t*)malloc(image_size);
    if (image == NULL) {
        fprintf(stderr, "Failed to malloc image_size %i", image_size);
        exit(1);
    }
    fread(image, image_size, 1, fp);

    uint32_t crc;
    crc32(image, image_size, &crc);
    image_hdr->crc = crc;

    free(image);
    fseek(fp, 0, SEEK_SET);

    return 0;
}

int patch_write_git_sha(FILE* fp) {
    return 0;
}

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: patch_header BINARY\n");
        return 1;
    }

    char* file = argv[1];
    FILE* fp = fopen(file, "r+b");

    if (fp == NULL) {
        fprintf(stderr, "File not found: %s\n", file);
        return 1;
    }

#ifdef DEBUG
    printf("Patching %s\n", file);
#endif

    image_hdr_t image_hdr;
    fread(&image_hdr, image_hdr_size, 1, fp);

#ifdef DEBUG
    printf("Found data: {\n");
    printf("    .image_magic = %x\n", image_hdr.image_magic);
    printf("    .crc = %x\n", image_hdr.crc);
    printf("    .image_size = %d\n", image_hdr.image_size);
    printf("    .flash_timestamp = %ld\n", image_hdr.flash_timestamp);
    printf("    .reserved = %x\n", image_hdr.reserved);
    printf("    .git_sha = %s\n", image_hdr.git_sha);
    printf("}\n");
#endif

    int rc;

    rc = patch_verify_image_magic(fp, &image_hdr);
    if (rc != 0) {
        exit(1);
    }

    rc = patch_write_timestamp(fp, &image_hdr);
    if (rc != 0) {
        exit(1);
    }

    rc = patch_write_image_size(fp, &image_hdr);
    if (rc != 0) {
        exit(1);
    }

    rc = patch_calc_write_crc(fp, &image_hdr, image_hdr.image_size);
    if (rc != 0) {
        exit(1);
    }

    // Write image_hdr back to binary file
    fseek(fp, 0, SEEK_SET);
    if (fwrite(&image_hdr, image_hdr_size, 1, fp) == 0) {
        fprintf(stderr, "Write failed.\n");
    }

    printf("Image data written.\n");

    fclose(fp);
    return 0;
}
