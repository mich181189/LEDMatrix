#include "display.h"

#include "patterns.h"

char dataA[DISPLAY_WIDTH*DISPLAY_HEIGHT*3];
char dataB[DISPLAY_WIDTH*DISPLAY_HEIGHT*3];

char* currentData;
char* scratchData;
size_t writePos;

void setup() {
  memcpy(dataA, pattern1_r, DISPLAY_WIDTH*DISPLAY_HEIGHT);
  memcpy(dataA+(DISPLAY_WIDTH*DISPLAY_HEIGHT), pattern1_g, DISPLAY_WIDTH*DISPLAY_HEIGHT);
  memcpy(dataA+(2*DISPLAY_WIDTH*DISPLAY_HEIGHT), pattern1_b, DISPLAY_WIDTH*DISPLAY_HEIGHT);
  
  display_setup();
  Serial.begin(115200);
  currentData = dataA;
  scratchData = dataB;
  writePos = 0;
}

const static int STEP = 16; // 16 makes 12 bit colour

void loop() {
   for(int i=0;i<256;i += STEP)
   {
    display_write(currentData, currentData+(DISPLAY_WIDTH*DISPLAY_HEIGHT), currentData+(DISPLAY_WIDTH*DISPLAY_HEIGHT*2), i);
   }

   while(Serial.available())
   {
      char b = Serial.read();
      if(b == -1)
      {
        // bail
        writePos = 0;
      }
      else
      {
        scratchData[writePos] = b;
        if(++writePos >= (DISPLAY_WIDTH*DISPLAY_HEIGHT*3))
        {
          writePos = 0;
          char* buf = currentData;
          currentData = scratchData;
          scratchData = buf;
        }
      }
   }
}
