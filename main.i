# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 50 "main.c"
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
# 51 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 52 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 53 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
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
# 54 "main.c" 2
# 1 "tilemapOne.h" 1







extern const unsigned short tilemapOneMap[4096];
# 55 "main.c" 2
# 1 "tilemapTwo.h" 1







extern const unsigned short tilemapTwoMap[4096];
# 56 "main.c" 2
# 1 "tilemapThree.h" 1







extern const unsigned short tilemapThreeMap[4096];
# 57 "main.c" 2
# 1 "tilemapFour.h" 1







extern const unsigned short tilemapFourMap[4096];
# 58 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[65536];


extern const unsigned short tilesetPal[256];
# 59 "main.c" 2
# 1 "tilemapMenu.h" 1







extern const unsigned short tilemapMenuMap[4096];
# 60 "main.c" 2
# 1 "tilemapMenuTwo.h" 1







extern const unsigned short tilemapMenuTwoMap[4096];
# 61 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 62 "main.c" 2
# 1 "game.h" 1
void initGame();
void updateGame();
void drawGame();
void drawInstructions();
void drawStart();
void drawOver();
void resetMapExtra();
void revealSecret();

extern int hasWon;
extern int hasLost;
extern int mapOneExtra;
extern int mapTwoExtra;
extern int mapThreeExtra;
extern int mapFourExtra;
int secretFound;
# 63 "main.c" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 64 "main.c" 2
# 1 "play.h" 1





typedef struct {

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[1];

void initSound();
void update();

void playSong(int);
void prevSong();
void nextSong();

extern int paused;
extern int shuffle;
extern int currentSong;

extern int minute;
extern int second;
# 65 "main.c" 2
# 1 "key.h" 1


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
# 66 "main.c" 2




void initialize();
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();
void setupInterrupts();
void interruptHandler();

enum {START, GAME, INSTRUCTIONS, PAUSE, LOSE, WIN};
int state;

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;
int BG2hOff = 0;
int BG1hOff = 0;
int vOff3 = 0;
int hasWon = 0;
int hasLost = 0;
unsigned char * spritesheetPalCopy = (unsigned char *) spritesheetPal;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
                win();
                break;
        }
# 156 "main.c"
    }
}


void initialize() {
    mgba_open();

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (3 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((24) << 8) | (3 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000C) = ((0) << 2) | ((28) << 8) | (3 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000E) = ((0) << 2) | ((16) << 8) | (3 << 14) | (0 << 7);

    goToStart();
}

void goToStart() {

    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, spritesheetPalCopy, &((u16 *)0x5000200)[0], 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);

    DMANow(3, tilemapMenuMap, &((screenblock *)0x6000000)[20], (8192) / 2);
    DMANow(3, tilemapMenuMap, &((screenblock *)0x6000000)[24], (8192) / 2);
    DMANow(3, tilemapMenuMap, &((screenblock *)0x6000000)[28], (8192) / 2);

    (*(volatile unsigned short *)0x04000012) = 320;
    (*(volatile unsigned short *)0x04000010) = 240;
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x0400001A) = 160;
    (*(volatile unsigned short *)0x04000018) = 0;

    initGame();
    setupSounds();
    setupInterrupts();
    initSound();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = START;
}

void start() {
    BG2hOff++;
    BG1hOff += 2;
    (*(volatile unsigned short *)0x04000018) = BG2hOff;
    (*(volatile unsigned short *)0x04000014) = BG1hOff;
    waitForVBlank();
    drawStart();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToInstructions();
    }
}

void goToInstructions() {
    (*(volatile unsigned short *)0x04000012) = 320;
    (*(volatile unsigned short *)0x04000010) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = INSTRUCTIONS;
}

void instructions() {
    waitForVBlank();
    drawInstructions();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void goToGame() {

    DMANow(3, tilemapOneMap, &((screenblock *)0x6000000)[20], (8192) / 2);
    DMANow(3, tilemapTwoMap, &((screenblock *)0x6000000)[24], (8192) / 2);
    DMANow(3, tilemapThreeMap, &((screenblock *)0x6000000)[28], (8192) / 2);
    DMANow(3, tilemapFourMap, &((screenblock *)0x6000000)[16], (8192) / 2);

    resetMapExtra();

    unpauseSounds();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = GAME;
}

void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    hideSprites();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }

    if (hasWon) {
        goToWin();
    }
    if (hasLost) {
        goToLose();
    }
}

void goToPause() {
    DMANow(3, tilemapMenuTwoMap, &((screenblock *)0x6000000)[20], (8192) / 2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    pauseSounds();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}

void goToLose() {
    hasLost = 0;

    DMANow(3, tilemapMenuTwoMap, &((screenblock *)0x6000000)[20], (8192) / 2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 240;

    stopSounds();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = LOSE;
}

void lose() {
    waitForVBlank();
    drawOver();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void goToWin() {

    hasWon = 0;

    DMANow(3, tilemapMenuTwoMap, &((screenblock *)0x6000000)[20], (8192) / 2);

    (*(volatile unsigned short *)0x04000012) = 160;
    (*(volatile unsigned short *)0x04000010) = 0;

    stopSounds();

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = WIN;
}

void win() {
    waitForVBlank();
    drawOver();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;

    *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    *(unsigned short*)0x4000004 = (1 << 3);

    *((ihp*)0x03007FFC) = &interruptHandler;

 *(unsigned short*)0x4000208 = 1;

}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {

        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {
                    soundA.vBlankCount = 0;
                } else {
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                    dma[1].cnt = 0;
                }
            }

        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    soundB.vBlankCount = 0;
                } else {
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                    dma[2].cnt = 0;
                }
            }

  }

 }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((2 % 4) + 3))) {
        second = (second + 1) % 60;
    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((3 % 4) + 3))) {
        minute = (minute + 1) % 100;
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;

}
