# 1 "room.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "room.c"
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
# 5 "mode0.h" 2
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
# 2 "room.c" 2

enum {FRONT, RIGHT, BACK, LEFT};
enum {LEFT_OPEN_VOFF = 160, LEFT_OPEN_HOFF = 0, RIGHT_OPEN_VOFF = 160, RIGHT_OPEN_HOFF = 240, FRONT_CLOSED_VOFF = 0, FRONT_CLOSED_HOFF = 240,
            LEFT_CLOSED_VOFF = 320, LEFT_CLOSED_HOFF = 0, RIGHT_CLOSED_VOFF = 320, RIGHT_CLOSED_HOFF = 240,
            FRONT_OPEN_HOFF = 0, FRONT_OPEN_VOFF = 0, BOTH_OPEN_HOFF = 0, BOTH_OPEN_VOFF = 0, BOTH_CLOSED_HOFF = 240, BOTH_CLOSED_VOFF = 0,
            DOOR_BOTH_HOFF = 0, DOOR_BOTH_VOFF = 160, DOOR_CLOSED_HOFF = 240, DOOR_CLOSED_VOFF = 160, DOOR_LEFT_HOFF = 0, DOOR_LEFT_VOFF = 320,
            DOOR_RIGHT_HOFF = 240, DOOR_RIGHT_VOFF = 360};

ROOM rooms[51];

int hOffZero = 0;
int vOffZero = 0;
int hOffOne = 0;
int vOffOne = 0;
int hOffTwo = 0;
int vOffTwo = 0;
int hOffThree = 0;
int vOffThree = 0;
int mapOneExtra = 0;
int mapTwoExtra = 0;
int mapThreeExtra = 0;
int mapFourExtra = 0;

