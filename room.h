#include "tilemapOne.h"
#include "tilemapOneExtra.h"
#include "tilemapTwo.h"
#include "tilemapTwoExtra.h"
#include "tilemapThree.h"
#include "tilemapThreeExtra.h"
#include "tilemapFour.h"
#include "tilemapFourExtra.h"
#include "mode0.h"
#include "enemy.h"
#include "key.h"

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
#define NUM_ROOMS 51