# 1 "key.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "key.c"
# 1 "key.h" 1
# 1 "sprites.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;

typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 41 "gba.h"
void waitForVBlank();
# 58 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 74 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 106 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 5 "sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
} SPRITE;
# 2 "key.h" 2

typedef struct {
    int active;
    int hide;
    int oamSpace;
    int depth;
} KEY;

void initKeys();
void updateKeys();
void drawKeys();


KEY keys[2];
# 2 "key.c" 2

KEY keys[2];

enum {KEY_ROOM_1_X = 48, KEY_ROOM_1_Y = 64, KEY_ROOM_2_X = 64, KEY_ROOM_2_Y = 72, KEY_ROOM_3_X = 72, KEY_ROOM_3_Y = 72};


void initKeys() {
    for (int i = 0; i < 2; i++) {
        keys[i].active = 1;
        keys[i].hide = 1;
        keys[i].oamSpace = 40;
    }
}



void drawKeys() {
    for (int i = 0; i < 2; i++) {
        if (!keys[i].hide && keys[i].active) {
            mgba_printf("drawing key");
            if (keys[i].depth == 1) {
                shadowOAM[keys[i].oamSpace + i].attr0 = (0<<13) | (2<<14) | ((KEY_ROOM_1_Y) & 0xFF);
                shadowOAM[keys[i].oamSpace + i].attr1 = (2<<14) | ((KEY_ROOM_1_X) & 0x1FF);
                shadowOAM[keys[i].oamSpace + i].attr2 = (((0) & 0xF) << 12) | (((5) * 32 + (24)) & 0x3FF);
            } else if (keys[i].depth == 2) {
                shadowOAM[keys[i].oamSpace + i].attr0 = (0<<13) | (2<<14) | ((KEY_ROOM_2_Y) & 0xFF);
                shadowOAM[keys[i].oamSpace + i].attr1 = (1<<14) | ((KEY_ROOM_2_X) & 0x1FF);
                shadowOAM[keys[i].oamSpace + i].attr2 = (((0) & 0xF) << 12) | (((5) * 32 + (23)) & 0x3FF);
            } else if (keys[i].depth == 3) {
                shadowOAM[keys[i].oamSpace + i].attr0 = (0<<13) | (2<<14) | ((KEY_ROOM_3_Y) & 0xFF);
                shadowOAM[keys[i].oamSpace + i].attr1 = (0<<14) | ((KEY_ROOM_3_X) & 0x1FF);
                shadowOAM[keys[i].oamSpace + i].attr2 = (((0) & 0xF) << 12) | (((7) * 32 + (22)) & 0x3FF);
            }
        } else if (!keys[i].active) {
            shadowOAM[keys[i].oamSpace + i].attr0 = (0<<13) | (2<<14) | ((60) & 0xFF);
            shadowOAM[keys[i].oamSpace + i].attr1 = (2<<14) | ((180 + i * 20) & 0x1FF);
            shadowOAM[keys[i].oamSpace + i].attr2 = (((0) & 0xF) << 12) | (((5) * 32 + (24)) & 0x3FF);
        } else {
            shadowOAM[keys[i].oamSpace + 1].attr0 = (2<<8);
        }
    }
}
