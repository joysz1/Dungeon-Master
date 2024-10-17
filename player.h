#include "gba.h"
#include "room.h"
#include "sprites.h"
#include "sound.h"
#include "ouch.h"
#include "sprites.h"

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
#define HEART_INTERVAL 10
#define HURT_INTERVAL 30
#define ATTACK_INTERVAL 30
#define MAX_HEALTH 5
