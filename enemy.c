#include "enemy.h"

ENEMY enemies[NUM_ENEMIES];

enum {ENEMY_ROOM_1_X = 68, ENEMY_ROOM_1_Y = 64, ENEMY_ROOM_2_X = 72, ENEMY_ROOM_2_Y = 72, ENEMY_ROOM_3_X = 74, ENEMY_ROOM_3_Y = 78};

void initEnemies() {
    for (int i = 0; i < NUM_ENEMIES; i++) {
        enemies[i].active = 1;
        enemies[i].hide = 1;
        enemies[i].timeUntilNextFrame = FRAME_INTERVAL;
        enemies[i].frame = 0;
        enemies[i].numOfFrames = 3;
        enemies[i].oamSpace = 20 + i;
        enemies[i].health = 9;
    }
}

//updateEnemies() is in player.c unfortunately (i overestimated the abilities of C and have paid dearly for it)

void drawEnemies() {
    for (int i = 0; i < NUM_ENEMIES; i++) {
        if (!enemies[i].hide && enemies[i].health > -1) {
            if (enemies[i].depth == 1) {
                shadowOAM[enemies[i].oamSpace].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(ENEMY_ROOM_1_Y);
                shadowOAM[enemies[i].oamSpace].attr1 = ATTR1_LARGE | ATTR1_X(ENEMY_ROOM_1_X);
                shadowOAM[enemies[i].oamSpace].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i].frame * 4, 0);
            } else if (enemies[i].depth == 2) {
                shadowOAM[enemies[i].oamSpace].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(ENEMY_ROOM_2_Y);
                shadowOAM[enemies[i].oamSpace].attr1 = ATTR1_MEDIUM | ATTR1_X(ENEMY_ROOM_2_X);
                shadowOAM[enemies[i].oamSpace].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 8);
            } else if (enemies[i].depth == 3) {
                shadowOAM[enemies[i].oamSpace].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(ENEMY_ROOM_3_Y);
                shadowOAM[enemies[i].oamSpace].attr1 = ATTR1_TINY | ATTR1_X(ENEMY_ROOM_3_X);
                shadowOAM[enemies[i].oamSpace].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 8);
            }
        } else {
            shadowOAM[enemies[i].oamSpace].attr0 = ATTR0_HIDE;
        }
    }
}