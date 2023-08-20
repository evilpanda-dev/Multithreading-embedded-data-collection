#include "vt.h"
#include "gx.h"

#ifdef __AVR__
#include <avr/io.h>
#include <avr/pgmspace.h>
#else
#define pgm_read_byte(addr)	(*(const u8*)(addr))
#define PROGMEM
#endif

static const u8 font_4x6[];
static void drawglyph_mini(const u8* chr, const u16 fg, const u16 bg,
		const u16 x, const u16 y);

static void drawglyph_mini(const u8* chr, const u16 fg, const u16 bg,
		u16 x, u16 y)
{
	u8 n;
	u8 c;
	u8 t = 0;
	GX_begin(x, y, FONT_WIDTH, FONT_HEIGHT);
	for(n = 0; n < 6; n++) {
		c = pgm_read_byte(chr);
		if(n & 0x01)
			chr++;
		if(t)
			c &= 0x0F;
		else
			c >>= 4;
		t = !t;
		GX_pixel(c & 0x08 ? fg : bg);
		GX_pixel(c & 0x04 ? fg : bg);
		GX_pixel(c & 0x02 ? fg : bg);
		GX_pixel(c & 0x01 ? fg : bg);
	}
	GX_end();
}

void drawchar_mini(const char c, const u16 fg, const u16 bg, const u16 x,
		const u16 y)
{
	drawglyph_mini(&font_4x6[c * 3], fg, bg, x, y);
}

