# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "player.h" 1
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
# 2 "player.h" 2
# 1 "room.h" 1
# 1 "tilemapOne.h" 1







extern const unsigned short tilemapOneMap[4096];
# 2 "room.h" 2
# 1 "tilemapOneExtra.h" 1







extern const unsigned short tilemapOneExtraMap[4096];
# 3 "room.h" 2
# 1 "tilemapTwo.h" 1







extern const unsigned short tilemapTwoMap[4096];
# 4 "room.h" 2
# 1 "tilemapTwoExtra.h" 1







extern const unsigned short tilemapTwoExtraMap[4096];
# 5 "room.h" 2
# 1 "tilemapThree.h" 1







extern const unsigned short tilemapThreeMap[4096];
# 6 "room.h" 2
# 1 "tilemapThreeExtra.h" 1







extern const unsigned short tilemapThreeExtraMap[4096];
# 7 "room.h" 2
# 1 "tilemapFour.h" 1







extern const unsigned short tilemapFourMap[4096];
# 8 "room.h" 2
# 1 "tilemapFourExtra.h" 1







extern const unsigned short tilemapFourExtraMap[4096];
# 9 "room.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 10 "room.h" 2
# 1 "enemy.h" 1
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
# 11 "room.h" 2
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
# 12 "room.h" 2

typedef struct{
    struct ROOM* front;
    struct ROOM* right;
    struct ROOM* back;
    struct ROOM* left;
    int hasFront;
    int hasRight;
    int hasBack;
    int hasLeft;
    int hasPlayer;
    int hasDoor;
    int hasSecret;
    ENEMY* enemy;
    int hasEnemy;
    int hasKey;
    KEY* key;
} ROOM;

void initRooms();
void drawRooms();
void drawRoom(ROOM* room, int depth, int direction);
int hasRoom(ROOM* room, int direction);
ROOM* nextRoom(ROOM* room, int direction);
void setOff(int depth, int hOff, int vOff);

extern int hOffZero;
extern int vOffZero;
extern int hOffOne;
extern int vOffOne;
extern int hOffTwo;
extern int vOffTwo;
extern int hOffThree;
extern int vOffThree;
int mapOneExtra;
int mapTwoExtra;
int mapThreeExtra;
int mapFourExtra;
extern ROOM rooms[];
# 3 "player.h" 2

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
# 5 "player.h" 2
# 1 "ouch.h" 1


extern const unsigned int ouch_sampleRate;
extern const unsigned int ouch_length;
extern const signed char ouch_data[];
# 6 "player.h" 2


void initPlayer();
void updatePlayer();
void drawPlayer();

typedef struct {
    ROOM* room;
    int health;
    int direction;
    int timeUntilNextAttack;
    int isBlocking;
    int timeUntilNotHurt;
    int hasBlaster;
} PLAYER;

int heartFrameCount;
int heartFrame;
int keysHave;
int lockIsNext;
extern PLAYER player;
# 2 "game.c" 2


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
# 5 "game.c" 2



enum {FRONT, RIGHT, BACK, LEFT};

int hasWon;
int hasLost;
int secretFound;

void initGame() {
    initRooms();
    initPlayer();
    initEnemies();
    initKeys();
    secretFound = 0;
}

void drawStart() {

    shadowOAM[0].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[0].attr1 = (1<<14) | ((168) & 0x1FF);
    shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((12) * 32 + (0)) & 0x3FF);
    shadowOAM[1].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[1].attr1 = (1<<14) | ((200) & 0x1FF);
    shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((12) * 32 + (4)) & 0x3FF);
    shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((148) & 0xFF);
    shadowOAM[2].attr1 = (0<<14) | ((232) & 0x1FF);
    shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((12) * 32 + (8)) & 0x3FF);


    shadowOAM[3].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[3].attr1 = (1<<14) | ((4) & 0x1FF);
    shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (0)) & 0x3FF);
    shadowOAM[4].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[4].attr1 = (1<<14) | ((36) & 0x1FF);
    shadowOAM[4].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (4)) & 0x3FF);
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateKeys();
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) && player.room == &rooms[1] && player.direction == LEFT) {
        if (secretFound) {
            player.hasBlaster = 1;
        } else {
        revealSecret();
        }
    }
    if (player.room->hasDoor) {
        hasWon = 1;
    }
    if (player.health == 0) {
        hasLost = 1;
    }
}

void drawGame() {
    hideLocks();
    drawRoom(player.room, 0, player.direction);
    drawPlayer();
    drawEnemies();
    drawKeys();

    (*(volatile unsigned short *)0x04000010) = hOffZero;
    (*(volatile unsigned short *)0x04000012) = vOffZero;
    (*(volatile unsigned short *)0x04000014) = hOffOne;
    (*(volatile unsigned short *)0x04000016) = vOffOne;
    (*(volatile unsigned short *)0x04000018) = hOffTwo;
    (*(volatile unsigned short *)0x0400001A) = vOffTwo;
    (*(volatile unsigned short *)0x0400001C) = hOffThree;
    (*(volatile unsigned short *)0x0400001E) = vOffThree;
}

void drawOver() {

    shadowOAM[3].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[3].attr1 = (1<<14) | ((4) & 0x1FF);
    shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (0)) & 0x3FF);
    shadowOAM[4].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[4].attr1 = (1<<14) | ((36) & 0x1FF);
    shadowOAM[4].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (4)) & 0x3FF);
}