void initRooms() {
    rooms[1].hasFront = 1;
    rooms[1].front = &rooms[2];
    rooms[1].hasBack = 1;
    rooms[1].back = &rooms[48];

    rooms[2].hasBack = 1;
    rooms[2].back = &rooms[1];
    rooms[2].hasFront = 1;
    rooms[2].front = &rooms[3];

    rooms[3].hasBack = 1;
    rooms[3].back = &rooms[2];
    rooms[3].hasFront = 1;
    rooms[3].front = &rooms[4];

    rooms[4].hasBack = 1;
    rooms[4].back = &rooms[3];
    rooms[4].hasLeft = 1;
    rooms[4].left = &rooms[5];
    rooms[4].hasRight = 1;
    rooms[4].right = &rooms[25];
    rooms[4].hasEnemy = 1;
    rooms[4].enemy = &enemies[0];

    rooms[5].hasRight = 1;
    rooms[5].right = &rooms[4];
    rooms[5].hasLeft = 1;
    rooms[5].left = &rooms[6];

    rooms[6].hasRight = 1;
    rooms[6].right = &rooms[5];
    rooms[6].hasBack = 1;
    rooms[6].back = &rooms[7];
    rooms[6].hasFront = 1;
    rooms[6].front = &rooms[24];

    rooms[7].hasFront = 1;
    rooms[7].front = &rooms[6];
    rooms[7].hasLeft = 1;
    rooms[7].left = &rooms[8];

    rooms[8].hasRight = 1;
    rooms[8].right = &rooms[7];
    rooms[8].hasLeft = 1;
    rooms[8].left = &rooms[9];

    rooms[9].hasRight = 1;
    rooms[9].right = &rooms[8];
    rooms[9].hasLeft = 1;
    rooms[9].left = &rooms[10];

    rooms[10].hasRight = 1;
    rooms[10].right = &rooms[9];
    rooms[10].hasFront = 1;
    rooms[10].front = &rooms[11];

    rooms[11].hasBack = 1;
    rooms[11].back = &rooms[10];
    rooms[11].hasFront = 1;
    rooms[11].front = &rooms[12];
    rooms[11].hasEnemy = 1;
    rooms[11].enemy = &enemies[4];

    rooms[12].hasBack = 1;
    rooms[12].back = &rooms[11];
    rooms[12].hasLeft = 1;
    rooms[12].left = &rooms[13];

    rooms[13].hasRight = 1;
    rooms[13].right = &rooms[12];
    rooms[13].hasFront = 1;
    rooms[13].front = &rooms[14];

    rooms[14].hasBack = 1;
    rooms[14].back = &rooms[13];
    rooms[14].hasFront = 1;
    rooms[14].front = &rooms[15];

    rooms[15].hasBack = 1;
    rooms[15].back = &rooms[14];
    rooms[15].hasLeft = 1;
    rooms[15].left = &rooms[16];
    rooms[15].hasRight = 1;
    rooms[15].right = &rooms[19];

    rooms[16].hasRight = 1;
    rooms[16].right = &rooms[15];
    rooms[16].hasLeft = 1;
    rooms[16].left = &rooms[17];

    rooms[17].hasRight = 1;
    rooms[17].right = &rooms[16];
    rooms[17].hasFront = 1;
    rooms[17].front = &rooms[18];
    rooms[17].hasEnemy = 1;
    rooms[17].enemy = &enemies[3];

    rooms[18].hasBack = 1;
    rooms[18].back = &rooms[17];
    rooms[18].hasKey = 1;
    rooms[18].key = &keys[0];

    rooms[19].hasLeft = 1;
    rooms[19].left = &rooms[15];
    rooms[19].hasFront = 1;
    rooms[19].front = &rooms[20];

    rooms[20].hasBack = 1;
    rooms[20].back = &rooms[19];
    rooms[20].hasRight = 1;
    rooms[20].right = &rooms[49];

    rooms[21].hasFront = 1;
    rooms[21].front = &rooms[50];
    rooms[21].hasBack = 1;
    rooms[21].back = &rooms[22];

    rooms[22].hasFront = 1;
    rooms[22].front = &rooms[21];
    rooms[22].hasRight = 1;
    rooms[22].right = &rooms[23];

    rooms[23].hasLeft = 1;
    rooms[23].left = &rooms[22];
    rooms[23].hasBack = 1;
    rooms[23].back = &rooms[24];

    rooms[24].hasFront = 1;
    rooms[24].front = &rooms[23];
    rooms[24].hasBack = 1;
    rooms[24].back = &rooms[6];
    rooms[24].hasEnemy = 1;
    rooms[24].enemy = &enemies[1];

    rooms[25].hasLeft = 1;
    rooms[25].left = &rooms[4];
    rooms[25].hasFront = 1;
    rooms[25].front = &rooms[26];

    rooms[26].hasBack = 1;
    rooms[26].back = &rooms[25];
    rooms[26].hasRight = 1;
    rooms[26].right = &rooms[27];

    rooms[27].hasLeft = 1;
    rooms[27].left = &rooms[26];
    rooms[27].hasRight = 1;
    rooms[27].right = &rooms[28];
    rooms[27].hasFront = 1;
    rooms[27].front = &rooms[38];

    rooms[28].hasLeft = 1;
    rooms[28].left = &rooms[27];
    rooms[28].hasBack = 1;
    rooms[28].back = &rooms[29];
    rooms[28].hasEnemy = 1;
    rooms[28].enemy = &enemies[7];

    rooms[29].hasFront = 1;
    rooms[29].front = &rooms[28];
    rooms[29].hasRight = 1;
    rooms[29].right = &rooms[30];

    rooms[30].hasLeft = 1;
    rooms[30].left = &rooms[29];
    rooms[30].hasRight = 1;
    rooms[30].right = &rooms[31];

    rooms[31].hasLeft = 1;
    rooms[31].left = &rooms[30];
    rooms[31].hasFront = 1;
    rooms[31].front = &rooms[32];

    rooms[32].hasBack = 1;
    rooms[32].back = &rooms[31];
    rooms[32].hasFront = 1;
    rooms[32].front = &rooms[33];

    rooms[33].hasBack = 1;
    rooms[33].back = &rooms[32];
    rooms[33].hasLeft = 1;
    rooms[33].left = &rooms[34];

    rooms[34].hasRight = 1;
    rooms[34].right = &rooms[33];
    rooms[34].hasFront = 1;
    rooms[34].front = &rooms[35];

    rooms[35].hasBack = 1;
    rooms[35].back = &rooms[34];
    rooms[35].hasLeft = 1;
    rooms[35].left = &rooms[36];
    rooms[35].hasEnemy = 0;

    rooms[36].hasRight = 1;
    rooms[36].right = &rooms[35];
    rooms[36].hasLeft = 1;
    rooms[36].left = &rooms[37];
    rooms[36].hasFront = 1;
    rooms[36].front = &rooms[39];

    rooms[37].hasRight = 1;
    rooms[37].right = &rooms[36];
    rooms[37].hasBack = 1;
    rooms[37].back = &rooms[38];
    rooms[37].hasEnemy = 1;
    rooms[37].enemy = &enemies[6];

    rooms[38].hasFront = 1;
    rooms[38].front = &rooms[37];
    rooms[38].hasBack = 1;
    rooms[38].back = &rooms[27];

    rooms[39].hasBack = 1;
    rooms[39].back = &rooms[36];
    rooms[39].hasFront = 1;
    rooms[39].front = &rooms[40];

    rooms[40].hasBack = 1;
    rooms[40].back = &rooms[39];
    rooms[40].hasFront = 1;
    rooms[40].front = &rooms[41];

    rooms[41].hasBack = 1;
    rooms[41].back = &rooms[40];
    rooms[41].hasRight = 1;
    rooms[41].right = &rooms[42];

    rooms[42].hasLeft = 1;
    rooms[42].left = &rooms[41];
    rooms[42].hasFront = 1;
    rooms[42].front = &rooms[43];
    rooms[42].hasEnemy = 1;
    rooms[42].enemy = &enemies[8];

    rooms[43].hasBack = 1;
    rooms[43].back = &rooms[42];
    rooms[43].hasFront = 1;
    rooms[43].front = &rooms[44];

    rooms[44].hasBack = 1;
    rooms[44].back = &rooms[43];
    rooms[44].hasLeft = 1;
    rooms[44].left = &rooms[45];
    rooms[44].hasEnemy = 1;
    rooms[44].enemy = &enemies[9];

    rooms[45].hasRight = 1;
    rooms[45].right = &rooms[44];
    rooms[45].hasLeft = 1;
    rooms[45].left = &rooms[46];

    rooms[46].hasRight = 1;
    rooms[46].right = &rooms[45];
    rooms[46].hasBack = 1;
    rooms[46].back = &rooms[47];
    rooms[46].hasEnemy = 1;
    rooms[46].enemy = &enemies[5];

    rooms[47].hasFront = 1;
    rooms[47].front = &rooms[46];
    rooms[47].hasKey = 1;
    rooms[47].key = &keys[1];

    rooms[48].hasFront = 1;
    rooms[48].front = &rooms[1];
    rooms[48].hasDoor = 1;

    rooms[49].hasLeft = 1;
    rooms[49].left = &rooms[20];
    rooms[49].hasRight = 1;
    rooms[49].right = &rooms[50];
    rooms[49].hasEnemy = 1;
    rooms[49].enemy = &enemies[2];

    rooms[50].hasLeft = 1;
    rooms[50].left = &rooms[49];
    rooms[50].hasBack = 1;
    rooms[50].back = &rooms[21];
}

