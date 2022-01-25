#include <Shell.h>

void setup() {
    Serial.begin(9600);
    shell_init(shell_reader, shell_writer, 0);
    shell_register(gpio_mode, PSTR("gpio_mode"));
    shell_register(gpio_read, PSTR("gpio_read"));
    shell_register(gpio_write, PSTR("gpio_write"));
}

void loop() {
    shell_task();
}

int gpio_mode(int argc, char** argv) {
    if (argc != 3) {
        shell_print_error(E_SHELL_ERR_ARGCOUNT, 0);
        shell_println("");
        return SHELL_RET_FAILURE;
    }
    int pin = atoi(argv[1]);
    if (!strcmp(argv[2], (const char*)"INPUT"))
        pinMode(pin, INPUT);
    else if (!strcmp(argv[2], (const char*)"OUTPUT"))
        pinMode(pin, OUTPUT);

    return SHELL_RET_SUCCESS;
}

int gpio_read(int argc, char** argv) {
    if (argc != 2) {
        shell_print_error(E_SHELL_ERR_ARGCOUNT, 0);
        shell_println("");
        return SHELL_RET_FAILURE;
    }
    int pin = atoi(argv[1]);
    if (digitalRead(pin) == HIGH)
        shell_println("read:HIGH");
    else
        shell_println("read:LOW");
    return SHELL_RET_SUCCESS;
}

int gpio_write(int argc, char** argv) {
    if (argc != 3) {
        shell_print_error(E_SHELL_ERR_ARGCOUNT, 0);
        shell_println("");
        return SHELL_RET_FAILURE;
    }
    int pin = atoi(argv[1]);
    if (!strcmp(argv[2], (const char*)"HIGH"))
        digitalWrite(pin, HIGH);
    else if (!strcmp(argv[2], (const char*)"LOW"))
        digitalWrite(pin, LOW);
    return SHELL_RET_SUCCESS;
}

/**
 * Function to read data from serial port
 * Functions to read from physical media should use this prototype:
 * int my_reader_function(char * data)
 */
int shell_reader(char* data) {
    // Wrapper for Serial.read() method
    if (Serial.available()) {
        *data = Serial.read();
        return 1;
    }
    return 0;
}

/**
 * Function to write data to serial port
 * Functions to write to physical media should use this prototype
 * void my_writer_function(char data)
 */
void shell_writer(char data) {
    // Wrapper for Serial.write() method
    Serial.write(data);
}
