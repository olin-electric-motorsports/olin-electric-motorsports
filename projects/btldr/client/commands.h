#include <stdint.h>

#include "can_client.h"

int cmd_flash(struct CanClient* client, uint8_t ecu_id, char* binary_path);
int cmd_ping(struct CanClient* client, uint8_t ecu_id, uint8_t* current_image);