void drawRooms() {
    for (int i = 0; i < 51; i++) {
        if (rooms[i].hasPlayer) {
            drawRoom(&rooms[i], 0, FRONT);
            return;
        }
    }
}


void drawRoom(ROOM* room, int depth, int direction) {
    if (room->hasEnemy) {
        room->enemy->hide = 0;
        room->enemy->depth = depth;
    }
    if (room->hasKey) {
        room->key->hide = 0;
        room->key->depth = depth;
    }
    if (hasRoom(room, direction)) {

        if (nextRoom(room, direction)->hasDoor && depth == 0) {
            drawLocks();
        }


        if (nextRoom(room, direction)->hasDoor && hasRoom(room, direction - 1) && hasRoom(room, direction + 1)) {
            changeMap(1, depth);
            setOff(depth, DOOR_BOTH_HOFF, DOOR_BOTH_VOFF);
            return;
        }

        if (nextRoom(room, direction)->hasDoor && hasRoom(room, direction - 1)) {
            changeMap(1, depth);
            setOff(depth, DOOR_LEFT_HOFF, DOOR_LEFT_VOFF);
            return;
        }

        if (nextRoom(room, direction)->hasDoor && hasRoom(room, direction + 1)) {
            changeMap(1, depth);
            setOff(depth, DOOR_RIGHT_HOFF, DOOR_RIGHT_VOFF);
            return;
        }

        if (nextRoom(room, direction)->hasDoor) {
            changeMap(1, depth);
            setOff(depth, DOOR_CLOSED_HOFF, DOOR_CLOSED_VOFF);
            return;
        }
    }

    if (hasRoom(room, direction) && hasRoom(room, direction - 1) && hasRoom(room, direction + 1)) {
        changeMap(1, depth);
        setOff(depth, BOTH_OPEN_HOFF, BOTH_OPEN_VOFF);
        drawRoom(nextRoom(room, direction), depth + 1, direction);
        return;
    }

    if (!hasRoom(room, direction) && hasRoom(room, direction - 1) && hasRoom(room, direction + 1)) {
        changeMap(1, depth);
        setOff(depth, BOTH_CLOSED_HOFF, BOTH_CLOSED_VOFF);
        return;
    }

    if (hasRoom(room, direction) && hasRoom(room, direction - 1)) {
        changeMap(0, depth);
        setOff(depth, LEFT_OPEN_HOFF, LEFT_OPEN_VOFF);
        drawRoom(nextRoom(room, direction), depth + 1, direction);
        return;
    }

    if (hasRoom(room, direction) && hasRoom(room, direction + 1)) {
        changeMap(0, depth);
        setOff(depth, RIGHT_OPEN_HOFF, RIGHT_OPEN_VOFF);
        drawRoom(nextRoom(room, direction), depth + 1, direction);
        return;
    }

    if (!hasRoom(room, direction) && hasRoom(room, direction - 1)) {
        changeMap(0, depth);
        setOff(depth, LEFT_CLOSED_HOFF, LEFT_CLOSED_VOFF);
        return;
    }

    if (!hasRoom(room, direction) && hasRoom(room, direction + 1)) {
        changeMap(0, depth);
        setOff(depth, RIGHT_CLOSED_HOFF, RIGHT_CLOSED_VOFF);
        return;
    }

    if (!hasRoom(room, direction)) {
        changeMap(0, depth);
        setOff(depth, FRONT_CLOSED_HOFF, FRONT_CLOSED_VOFF);
        return;
    }

    if (hasRoom(room, direction)) {
        changeMap(0, depth);
        setOff(depth, FRONT_OPEN_HOFF, FRONT_OPEN_VOFF);
        drawRoom(nextRoom(room, direction), depth + 1, direction);
        return;
    }
}


