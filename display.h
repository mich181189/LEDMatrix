#ifndef DISPLAY_H
#define DISPLAY_H

#ifdef __cplusplus
extern "C" {
#endif


void display_setup();
void display_select_row(const int row);

void display_write(const char* redData, const char* greenData, const char* blueData, uint8_t threshold);
//void display_write(uint8_t threshold);

#ifdef __cplusplus
}
#endif

#endif


