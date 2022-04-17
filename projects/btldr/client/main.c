/*
 * Author: Jack Greenberg <j@jackgreenberg.co>
 * Copyright 2021
 */
#include <errno.h>
#include <getopt.h>
#include <libgen.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "projects/btldr/client/can.h"
#include "projects/btldr/client/client.h"
#include "log.h"

#define VERSION_MAJ 0
#define VERSION_MIN 1

char* prg;
char* device = "can0";

static void print_usage(char* prg, FILE* stream) {
    // clang-format off
    fprintf(stream, "%s - CAN software updater client    [version %i.%i]\n\n", prg, VERSION_MAJ, VERSION_MIN);

    fprintf(stream, "Usage: %s [options] <command> [args]\n\n", prg);
    fprintf(stream, "Options:\n");
    fprintf(stream, "    -h,--help     (display this text and exit)\n");
    fprintf(stream, "    -v,--verbose  (be verbose)\n");
    fprintf(stream, "    -V,--version  (show version)\n");
    fprintf(stream, "    -d,--device   (can device: can0 (default), vcan0)\n\n");

    fprintf(stream, "Commands:\n");
    fprintf(stream, "  flash <node_id> <binary>\n");
    fprintf(stream, "  ping [-a|<node_id>]\n\n");

    fprintf(stream, "Examples:\n");
    fprintf(stream, "  updatr ping -a\n");
    fprintf(stream, "      Ping all devices on the network\n\n");

    fprintf(stream, "  updatr ping 0x43\n");
    fprintf(stream, "      Ping device with ID 0x43\n\n");

    fprintf(stream, "  updatr flash 0x43 build/main.bin\n");
    fprintf(stream, "      Flash the ECU with ID 0x43 with the main.bin file\n");
    // clang-format on
}

// Pattern seen in git source
static int handle_opts(int* argc, char*** argv) {
    prg = basename((*argv)[0]);

    (*argv)++;
    (*argc)--;

    if (*argc == 0) {
        fprintf(stderr, "No command specified\n");
        print_usage(prg, stderr);
        exit(1);
    }

    while (*argc > 0) {
        const char* cmd = (*argv)[0];
        if (cmd[0] != '-') {
            // Reached a command
            break;
        }

        if (!strcmp(cmd, "-h") || !strcmp(cmd, "--help")) {
            print_usage(prg, stdout);
            exit(0);
        } else if (!strcmp(cmd, "-v") || !strcmp(cmd, "--verbose")) {
            log_set_level(LOG_INFO);
        } else if (!strcmp(cmd, "-d") || !strcmp(cmd, "--device")) {
            if (*argc < 2) {
                fprintf(stderr, "No device specified\n");
                print_usage(prg, stderr);
                exit(1);
            }
            device = (*argv)[1];
            (*argc)--;
            (*argv)++;
        } else {
            fprintf(stderr, "Unknown option: %s\n", (*argv)[0]);
            print_usage(prg, stderr);
            exit(1);
        }

        (*argc)--;
        (*argv)++;
    }
    return 0;
}

int main(int argc, char** argv) {
    int rc = 0;

    log_set_level(LOG_ERROR);
    handle_opts(&argc, &argv);

    char* cmd = argv[0];

    rc = can_client_create(device);
    if (rc > 0) {
        goto bail;
    }

    if (!strcmp(cmd, "flash")) {
        if (argc != 3) {
            fprintf(stderr, "Wrong number of args specified\n");
            print_usage(prg, stderr);
            exit(1);
        }

        uint8_t ecu_id = strtoul(argv[1], NULL, 16);
        char* binary_path = argv[2];

        // Deal with file
        FILE* fp = fopen(binary_path, "rb");
        if (fp == NULL) {
            perror("Couldn't flash");
            rc = 1;
            goto bail;
        }

        rc = cmd_flash(ecu_id, fp);
    } else if (!strcmp(cmd, "ping")) {
        if (argc != 2) {
            fprintf(stderr, "Wrong number of args specified\n");
            print_usage(prg, stderr);
            exit(1);
        }

        uint8_t ecu_id;
        if (!strcmp(argv[1], "-a")) {
            ecu_id = 0xFF;
        } else {
            ecu_id = strtoul(argv[1], NULL, 16);
        }

        struct ping_response r;
        rc = cmd_ping(ecu_id, &r);
        ping_print_response(r);
    } else {
        printf("Unknown command: %s\n", cmd);
        print_usage(prg, stderr);
        rc = 1;
    }

bail:
    can_client_destroy();
    return rc;
}