void drawInstructions() {

    shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((16) & 0xFF);
    shadowOAM[0].attr1 = (2<<14) | ((24) & 0x1FF);
    shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (0)) & 0x3FF);


    shadowOAM[1].attr0 = (0<<13) | (0<<14) | ((100) & 0xFF);
    shadowOAM[1].attr1 = (2<<14) | ((24) & 0x1FF);
    shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((18) * 32 + (0)) & 0x3FF);


    shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((24) & 0xFF);
    shadowOAM[2].attr1 = (1<<14) | ((60) & 0x1FF);
    shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((15) * 32 + (4)) & 0x3FF);


    shadowOAM[3].attr0 = (0<<13) | (0<<14) | ((108) & 0xFF);
    shadowOAM[3].attr1 = (1<<14) | ((60) & 0x1FF);
    shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((15) * 32 + (4)) & 0x3FF);


    shadowOAM[4].attr0 = (0<<13) | (2<<14) | ((10) & 0xFF);
    shadowOAM[4].attr1 = (3<<14) | ((70) & 0x1FF);
    shadowOAM[4].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (26)) & 0x3FF);


    shadowOAM[5].attr0 = (0<<13) | (2<<14) | ((100) & 0xFF);
    shadowOAM[5].attr1 = (3<<14) | ((78) & 0x1FF);
    shadowOAM[5].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (21)) & 0x3FF);


    shadowOAM[6].attr0 = (0<<13) | (1<<14) | ((10) & 0xFF);
    shadowOAM[6].attr1 = (3<<14) | ((144) & 0x1FF);
    shadowOAM[6].attr2 = (((0) & 0xF) << 12) | (((17) * 32 + (12)) & 0x3FF);


    shadowOAM[7].attr0 = (0<<13) | (0<<14) | ((32) & 0xFF);
    shadowOAM[7].attr1 = (2<<14) | ((132) & 0x1FF);
    shadowOAM[7].attr2 = (((0) & 0xF) << 12) | (((13) * 32 + (7)) & 0x3FF);


    shadowOAM[8].attr0 = (0<<13) | (0<<14) | ((40) & 0xFF);
    shadowOAM[8].attr1 = (2<<14) | ((168) & 0x1FF);
    shadowOAM[8].attr2 = (((0) & 0xF) << 12) | (((17) * 32 + (8)) & 0x3FF);


    shadowOAM[9].attr0 = (0<<13) | (1<<14) | ((80) & 0xFF);
    shadowOAM[9].attr1 = (3<<14) | ((144) & 0x1FF);
    shadowOAM[9].attr2 = (((0) & 0xF) << 12) | (((13) * 32 + (11)) & 0x3FF);


    shadowOAM[10].attr0 = (0<<13) | (0<<14) | ((120) & 0xFF);
    shadowOAM[10].attr1 = (2<<14) | ((152) & 0x1FF);
    shadowOAM[10].attr2 = (((0) & 0xF) << 12) | (((17) * 32 + (4)) & 0x3FF);


    shadowOAM[11].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[11].attr1 = (1<<14) | ((4) & 0x1FF);
    shadowOAM[11].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (0)) & 0x3FF);


    shadowOAM[12].attr0 = (0<<13) | (1<<14) | ((148) & 0xFF);
    shadowOAM[12].attr1 = (1<<14) | ((36) & 0x1FF);
    shadowOAM[12].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (4)) & 0x3FF);
}

void resetMapExtra() {
    mapOneExtra = 0;
    mapTwoExtra = 0;
    mapThreeExtra = 0;
    mapFourExtra = 0;
}

void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;

}

void playSoundA(const signed char* data, int dataLength, int looping) {

    DMANow(1, data, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000102 = (0<<7);
    int cyclesPerSample = ((16777216) / 11025);
    *(volatile unsigned short*)0x4000100 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.looping = looping;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = ((59.727) * dataLength) / 11025;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char* data, int dataLength, int looping) {

    DMANow(2, data, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000106 = (0<<7);
    int cyclesPerSample = ((16777216) / 11025);
    *(volatile unsigned short*)0x4000104 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.looping = looping;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = ((59.727) * dataLength) / 11025;
    soundB.vBlankCount = 0;

}

void pauseSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);

    *(volatile unsigned short*)0x400010A = 0;
    *(volatile unsigned short*)0x400010E = 0;
}

void unpauseSounds() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);

    *(volatile unsigned short*)0x400010A = (3) | (1<<7) | (1<<6);
    *(volatile unsigned short*)0x400010E = (1<<2) | (1<<7) | (1<<6);
}

void stopSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    dma[1].cnt = 0;
    dma[2].cnt = 0;

}

void revealSecret() {
    ((screenblock *)0x6000000)[21].tilemap[((9) * (32) + (7))] = ((773 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((9) * (32) + (8))] = ((774 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((9) * (32) + (9))] = ((775 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((9) * (32) + (10))] = ((776 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((10) * (32) + (7))] = ((837 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((10) * (32) + (8))] = ((838 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((10) * (32) + (9))] = ((839 & 0x3FF));
    ((screenblock *)0x6000000)[21].tilemap[((10) * (32) + (10))] = ((840 & 0x3FF));
    secretFound = 1;
}
