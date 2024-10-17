#include "player.h"

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
    player.timeUntilNextAttack = ATTACK_INTERVAL;
    player.timeUntilNotHurt = HURT_INTERVAL;
    heartFrameCount = 0;
    heartFrame = 0;
    keysHave = 0;
    player.hasBlaster = 0;
}

void updatePlayer() {
    heartFrameCount++;
    if (heartFrameCount == HEART_INTERVAL) {
        heartFrameCount = 0;
        heartFrame++;
        if (heartFrame > 3) {
            heartFrame = 0;
        }
    }
    if (nextRoom(player.room, player.direction)->hasDoor) {
        if (keysHave != NUM_KEYS) {
            lockIsNext = 1;
        } else {
            lockIsNext = 0;
        }
    } else {
        lockIsNext = 0;
    }
    if (BUTTON_PRESSED(BUTTON_UP) && hasRoom(player.room, player.direction)) {
        if (!nextRoom(player.room, player.direction)->hasEnemy && !lockIsNext) {
            player.room = nextRoom(player.room, player.direction);
        }
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        player.direction++;
        if (player.direction == 4) {
            player.direction = 0;
        }
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        player.direction--;
        if (player.direction == -1) {
            player.direction = 3;
        }
    }

    if (player.timeUntilNotHurt < HURT_INTERVAL) {
        player.timeUntilNotHurt--;
        SPRITEPALETTE[1] = RGB(31, 0, 0);
        if (player.timeUntilNotHurt == 0) {
            SPRITEPALETTE[1] = RGB(30, 27, 8);
            player.timeUntilNotHurt = HURT_INTERVAL;
        }
    }

    if (player.hasBlaster) {
        if (BUTTON_PRESSED(BUTTON_A)) {
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

    if (player.timeUntilNextAttack < ATTACK_INTERVAL) {
        player.timeUntilNextAttack--;
        if (player.timeUntilNextAttack == 0) {
            player.timeUntilNextAttack = ATTACK_INTERVAL;
        }
        return;
    }

    if (BUTTON_HELD(BUTTON_B)) {
        mgba_printf("Next has enemy: %d", nextRoom(player.room, player.direction)->hasEnemy);
        player.isBlocking = 1;
        return;
    } else {
        player.isBlocking = 0;
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
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
    //health
    for (int i = 0; i < MAX_HEALTH; i++) {
        shadowOAM[100 + i].attr0 = ATTR0_HIDE;
    }
    for (int i = 0; i < player.health; i++) {
        shadowOAM[100 + i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(8);
        shadowOAM[100 + i].attr1 = ATTR1_TINY | ATTR1_X(168 + i * 8);
        shadowOAM[100 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(31, 0 + heartFrame);
    }
    if (player.hasBlaster) {
        shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(104);
        shadowOAM[0].attr1 = ATTR1_LARGE | ATTR1_X(70);
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 6);
        return;
    }
    if (player.timeUntilNextAttack < ATTACK_INTERVAL) {
        shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(112);
        shadowOAM[1].attr1 = ATTR1_LARGE | ATTR1_X(80);
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 3);

        shadowOAM[0].attr0 = ATTR0_HIDE;
        return;
    }
    if (player.isBlocking) {
        shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(104);
        shadowOAM[0].attr1 = ATTR1_LARGE | ATTR1_X(70);
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 9);

        shadowOAM[1].attr0 = ATTR0_HIDE;
        return;
    }

    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(104);
    shadowOAM[0].attr1 = ATTR1_LARGE | ATTR1_X(30);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 9);

    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(104);
    shadowOAM[1].attr1 = ATTR1_LARGE | ATTR1_X(120);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 9);
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
    for (int i = 0; i < NUM_ENEMIES; i++) {
        enemies[i].hide = 1;
    } 
    ENEMY* tempEnemy = nearEnemy();
    if (!tempEnemy->active) {
        return;
    }
    tempEnemy->timeUntilNextFrame--;
    if (tempEnemy->timeUntilNextFrame < 0) {
        tempEnemy->frame++;
        tempEnemy->timeUntilNextFrame = FRAME_INTERVAL;
        //enemy attack
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
    for (int i = 0; i < NUM_KEYS; i++) {
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
    for (int i = 0; i < NUM_KEYS; i++) {
        if (keys[i].active) {
            shadowOAM[50 + i].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(64);
            shadowOAM[50 + i].attr1 = ATTR1_MEDIUM | ATTR1_X(60 + 24 * i);
            shadowOAM[50 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 8);
        } else {
            shadowOAM[50 + i].attr0 = ATTR0_HIDE;
        }
    } 
}

void hideLocks() {
    for (int i = 0; i < NUM_KEYS; i++) {
        shadowOAM[50 + i].attr0 = ATTR0_HIDE;
    }
}