#include "display.h"

#include "patterns.h"
#include "font.h"

extern "C"
{
  void genPattern();
}

void setup() {
  display_setup();
  Serial.begin(115200);
  genPattern();
}

const static int STEP = 16; // 16 makes 12 bit colour

char gen_r[DISPLAY_WIDTH*DISPLAY_HEIGHT];
char gen_g[DISPLAY_WIDTH*DISPLAY_HEIGHT];
char gen_b[DISPLAY_WIDTH*DISPLAY_HEIGHT];

int step = 0;
int step2 = 0;

int results[] = {
  50, // labour
  50, // COnservative
  50, // UKIP
  50, // Green
  50, // LibDem
};

uint8_t scratch_ptr = 0;
bool haveSync = false;
int scratch[sizeof(results)/sizeof(results[0])];

const static int requiredSeats = 326;

void genPattern()
{
  for(int y = 0; y < DISPLAY_HEIGHT;++y)
   {
    for(int x = 0; x < DISPLAY_WIDTH;++x)
    {
      if(y < DISPLAY_HEIGHT/5)
      {
        // Labour Red
        if(x < (results[0]*DISPLAY_WIDTH)/requiredSeats)
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0xDC;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x24;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x1f;
        }
        else
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x00;
        }
      }
      else if(y < 2*DISPLAY_HEIGHT/5)
      {
        if(x < (results[1]*DISPLAY_WIDTH)/requiredSeats)
        {
          //Conservative Blue
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x87;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0xDC;
        }
        else
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x00;
        }
      }
      else if(y < 3*DISPLAY_HEIGHT/5)
      {
        if(x < (results[2]*DISPLAY_WIDTH)/requiredSeats)
        {
          //UKIP Purple
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x70;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x14;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x7A;
        }
        else
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x00;
        }
      }
      else if(y < 4*DISPLAY_HEIGHT/5)
      {
        if(x < (results[3]*DISPLAY_WIDTH)/requiredSeats)
        {
          // Green
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x78;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0xB9;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x43;
        }
        else
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x00;
        }
      }
      else
      {
        if(x < (results[4]*DISPLAY_WIDTH)/requiredSeats)
        {
          // liberal democrat orange
          gen_r[(y*DISPLAY_WIDTH)+x] = 0xFD;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0xBB;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x30;
        }
        else
        {
          gen_r[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_g[(y*DISPLAY_WIDTH)+x] = 0x00;
          gen_b[(y*DISPLAY_WIDTH)+x] = 0x00;
        }
      }
    }
   }
}



unsigned long time;
void loop()
{
  //digitalWriteFast(pin_oe,HIGH);
  if(Serial.available())
  {
    char temp = Serial.read();
    
    if(temp == 0xff)
    {
      scratch_ptr = 0;
      haveSync = true;
    }
    else if(haveSync)
    {
      scratch[scratch_ptr++] = temp;
    }
    else
    {
      Serial.write("Got Junk\n");
    }
    if(scratch_ptr >= (sizeof(results)/sizeof(results[0])))
    {
      //end of results sequence
      scratch_ptr = 0;
      memcpy(results, scratch, sizeof(results));
      genPattern();
      haveSync = false;
      char formTemp[255];
   sprintf(formTemp, "Scratch: L: %d c: %d ukip: %d green: %d LD: %d\n", scratch[0], scratch[1], scratch[2], scratch[3], scratch[4]);
   Serial.write(formTemp);
   sprintf(formTemp, "Result: L: %d c: %d ukip: %d green: %d LD: %d\n", results[0], results[1], results[2], results[3], results[4]);
   Serial.write(formTemp);
      Serial.write("Received Data\n");
    }
  }
  //digitalWriteFast(pin_oe,LOW);
   //Serial.flush();
   for(int i=0;i<256;i += STEP)
   {
    display_write(gen_r, gen_g, gen_b, i);
   }
   Serial.flush();
}
