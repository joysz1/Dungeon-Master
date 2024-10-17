# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
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
# 2 "player.c" 2

enum {FRONT, RIGHT, BACK, LEFT};

PLAYER player;
ENEMY noEnemy;
int heartFrameCount;
int heartFrame;
int keysHave;
int lockIsNext;


void initPlayer() {
    player.health = 5;
    player.direction = BACK;
    player.room = &rooms[1];
    player.timeUntilNextAttack = 30;
    player.timeUntilNotHurt = 30;
    heartFrameCount = 0;
    heartFrame = 0;
    keysHave = 0;
    player.hasBlaster = 0;
}

void updatePlayer() {
    heartFrameCount++;
    if (heartFrameCount == 10) {
        heartFrameCount = 0;
        heartFrame++;
        if (heartFrame > 3) {
            heartFrame = 0;
        }
    }
    if (nextRoom(player.room, player.direction)->hasDoor) {
        if (keysHave != 2) {
            lockIsNext = 1;
        } else {
            lockIsNext = 0;
        }
    } else {
        lockIsNext = 0;
    }
    if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && hasRoom(player.room, player.direction)) {
        if (!nextRoom(player.room, player.direction)->hasEnemy && !lockIsNext) {
            player.room = nextRoom(player.room, player.direction);
        }
    }
    if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
        player.direction++;
        if (player.direction == 4) {
            player.direction = 0;
        }
    }
    if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
        player.direction--;
        if (player.direction == -1) {
            player.direction = 3;
        }
    }

    if (player.timeUntilNotHurt < 30) {
        player.timeUntilNotHurt--;
        ((u16 *)0x5000200)[1] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        if (player.timeUntilNotHurt == 0) {
            ((u16 *)0x5000200)[1] = (((30) & 31) | ((27) & 31) << 5 | ((8) & 31) << 10);
            player.timeUntilNotHurt = 30;
        }
    }

    if (player.hasBlaster) {
        if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
            ROOM* tempRoom = player.room;
            do {
                if (nextRoom(tempRoom, player.direction)->hasEnemy) {
                    nextRoom(tempRoom, player.direction)->enemy->health = -1;
                    if (nextRoom(tempRoom, player.direction)->enemy->health < 0) {
                        nextRoom(tempRoom, player.direction)->hasEnemy = 0;
                    }
                }
                if (hasRoom(tempRoom, player.direction)) {
                    tempRoom = nextRoom(tempRoom, player.direction);
                }
            } while (hasRoom(tempRoom, player.direction));
        }
        return;
    }

    if (player.timeUntilNextAttack < 30) {
        player.timeUntilNextAttack--;
        if (player.timeUntilNextAttack == 0) {
            player.timeUntilNextAttack = 30;
        }
        return;
    }

    if ((~(buttons) & ((1<<1)))) {
        mgba_printf("Next has enemy: %d", nextRoom(player.room, player.direction)->hasEnemy);
        player.isBlocking = 1;
        return;
    } else {
        player.isBlocking = 0;
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        if (nextRoom(player.room, player.direction)->hasEnemy) {
            nextRoom(player.room, player.direction)->enemy->health--;
            player.timeUntilNextAttack--;
            if (nextRoom(player.room, player.direction)->enemy->health < 0) {
                nextRoom(player.room, player.direction)->hasEnemy = 0;
            }
        }
    }
}

