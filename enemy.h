#include "sprites.h"

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

#define NUM_ENEMIES 10
ENEMY enemies[NUM_ENEMIES];

#define FRAME_INTERVAL 20