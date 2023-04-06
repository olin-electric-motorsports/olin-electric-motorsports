#include <stdint.h>

void tunables_init(uint16_t ecu_id, void* tunables_data, size_t num_tunables);

void tunables_loop(void* tunables_data, size_t num_tunables);
