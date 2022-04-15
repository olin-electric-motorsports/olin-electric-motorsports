/*
 * Run right before flashing
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>

#include "projects/btldr/libs/crc32/api.h"
#include "projects/btldr/libs/image/api.h"

const size_t image_hdr_size = sizeof(image_hdr_t);

int patch_verify_image_magic(FILE* old_file, image_hdr_t* image_hdr) {
    if (image_hdr->image_magic != IMAGE_MAGIC) {
        fprintf(stderr, "Incorrect image magic: 0x%X\n",
                (int)image_hdr->image_magic);
        fclose(old_file);
        return 1;
    }
    return 0;
}

int patch_write_timestamp(FILE* old_file, image_hdr_t* image_hdr) {
    // Timestamp
    time_t timestamp = time(NULL);
    image_hdr->flash_timestamp = (uint64_t)timestamp;

    return 0;
}

int patch_write_image_size(FILE* old_file, image_hdr_t* image_hdr) {
    // Image size
    fseek(old_file, 0, SEEK_END);
    size_t image_size_total = ftell(old_file);
    image_hdr->image_size = image_size_total - image_hdr_size;
    fseek(old_file, 0, SEEK_SET);

    return 0;
}

int patch_calc_write_crc(FILE* old_file, image_hdr_t* image_hdr,
                         uint16_t image_size) {
    // Seek to the beginning of the image
    fseek(old_file, image_hdr_size, SEEK_SET);

    uint8_t* image = (uint8_t*)malloc(image_size);
    if (image == NULL) {
        fprintf(stderr, "Failed to malloc image_size %i", image_size);
        exit(1);
    }
    size_t num_read = fread(image, image_size, 1, old_file);
    (void)num_read;

    uint32_t crc;
    crc32(image, image_size, &crc);
    image_hdr->crc = crc;

    free(image);
    fseek(old_file, 0, SEEK_SET);

    return 0;
}

int main(int argc, char** argv) {
    if (argc != 3) {
        fprintf(stderr, "Usage: patch_header BINARY OUTPUT\n");
        return 1;
    }

    char* binary = argv[1];
    char* output = argv[2];
    FILE* old_file = fopen(binary, "rb");
    FILE* new_file = fopen(output, "w+b");

    if (old_file == NULL) {
        perror("binary: ");
        return errno;
    }

    if (new_file == NULL) {
        perror("patched file: ");
        return errno;
    }

#ifdef DEBUG
    printf("Patching %s\n", binary);
#endif

    image_hdr_t image_hdr;
    size_t num_read = fread(&image_hdr, image_hdr_size, 1, old_file);
    (void)num_read;

    int rc;

    rc = patch_verify_image_magic(old_file, &image_hdr);
    if (rc != 0) {
        return rc;
    }

    rc = patch_write_timestamp(old_file, &image_hdr);
    if (rc != 0) {
        return rc;
    }

    rc = patch_write_image_size(old_file, &image_hdr);
    if (rc != 0) {
        return rc;
    }

    rc = patch_calc_write_crc(old_file, &image_hdr, image_hdr.image_size);
    if (rc != 0) {
        return rc;
    }

#ifdef DEBUG
    printf("Writing: {\n");
    printf("    .image_magic = %x,\n", image_hdr.image_magic);
    printf("    .crc = %x,\n", image_hdr.crc);
    printf("    .image_size = %d,\n", image_hdr.image_size);
    printf("    .flash_timestamp = %ld,\n", image_hdr.flash_timestamp);
    printf("    .reserved = %x,\n", image_hdr.reserved);
    printf("    .git_sha = %s\n", image_hdr.git_sha);
    printf("}\n");
#endif

    /*
     * Copy old to new
     */
    char c = fgetc(old_file);
    while (c != EOF) {
        fputc(c, new_file);
        c = fgetc(old_file);
    }
    fclose(old_file);

    // Write image_hdr back to binary file
    fseek(new_file, 0, SEEK_SET);
    if (fwrite(&image_hdr, image_hdr_size, 1, new_file) == 0) {
        perror("Failed to write image header: ");
    }

    printf("Image data written.\n");

    fclose(new_file);
    return 0;
}
