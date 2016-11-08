#include "display.h"

#include "patterns.h"

void setup() {
  display_setup();

}

const static int STEP = 16; // 16 makes 12 bit colour

void loop() {
   for(int i=0;i<256;i += STEP)
   {
    display_write(pattern1_r, pattern1_g, pattern1_b, i);
   }
}