static const u8 font_4x6[0x300] PROGMEM = {
	0xee, 0xee, 0xe0, // 0x00
	0xee, 0xee, 0xe0, // 0x01
	0xee, 0xee, 0xe0, // 0x02
	0xee, 0xee, 0xe0, // 0x03
	0xee, 0xee, 0xe0, // 0x04
	0xee, 0xee, 0xe0, // 0x05
	0xee, 0xee, 0xe0, // 0x06
	0xee, 0xee, 0xe0, // 0x07
	0xee, 0xee, 0xe0, // 0x08
	0xee, 0xee, 0xe0, // 0x09
	0xee, 0xee, 0xe0, // 0x0A
	0xee, 0xee, 0xe0, // 0x0B
	0xee, 0xee, 0xe0, // 0x0C
	0xee, 0xee, 0xe0, // 0x0D
	0xee, 0xee, 0xe0, // 0x0E
	0xee, 0xee, 0xe0, // 0x0F
	0xee, 0xee, 0xe0, // 0x10
	0xee, 0xee, 0xe0, // 0x11
	0xee, 0xee, 0xe0, // 0x12
	0xee, 0xee, 0xe0, // 0x13
	0xee, 0xee, 0xe0, // 0x14
	0xee, 0xee, 0xe0, // 0x15
	0xee, 0xee, 0xe0, // 0x16
	0xee, 0xee, 0xe0, // 0x17
	0xee, 0xee, 0xe0, // 0x18
	0xee, 0xee, 0xe0, // 0x19
	0xee, 0xee, 0xe0, // 0x1A
	0xee, 0xee, 0xe0, // 0x1B
	0xee, 0xee, 0xe0, // 0x1C
	0xee, 0xee, 0xe0, // 0x1D
	0xee, 0xee, 0xe0, // 0x1E
	0xee, 0xee, 0xe0, // 0x1F
	0x00, 0x00, 0x00, // 0x20: SP
	0x44, 0x40, 0x40, // 0x21: '!'
	0xAA, 0x00, 0x00, // 0x22: '"'
	0xAF, 0xFA, 0x00, // 0x23: '#'
	0x46, 0xEC, 0x40, // 0x24: '$'
	0xA2, 0x48, 0xA0, // 0x25: '%'
	0x69, 0x6A, 0xD0, // 0x26: '&'
	0x24, 0x00, 0x00, // 0x27: '''
	0x24, 0x44, 0x20, // 0x28: '('
	0x42, 0x22, 0x40, // 0x29: ')'
	0x0E, 0xEE, 0x00, // 0x2A: '*'
	0x04, 0xE4, 0x00, // 0x2B: '+'
	0x00, 0x04, 0x80, // 0x2C: ','
	0x00, 0xE0, 0x00, // 0x2D: '-'
	0x00, 0x00, 0x40, // 0x2E: '.'
	0x02, 0x48, 0x00, // 0x2F: '/'
	0x4A, 0xAA, 0x40, // 0x30: '0'
	0x4C, 0x44, 0xE0, // 0x31: '1'
	0xC2, 0x48, 0xE0, // 0x32: '2'
	0xE2, 0x62, 0xE0, // 0x33: '3'
	0xAA, 0xE2, 0x20, // 0x34: '4'
	0xE8, 0xE2, 0xE0, // 0x35: '5'
	0xE8, 0xEA, 0xE0, // 0x36: '6'
	0xE2, 0x22, 0x20, // 0x37: '7'
	0xEA, 0xEA, 0xE0, // 0x38: '8'
	0xEA, 0xE2, 0x20, // 0x39: '9'
	0x00, 0x40, 0x40, // 0x3A: ':'
	0x00, 0x40, 0x48, // 0x3B: ';'
	0x24, 0x84, 0x20, // 0x3C: '<'
	0x0E, 0x0E, 0x00, // 0x3D: '='
	0x84, 0x24, 0x80, // 0x3E: '>'
	0xE2, 0x60, 0x40, // 0x3F: '?'
	0x4E, 0xE8, 0x40, // 0x40: '@'
	0x4A, 0xEA, 0xA0, // 0x41: 'A'
	0xCA, 0xCA, 0xC0, // 0x42: 'B'
	0x68, 0x88, 0x60, // 0x43: 'C'
	0xCA, 0xAA, 0xC0, // 0x44: 'D'
	0xE8, 0xE8, 0xE0, // 0x45: 'E'
	0xE8, 0xE8, 0x80, // 0x46: 'F'
	0x68, 0xEA, 0x60, // 0x47: 'G'
	0xAA, 0xEA, 0xA0, // 0x48: 'H'
	0xE4, 0x44, 0xE0, // 0x49: 'I'
	0x22, 0x2A, 0x40, // 0x4A: 'J'
	0xAA, 0xCA, 0xA0, // 0x4B: 'K'
	0x88, 0x88, 0xE0, // 0x4C: 'L'
	0xAE, 0xEA, 0xA0, // 0x4D: 'M'
	0xAE, 0xEE, 0xA0, // 0x4E: 'N'
	0x4A, 0xAA, 0x40, // 0x4F: 'O'
	0xCA, 0xC8, 0x80, // 0x50: 'P'
	0x4A, 0xAE, 0x60, // 0x51: 'Q'
	0xCA, 0xEC, 0xA0, // 0x52: 'R'
	0x68, 0x42, 0xC0, // 0x53: 'S'
	0xE4, 0x44, 0x40, // 0x54: 'T'
	0xAA, 0xAA, 0x60, // 0x55: 'U'
	0xAA, 0xA4, 0x40, // 0x56: 'V'
	0xAA, 0xEE, 0xA0, // 0x57: 'W'
	0xAA, 0x4A, 0xA0, // 0x58: 'X'
	0xAA, 0x44, 0x40, // 0x59: 'Y'
	0xE2, 0x48, 0xE0, // 0x5A: 'Z'
	0x64, 0x44, 0x60, // 0x5B: '['
	0x08, 0x42, 0x00, // 0x5C: '\'
	0x62, 0x22, 0x60, // 0x5D: ']'
	0x4A, 0x00, 0x00, // 0x5E: '^'
	0x00, 0x00, 0x0F, // 0x5F: '_'
	0x84, 0x00, 0x00, // 0x60: '`'
	0x00, 0x6A, 0xE0, // 0x61: 'a'
	0x88, 0xCA, 0xC0, // 0x62: 'b'
	0x00, 0x68, 0x60, // 0x63: 'c'
	0x22, 0x6A, 0x60, // 0x64: 'd'
	0x0E, 0xE8, 0x60, // 0x65: 'e'
	0x24, 0xE4, 0x40, // 0x66: 'f'
	0x06, 0xA6, 0xE0, // 0x67: 'g'
	0x88, 0xCA, 0xA0, // 0x68: 'h'
	0x40, 0x44, 0x40, // 0x69: 'i'
	0x40, 0x44, 0x80, // 0x6A: 'j'
	0x08, 0xAC, 0xA0, // 0x6B: 'k'
	0x0C, 0x44, 0xE0, // 0x6C: 'l'
	0x00, 0xEE, 0xA0, // 0x6D: 'm'
	0x00, 0xCA, 0xA0, // 0x6E: 'n'
	0x04, 0xAA, 0x40, // 0x6F: 'o'
	0x00, 0xCA, 0xC8, // 0x70: 'p'
	0x00, 0x6A, 0x62, // 0x71: 'q'
	0x0C, 0xA8, 0x80, // 0x72: 'r'
	0x06, 0xC2, 0xC0, // 0x73: 's'
	0x04, 0xE4, 0x40, // 0x74: 't'
	0x00, 0xAA, 0x60, // 0x75: 'u'
	0x00, 0xAE, 0x40, // 0x76: 'v'
	0x00, 0xAE, 0xE0, // 0x77: 'w'
	0x00, 0xA4, 0xA0, // 0x78: 'x'
	0x00, 0xAE, 0x2C, // 0x79: 'y'
	0x0E, 0x6C, 0xE0, // 0x7A: 'z'
	0x24, 0xC4, 0x20, // 0x7B: '{'
	0x44, 0x04, 0x40, // 0x7C: '|'
	0x84, 0x64, 0x80, // 0x7D: '}'
	0x5A, 0x00, 0x00, // 0x7E: '~'
	0x4A, 0xAE, 0x00, // 0x7F
	0xEE, 0xEE, 0xE0, // 0x80
	0xEE, 0xEE, 0xE0, // 0x81
	0xEE, 0xEE, 0xE0, // 0x82
	0xEE, 0xEE, 0xE0, // 0x83
	0xEE, 0xEE, 0xE0, // 0x84
	0xEE, 0xEE, 0xE0, // 0x85
	0xEE, 0xEE, 0xE0, // 0x86
	0xEE, 0xEE, 0xE0, // 0x87
	0xEE, 0xEE, 0xE0, // 0x88
	0xEE, 0xEE, 0xE0, // 0x89
	0xEE, 0xEE, 0xE0, // 0x8A
	0xEE, 0xEE, 0xE0, // 0x8B
	0xEE, 0xEE, 0xE0, // 0x8C
	0xEE, 0xEE, 0xE0, // 0x8D
	0xEE, 0xEE, 0xE0, // 0x8E
	0xEE, 0xEE, 0xE0, // 0x8F
	0xEE, 0xEE, 0xE0, // 0x90
	0xEE, 0xEE, 0xE0, // 0x91
	0xEE, 0xEE, 0xE0, // 0x92
	0xEE, 0xEE, 0xE0, // 0x93
	0xEE, 0xEE, 0xE0, // 0x94
	0xEE, 0xEE, 0xE0, // 0x95
	0xEE, 0xEE, 0xE0, // 0x96
	0xEE, 0xEE, 0xE0, // 0x97
	0xEE, 0xEE, 0xE0, // 0x98
	0xEE, 0xEE, 0xE0, // 0x99
	0xEE, 0xEE, 0xE0, // 0x9A
	0xEE, 0xEE, 0xE0, // 0x9B
	0xEE, 0xEE, 0xE0, // 0x9C
	0xEE, 0xEE, 0xE0, // 0x9D
	0xEE, 0xEE, 0xE0, // 0x9E
	0xEE, 0xEE, 0xE0, // 0x9F
	0xEE, 0xEE, 0xE0, // 0xA0
	0xEE, 0xEE, 0xE0, // 0xA1: '¡'
	0xEE, 0xEE, 0xE0, // 0xA2: '¢'
	0xEE, 0xEE, 0xE0, // 0xA3: '£'
	0xEE, 0xEE, 0xE0, // 0xA4: '¤'
	0xEE, 0xEE, 0xE0, // 0xA5: '¥'
	0xEE, 0xEE, 0xE0, // 0xA6: '¦'
	0xEE, 0xEE, 0xE0, // 0xA7: '§'
	0xEE, 0xEE, 0xE0, // 0xA8: '¨'
	0xEE, 0xEE, 0xE0, // 0xA9: '©'
	0xEE, 0xEE, 0xE0, // 0xAA: 'ª'
	0xEE, 0xEE, 0xE0, // 0xAB: '«'
	0xEE, 0xEE, 0xE0, // 0xAC: '¬'
	0xEE, 0xEE, 0xE0, // 0xAD: '­'
	0x06, 0xC6, 0x00, // 0xAE: '®'
	0x0C, 0x6C, 0x00, // 0xAF: '¯'
	0x82, 0x82, 0x82, // 0xB0: '°'
	0xA5, 0xA5, 0xA5, // 0xB1: '±'
	0xDB, 0xDB, 0xDB, // 0xB2: '²'
	0x44, 0x44, 0x44, // 0xB3: '³'
	0x44, 0xC4, 0x44, // 0xB4: '´'
	0x44, 0xCC, 0x44, // 0xB5: 'µ'
	0x66, 0xE6, 0x66, // 0xB6: '¶'
	0x00, 0xE6, 0x66, // 0xB7: '·'
	0x00, 0xCC, 0x44, // 0xB8: '¸'
	0x66, 0xEE, 0x66, // 0xB9: '¹'
	0x66, 0x66, 0x66, // 0xBA: 'º'
	0x00, 0xEE, 0x66, // 0xBB: '»'
	0x66, 0xEE, 0x00, // 0xBC: '¼'
	0x66, 0xE0, 0x00, // 0xBD: '½'
	0x44, 0xCC, 0x00, // 0xBE: '¾'
	0x00, 0xC4, 0x44, // 0xBF: '¿'
	0x44, 0x70, 0x00, // 0xC0: 'À'
	0x44, 0xF0, 0x00, // 0xC1: 'Á'
	0x00, 0xF4, 0x44, // 0xC2: 'Â'
	0x44, 0x74, 0x44, // 0xC3: 'Ã'
	0x00, 0xF0, 0x00, // 0xC4: 'Ä'
	0x44, 0xF4, 0x44, // 0xC5: 'Å'
	0x44, 0x77, 0x44, // 0xC6: 'Æ'
	0x66, 0x76, 0x66, // 0xC7: 'Ç'
	0x66, 0x77, 0x00, // 0xC8: 'È'
	0x00, 0x77, 0x66, // 0xC9: 'É'
	0x66, 0xFF, 0x00, // 0xCA: 'Ê'
	0x00, 0xFF, 0x66, // 0xCB: 'Ë'
	0x66, 0x77, 0x66, // 0xCC: 'Ì'
	0x00, 0xFF, 0x00, // 0xCD: 'Í'
	0x66, 0xFF, 0x66, // 0xCE: 'Î'
	0x44, 0xFF, 0x00, // 0xCF: 'Ï'
	0x66, 0xF0, 0x00, // 0xD0: 'Ð'
	0x00, 0xFF, 0x44, // 0xD1: 'Ñ'
	0x00, 0xF6, 0x66, // 0xD2: 'Ò'
	0x66, 0x70, 0x00, // 0xD3: 'Ó'
	0x44, 0x77, 0x00, // 0xD4: 'Ô'
	0x00, 0x77, 0x44, // 0xD5: 'Õ'
	0x00, 0x76, 0x66, // 0xD6: 'Ö'
	0x66, 0xF6, 0x66, // 0xD7: '×'
	0x44, 0xFF, 0x44, // 0xD8: 'Ø'
	0x44, 0xC0, 0x00, // 0xD9: 'Ù'
	0x00, 0x74, 0x44, // 0xDA: 'Ú'
	0xFF, 0xFF, 0xFF, // 0xDB: 'Û'
	0x00, 0x0F, 0xFF, // 0xDC: 'Ü'
	0xCC, 0xCC, 0xCC, // 0xDD: 'Ý'
	0x33, 0x33, 0x33, // 0xDE: 'Þ'
	0xFF, 0xF0, 0x00, // 0xDF: 'ß'
	0xEE, 0xEE, 0xE0, // 0xE0: 'à'
	0xEE, 0xEE, 0xE0, // 0xE1: 'á'
	0xEE, 0xEE, 0xE0, // 0xE2: 'â'
	0xEE, 0xEE, 0xE0, // 0xE3: 'ã'
	0xEE, 0xEE, 0xE0, // 0xE4: 'ä'
	0xEE, 0xEE, 0xE0, // 0xE5: 'å'
	0xEE, 0xEE, 0xE0, // 0xE6: 'æ'
	0xEE, 0xEE, 0xE0, // 0xE7: 'ç'
	0xEE, 0xEE, 0xE0, // 0xE8: 'è'
	0xEE, 0xEE, 0xE0, // 0xE9: 'é'
	0xEE, 0xEE, 0xE0, // 0xEA: 'ê'
	0xEE, 0xEE, 0xE0, // 0xEB: 'ë'
	0xEE, 0xEE, 0xE0, // 0xEC: 'ì'
	0xEE, 0xEE, 0xE0, // 0xED: 'í'
	0xEE, 0xEE, 0xE0, // 0xEE: 'î'
	0xEE, 0xEE, 0xE0, // 0xEF: 'ï'
	0xEE, 0xEE, 0xE0, // 0xF0: 'ð'
	0xEE, 0xEE, 0xE0, // 0xF1: 'ñ'
	0xEE, 0xEE, 0xE0, // 0xF2: 'ò'
	0xEE, 0xEE, 0xE0, // 0xF3: 'ó'
	0xEE, 0xEE, 0xE0, // 0xF4: 'ô'
	0xEE, 0xEE, 0xE0, // 0xF5: 'õ'
	0xEE, 0xEE, 0xE0, // 0xF6: 'ö'
	0xEE, 0xEE, 0xE0, // 0xF7: '÷'
	0xEE, 0xEE, 0xE0, // 0xF8: 'ø'
	0xEE, 0xEE, 0xE0, // 0xF9: 'ù'
	0xEE, 0xEE, 0xE0, // 0xFA: 'ú'
	0xEE, 0xEE, 0xE0, // 0xFB: 'û'
	0xEE, 0xEE, 0xE0, // 0xFC: 'ü'
	0xEE, 0xEE, 0xE0, // 0xFD: 'ý'
	0x00, 0x66, 0x00, // 0xFE: 'þ'
	0xEE, 0xEE, 0xE0  // 0xFF: 'ÿ'
};