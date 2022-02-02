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
        Serial.println("");
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
        Serial.println("");
        return SHELL_RET_FAILURE;
    }
    int pin = atoi(argv[1]);
    if (digitalRead(pin) == HIGH)
        Serial.println("read:HIGH");
    else
        Serial.println("read:LOW");
    return SHELL_RET_SUCCESS;
}

int gpio_write(int argc, char** argv) {
    if (argc != 3) {
        shell_print_error(E_SHELL_ERR_ARGCOUNT, 0);
        Serial.println("");
        return SHELL_RET_FAILURE;
    }
    int pin = atoi(argv[1]);
    if (!strcmp(argv[2], (const char*)"HIGH"))
        digitalWrite(pin, HIGH);
    else if (!strcmp(argv[2], (const char*)"LOW"))
        digitalWrite(pin, LOW);
    return SHELL_RET_SUCCESS;
}

int shell_reader(char* data) {
    if (Serial.available()) {
        *data = Serial.read();
        return 1;
    }
    return 0;
}

void shell_writer(char data) {}
