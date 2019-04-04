/*

Copyright (c) 2016, Jakub Strapko 
All rights reserved. 

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met: 

 * Redistributions of source code must retain the above copyright notice, 
   this list of conditions and the following disclaimer. 
 * Redistributions in binary form must reproduce the above copyright 
   notice, this list of conditions and the following disclaimer in the 
   documentation and/or other materials provided with the distribution. 
 * Neither the name of Jakub Strapko nor the names of its contributors may 
   be used to endorse or promote products derived from this software 
   without specific prior written permission. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE. 

 */
/**
 * Backlight control utility for Linux
 * by Jakub Strapko
 *
 * Installation as root:
 *  Change CONTROL definition to your device and compile:
 *    'cc -lm -o sbacklight sbacklight.c -Os -w -s -mtune=generic -fomit-frame-pointer'
 *  Place in path:
 *    'mv sbacklight /usr/local/bin'
 *  Then set owner and setuid to allow non privileged users
 *  to change backlight:
 *    'cd /usr/local/bin/'
 *    'chown root:root sbacklight'
 *    'chmod u+s sbacklight'
 *
 * Usage:
 *  Print current backlight level %:
 *    'sbacklight'
 *  Set backlight level %:
 *    'sbacklight =100'
 *  Increase backlight level %:
 *    'sbacklight +10'
 *  Decrease backlight level %:
 *    'sbacklight -10'
*/

/* Change this to your device backlight control directory */
#define CONTROL "/sys/class/backlight/acpi_video0"

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

/* This should not need to be changed */
#define MAX CONTROL "/max_brightness"
#define SET CONTROL "/brightness"
#define GET CONTROL "/actual_brightness"

float readval(const char* file){
  FILE* in = fopen(file, "rb");
  float value = 0;
  
  if(in){
    fscanf(in, "%f", &value);
    fclose(in);
  }
  return value;
}

int setval(const char* file, float value){
  FILE* out = fopen(file, "wb");
  
  if(out){
    fprintf(out, "%i", (int)ceil(value));
    fclose(out);

    return 0;
  }
  return -2;
}

int main(int argc, char** argv){
  float current = readval(GET);
  float max = readval(MAX);
  float step = max / 100;
  float value = 0;

  if(argc == 2){
    sscanf(argv[1], "%*c%f", &value);
    value *= step;
    switch(argv[1][0]){
      case '=':
        if(value > max){
          value = max;
        }else if(value < 0){
          value = 0;
        }
        break;
      case '+':
        if(current + value > max){
          value = max;
        }else{
          value += current;
        }
        break;
      case '-':
        if(current - value < 0){
          value = 0;
        }else{
          value = current - value;
        }
        break;
      default:
        return -1;
    }
    return setval(SET, value);
  }

  printf("%d\n", (int)floor((current / max) * 100.0f));
  return 0;
}

/**
 * EOF
 */