int changeMap(int goal, int depth) {
    if (depth == 0) {
        if (goal != mapOneExtra) {
            if (mapOneExtra) {
                DMANow(3, tilemapOneMap, &((screenblock *)0x6000000)[20], (8192) / 2);
                mapOneExtra = 0;
            } else {
                DMANow(3, tilemapOneExtraMap, &((screenblock *)0x6000000)[20], (8192) / 2);
                mapOneExtra = 1;
            }
        }
    }
    if (depth == 1) {
        if (goal != mapTwoExtra) {
            if (mapTwoExtra) {
                DMANow(3, tilemapTwoMap, &((screenblock *)0x6000000)[24], (8192) / 2);
                mapTwoExtra = 0;
            } else {
                DMANow(3, tilemapTwoExtraMap, &((screenblock *)0x6000000)[24], (8192) / 2);
                mapTwoExtra = 1;
            }
        }
    }
    if (depth == 2) {
        if (goal != mapThreeExtra) {
            if (mapThreeExtra) {
                DMANow(3, tilemapThreeMap, &((screenblock *)0x6000000)[28], (8192) / 2);
                mapThreeExtra = 0;
            } else {
                DMANow(3, tilemapThreeExtraMap, &((screenblock *)0x6000000)[28], (8192) / 2);
                mapThreeExtra = 1;
            }
        }
    }
    if (depth == 3) {
        if (goal != mapFourExtra) {
            if (mapFourExtra) {
                DMANow(3, tilemapFourMap, &((screenblock *)0x6000000)[16], (8192) / 2);
                mapFourExtra = 0;
            } else {
                DMANow(3, tilemapFourExtraMap, &((screenblock *)0x6000000)[16], (8192) / 2);
                mapFourExtra = 1;
            }
        }
    }
}

void setOff(int depth, int hOff, int vOff) {
    if (depth == 0) {
        hOffZero = hOff;
        vOffZero = vOff;
    }
    if (depth == 1) {
        hOffOne = hOff;
        vOffOne = vOff;
    }
    if (depth == 2) {
        hOffTwo = hOff;
        vOffTwo = vOff;
    }
    if (depth == 3) {
        hOffThree = hOff;
        vOffThree = vOff;
    }
}

ROOM* nextRoom(ROOM* room, int direction) {
    if (direction == FRONT) {
        return room->front;
    }
    if (direction == RIGHT) {
        return room->right;
    }
    if (direction == BACK) {
        return room->back;
    }
    if (direction == LEFT) {
        return room->left;
    }
    return;
}

int hasRoom(ROOM* room, int direction) {
    if (direction == -1) {
        direction = 3;
    }
    if (direction == 4) {
        direction = 0;
    }
    if (direction == FRONT) {
        return room->hasFront == 1;
    }
    if (direction == RIGHT) {
        return room->hasRight == 1;
    }
    if (direction == BACK) {
        return room->hasBack == 1;
    }
    if (direction == LEFT) {
        return room->hasLeft == 1;
    }
    return;
}
