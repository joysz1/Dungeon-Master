# 1 "enemy.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemy.c"
# 1 "enemy.h" 1
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
# 2 "enemy.h" 2

typedef struct {
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int oamSpace;
    int depth;
    int health;
} ENEMY;

void initEnemies();
void updateEnemies();
void drawEnemies();


ENEMY enemies[10];
# 2 "enemy.c" 2

ENEMY enemies[10];

enum {ENEMY_ROOM_1_X = 68, ENEMY_ROOM_1_Y = 64, ENEMY_ROOM_2_X = 72, ENEMY_ROOM_2_Y = 72, ENEMY_ROOM_3_X = 74, ENEMY_ROOM_3_Y = 78};

void initEnemies() {
    for (int i = 0; i < 10; i++) {
        enemies[i].active = 1;
        enemies[i].hide = 1;
        enemies[i].timeUntilNextFrame = 20;
        enemies[i].frame = 0;
        enemies[i].numOfFrames = 3;
        enemies[i].oamSpace = 20 + i;
        enemies[i].health = 9;
    }
}



void drawEnemies() {
    for (int i = 0; i < 10; i++) {
        if (!enemies[i].hide && enemies[i].health > -1) {
            if (enemies[i].depth == 1) {
                shadowOAM[enemies[i].oamSpace].attr0 = (0<<13) | (2<<14) | ((ENEMY_ROOM_1_Y) & 0xFF);
                shadowOAM[enemies[i].oamSpace].attr1 = (3<<14) | ((ENEMY_ROOM_1_X) & 0x1FF);
                shadowOAM[enemies[i].oamSpace].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (enemies[i].frame * 4)) & 0x3FF);
            } else if (enemies[i].depth == 2) {
                shadowOAM[enemies[i].oamSpace].attr0 = (0<<13) | (2<<14) | ((ENEMY_ROOM_2_Y) & 0xFF);
                shadowOAM[enemies[i].oamSpace].attr1 = (2<<14) | ((ENEMY_ROOM_2_X) & 0x1FF);
                shadowOAM[enemies[i].oamSpace].attr2 = (((0) & 0xF) << 12) | (((8) * 32 + (0)) & 0x3FF);
            } else if (enemies[i].depth == 3) {
                shadowOAM[enemies[i].oamSpace].attr0 = (0<<13) | (2<<14) | ((ENEMY_ROOM_3_Y) & 0xFF);
                shadowOAM[enemies[i].oamSpace].attr1 = (0<<14) | ((ENEMY_ROOM_3_X) & 0x1FF);
                shadowOAM[enemies[i].oamSpace].attr2 = (((0) & 0xF) << 12) | (((8) * 32 + (2)) & 0x3FF);
            }
        } else {
            shadowOAM[enemies[i].oamSpace].attr0 = (2<<8);
        }
    }
}
