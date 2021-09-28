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

#include "can_client.h"
#include "commands.h"
#include "log.h"

#define VERSION_MAJ 0
#define VERSION_MIN 1

char* prg;

static void print_usage(char* prg, FILE* stream) {
    // clang-format off
    fprintf(stream, "%s - CAN software updater client    [version %i.%i]\n\n", prg, VERSION_MAJ, VERSION_MIN);
    fprintf(stream, "Usage: %s [options] <command> [args]\n\n", prg);
    fprintf(stream, "Options:\n");
    fprintf(stream, "    -h,--help     (display this text and exit)\n");
    fprintf(stream, "    -v,--verbose  (be verbose)\n");
    fprintf(stream, "    -V,--version  (show version)\n");
    fprintf(stream, "    -d,--device   (can device: can0, vcan0)\n\n");
    fprintf(stream, "Commands:\n");
    fprintf(stream, "  flash <node_id> <binary>\n");
    fprintf(stream, "  ping [-a|<node_id>]\n\n");
    // clang-format on
}

bool verbose = false;
char* device;

// Pattern seen in git source
static int handle_args(int* argc, char*** argv) {
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
            verbose = true;
        } else if (!strcmp(cmd, "-d") || !strcmp(cmd, "--device")) {
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
    int rc;
    prg = basename(argv[0]);

    argv++;
    argc--;

    handle_args(&argc, &argv);

    if (!verbose) {
        log_set_level(LOG_ERROR);
    } else {
        log_info("Running in verbose mode");
    }

    if (argc == 0) {
        printf("No command specified\n");
        print_usage(prg, stderr);
        exit(1);
    }

    char* cmd = argv[0];
    struct CanClient client;

    if (!strcmp(cmd, "flash")) {
        if (argc != 3) {
            fprintf(stderr, "Wrong number of args specified\n");
            print_usage(prg, stderr);
            exit(1);
        }

        uint8_t ecu_id = strtoul(argv[1], NULL, 16);
        char* binary_path = argv[2];

        rc = init_can_client(&client);
        if (rc != 0) {
            goto bail;
        }

        rc = cmd_flash(&client, ecu_id, binary_path);
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

        rc = init_can_client(&client);
        if (rc != 0) {
            goto bail;
        }

        uint8_t current_image;
        rc = cmd_ping(&client, ecu_id, &current_image);
    } else {
        printf("Unknown command: %s\n", cmd);
        print_usage(prg, stderr);
        rc = 1;
    }

bail:
    can_client_destroy(&client);
    return rc;
}
