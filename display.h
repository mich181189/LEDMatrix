#ifndef DISPLAY_H
#define DISPLAY_H

#ifdef __cplusplus
extern "C" {
#endif


void display_setup();

void display_clock();
void display_latch();

void display_select_row(uint8_t row);

void display_output_enable(int enabled);

void display_write_px(int r1, int g1, int b1, int r2, int g2, int b2);
void display_write(const char* redData, const char* greenData, const char* blueData, uint8_t threshold);

#ifdef __cplusplus
}
#endif

#endif

