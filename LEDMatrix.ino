#include "display.h"

#include "patterns.h"
#include "font.h"

void setup() {
  display_setup();
  Serial.begin(115200);
}

const static int STEP = 16; // 16 makes 12 bit colour

char gen_r[DISPLAY_WIDTH*DISPLAY_HEIGHT];
char gen_g[DISPLAY_WIDTH*DISPLAY_HEIGHT];
char gen_b[DISPLAY_WIDTH*DISPLAY_HEIGHT];

int step = 0;
int step2 = 0;

void genPattern()
{
    int px = 0;
   for(int y = 0; y < DISPLAY_HEIGHT;++y)
   {
    for(int x = 0; x < DISPLAY_WIDTH;++x)
    {
      int font_x = x % fontWidth;
      int font_y = y % (fontHeight+1);
      if(font_y == fontHeight)
      {
        gen_r[(y*DISPLAY_WIDTH)+x] = 0;
      }
      else
      {
        gen_r[(y*DISPLAY_WIDTH)+x] = letterT[(font_y*fontWidth)+font_x];
      }
      
    }
   }
}



unsigned long time;

extern "C"
{
  void timingStart();
  void timingEnd();
}

void timingStart()
{
  time = micros();
}

void timingEnd()
{
  Serial.println(micros()-time, DEC);
}

void loop()
{
  digitalWriteFast(pin_oe,HIGH);
  timingStart();
  genPattern();
  timingEnd();
  digitalWriteFast(pin_oe,LOW);
   //Serial.flush();
   for(int i=0;i<256;i += STEP)
   {
    display_write(gen_r, gen_g, gen_b, i);
   }
   
}
