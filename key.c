#include "key.h"

KEY keys[NUM_KEYS];

enum {KEY_ROOM_1_X = 48, KEY_ROOM_1_Y = 64, KEY_ROOM_2_X = 64, KEY_ROOM_2_Y = 72, KEY_ROOM_3_X = 72, KEY_ROOM_3_Y = 72};


void initKeys() {
    for (int i = 0; i < NUM_KEYS; i++) {
        keys[i].active = 1;
        keys[i].hide = 1;
        keys[i].oamSpace = 40;
    }
}

//updateKeys is in player.c

void drawKeys() {
    for (int i = 0; i < NUM_KEYS; i++) {
        if (!keys[i].hide && keys[i].active) {
            mgba_printf("drawing key");
            if (keys[i].depth == 1) {
                shadowOAM[keys[i].oamSpace + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(KEY_ROOM_1_Y);
                shadowOAM[keys[i].oamSpace + i].attr1 = ATTR1_MEDIUM | ATTR1_X(KEY_ROOM_1_X);
                shadowOAM[keys[i].oamSpace + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 5);
            } else if (keys[i].depth == 2) {
                shadowOAM[keys[i].oamSpace + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(KEY_ROOM_2_Y);
                shadowOAM[keys[i].oamSpace + i].attr1 = ATTR1_SMALL | ATTR1_X(KEY_ROOM_2_X);
                shadowOAM[keys[i].oamSpace + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 5);
            } else if (keys[i].depth == 3) {
                shadowOAM[keys[i].oamSpace + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(KEY_ROOM_3_Y);
                shadowOAM[keys[i].oamSpace + i].attr1 = ATTR1_TINY | ATTR1_X(KEY_ROOM_3_X);
                shadowOAM[keys[i].oamSpace + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 7);
            }
        } else if (!keys[i].active) {
            shadowOAM[keys[i].oamSpace + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(60);
            shadowOAM[keys[i].oamSpace + i].attr1 = ATTR1_MEDIUM | ATTR1_X(180 + i * 20);
            shadowOAM[keys[i].oamSpace + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 5);
        } else {
            shadowOAM[keys[i].oamSpace + 1].attr0 = ATTR0_HIDE;
        }
    }
}