void drawPlayer() {

    for (int i = 0; i < 5; i++) {
        shadowOAM[100 + i].attr0 = (2<<8);
    }
    for (int i = 0; i < player.health; i++) {
        shadowOAM[100 + i].attr0 = (0<<13) | (0<<14) | ((8) & 0xFF);
        shadowOAM[100 + i].attr1 = (0<<14) | ((168 + i * 8) & 0x1FF);
        shadowOAM[100 + i].attr2 = (((0) & 0xF) << 12) | (((0 + heartFrame) * 32 + (31)) & 0x3FF);
    }
    if (player.hasBlaster) {
        shadowOAM[0].attr0 = (0<<13) | (2<<14) | ((104) & 0xFF);
        shadowOAM[0].attr1 = (3<<14) | ((70) & 0x1FF);
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (16)) & 0x3FF);
        return;
    }
    if (player.timeUntilNextAttack < 30) {
        shadowOAM[1].attr0 = (0<<13) | (2<<14) | ((112) & 0xFF);
        shadowOAM[1].attr1 = (3<<14) | ((80) & 0x1FF);
        shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((3) * 32 + (26)) & 0x3FF);

        shadowOAM[0].attr0 = (2<<8);
        return;
    }
    if (player.isBlocking) {
        shadowOAM[0].attr0 = (0<<13) | (2<<14) | ((104) & 0xFF);
        shadowOAM[0].attr1 = (3<<14) | ((70) & 0x1FF);
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (21)) & 0x3FF);

        shadowOAM[1].attr0 = (2<<8);
        return;
    }

    shadowOAM[0].attr0 = (0<<13) | (2<<14) | ((104) & 0xFF);
    shadowOAM[0].attr1 = (3<<14) | ((30) & 0x1FF);
    shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (21)) & 0x3FF);

    shadowOAM[1].attr0 = (0<<13) | (2<<14) | ((104) & 0xFF);
    shadowOAM[1].attr1 = (3<<14) | ((120) & 0x1FF);
    shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (26)) & 0x3FF);
}

ENEMY* nearEnemy() {
    if (player.room->hasFront) {
        ROOM* tempRoom = player.room->front;
        if (tempRoom->hasEnemy) {
            return tempRoom->enemy;
        }
    }
    if (player.room->hasRight) {
        ROOM* tempRoom = player.room->right;
        if (tempRoom->hasEnemy) {
            return tempRoom->enemy;
        }
    }
    if (player.room->hasBack) {
        ROOM* tempRoom = player.room->back;
        if (tempRoom->hasEnemy) {
            return tempRoom->enemy;
        }
    }
    if (player.room->hasLeft) {
        ROOM* tempRoom = player.room->left;
        if (tempRoom->hasEnemy) {
            return tempRoom->enemy;
        }
    }
    noEnemy.active = 0;
    return &noEnemy;
}

void updateEnemies() {
    for (int i = 0; i < 10; i++) {
        enemies[i].hide = 1;
    }
    ENEMY* tempEnemy = nearEnemy();
    if (!tempEnemy->active) {
        return;
    }
    tempEnemy->timeUntilNextFrame--;
    if (tempEnemy->timeUntilNextFrame < 0) {
        tempEnemy->frame++;
        tempEnemy->timeUntilNextFrame = 20;

        if (tempEnemy->frame == 3 && !player.isBlocking) {
            player.health--;
            player.timeUntilNotHurt--;
            playSoundB(ouch_data, ouch_length, 0);
        }
        if (tempEnemy->frame > tempEnemy->numOfFrames) {
            tempEnemy->frame = 0;
        }
    }
}

void updateKeys() {
    for (int i = 0; i < 2; i++) {
        keys[i].hide = 1;
    }
    if (player.room->hasKey) {
        if (player.room->key->active) {
            keysHave++;
            player.room->key->active = 0;
        }
    }
}

void drawLocks() {
    for (int i = 0; i < 2; i++) {
        if (keys[i].active) {
            shadowOAM[50 + i].attr0 = (0<<13) | (2<<14) | ((64) & 0xFF);
            shadowOAM[50 + i].attr1 = (2<<14) | ((60 + 24 * i) & 0x1FF);
            shadowOAM[50 + i].attr2 = (((0) & 0xF) << 12) | (((8) * 32 + (4)) & 0x3FF);
        } else {
            shadowOAM[50 + i].attr0 = (2<<8);
        }
    }
}

void hideLocks() {
    for (int i = 0; i < 2; i++) {
        shadowOAM[50 + i].attr0 = (2<<8);
    }
}
