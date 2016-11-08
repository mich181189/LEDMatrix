#include "core_pins.h"

#include "display.h"
#include "display_pins.h"

void display_setup()
{
  pinMode(pin_r1, OUTPUT);
  pinMode(pin_b1, OUTPUT);
  pinMode(pin_r2, OUTPUT);
  pinMode(pin_b2, OUTPUT);
  pinMode(pin_a, OUTPUT);
  pinMode(pin_c, OUTPUT);
  pinMode(pin_clk, OUTPUT);
  pinMode(pin_oe, OUTPUT);
  
  pinMode(pin_lat, OUTPUT);
  pinMode(pin_d, OUTPUT);
  pinMode(pin_b, OUTPUT);
  pinMode(pin_g2, OUTPUT);
  pinMode(pin_g1, OUTPUT);

  digitalWriteFast(pin_lat,LOW);
  digitalWriteFast(pin_clk,LOW);
  digitalWriteFast(pin_oe,LOW);
}

void display_clock()
{
  digitalWriteFast(pin_clk, HIGH);
  digitalWriteFast(pin_clk, LOW);
}

void display_latch()
{
  digitalWriteFast(pin_lat, HIGH);
  digitalWriteFast(pin_lat, LOW);
}

void display_select_row(uint8_t row)
{
  digitalWriteFast(pin_a, ((row & 1) == 1));
  digitalWriteFast(pin_b, ((row & 2) == 2));
  digitalWriteFast(pin_c, ((row & 4) == 4));
  if(DISPLAY_HEIGHT > 16)
  {
    digitalWriteFast(pin_d, ((row & 8) == 8));
  }
}

#define INT2BIT(X) ((X) == 0 ? LOW : HIGH)

void display_output_enable(int enabled)
{
  digitalWriteFast(pin_oe, !INT2BIT(enabled));
}

void display_write_px(int r1, int g1, int b1, int r2, int g2, int b2)
{
  digitalWriteFast(pin_r1, INT2BIT(r1));
  digitalWriteFast(pin_g1, INT2BIT(g1));
  digitalWriteFast(pin_b1, INT2BIT(b1));
  digitalWriteFast(pin_r2, INT2BIT(r2));
  digitalWriteFast(pin_g2, INT2BIT(g2));
  digitalWriteFast(pin_b2, INT2BIT(b2));
  display_clock();
}

void display_write(const char* redData, const char* greenData, const char* blueData, uint8_t threshold)
{
  const char* redPtr1 = redData;
  const char* greenPtr1 = greenData;
  const char* bluePtr1 = blueData;
  const char* redPtr2 = redData + (DISPLAY_WIDTH*(DISPLAY_HEIGHT/2));
  const char* greenPtr2 = greenData + (DISPLAY_WIDTH*(DISPLAY_HEIGHT/2));
  const char* bluePtr2 = blueData + (DISPLAY_WIDTH*(DISPLAY_HEIGHT/2));
  int x,y;
  
  for(y = 0; y < (DISPLAY_HEIGHT/2); ++y)
  {
    for(x = 0; x < DISPLAY_WIDTH; ++x)
    {
      display_write_px((*redPtr1 > threshold) ? 1 : 0, (*greenPtr1 > threshold) ? 1 : 0, (*bluePtr1 > threshold) ? 1 : 0,
        (*redPtr2 > threshold) ? 1 : 0, (*greenPtr2 > threshold) ? 1 : 0, (*bluePtr2 > threshold) ? 1 : 0);

      ++redPtr1;
      ++greenPtr1;
      ++bluePtr1;
      ++redPtr2;
      ++greenPtr2;
      ++bluePtr2;
    }
    display_output_enable(0);
    display_select_row(y);
    display_latch();
    display_output_enable(1);
  }
}

