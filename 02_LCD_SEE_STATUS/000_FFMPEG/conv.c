#include <stdio.h>
#include <assert.h>
#include <stdint.h>

uint16_t rgb888torgb565(uint8_t *rgb888Pixel)
{
    uint8_t red   = rgb888Pixel[0];
    uint8_t green = rgb888Pixel[1];
    uint8_t blue  = rgb888Pixel[2];

    uint16_t b = (blue >> 3) & 0x1f;
    uint16_t g = ((green >> 2) & 0x3f) << 5;
    uint16_t r = ((red >> 3) & 0x1f) << 11;

    return (uint16_t) (r | g | b);
}

int main(void) {

  FILE *fb = fopen("noc1.raw", "rb");
  assert(fb);

  FILE *tmp = fopen("noc1_rgb565.raw", "wb");
  assert(tmp);

  uint8_t i[3];
  while (!feof(fb)) {
    fread(i, sizeof(uint8_t), 3, fb);
    uint16_t x = rgb888torgb565(i);
    fwrite(&x, sizeof(uint16_t), 1, tmp);
  }

  fclose(fb);
  fclose(tmp);

  return 0;
}
