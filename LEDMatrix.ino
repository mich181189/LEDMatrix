#include "display.h"

#include "patterns.h"

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
      if(step == y)
      {
        gen_r[px] = 255;
      }
      else
      {
        gen_r[px] /= 2;
      }
      if(step == x)
      {
        gen_b[px] = 255;
      }
      else
      {
        gen_b[px] /= 2;
      }
      if((DISPLAY_WIDTH-x) == step)
      {
          gen_g[px] = 255;
      }
      else
      {
        gen_g[px] /= 2;
      }

     if(abs(x-DISPLAY_WIDTH) - abs(y-DISPLAY_WIDTH) == 5)
     {  
        gen_g[px] = 255;
     }
      ++px;
    }
   }
   
   if(step2 == 1)
   {
    --step;
    if(step <= 0)
     {
      step2 = 0;
     }
   }
   else
   {
    ++step;
    if(step >= DISPLAY_WIDTH)
    {
     step2 = 1;
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
