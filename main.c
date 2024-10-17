/**
 * MILESTONE 1:
 * Currently, I have implemented the core system around the rooms that allow them to be drawn correctly and contain
 * objects (doors, enemies) that can interact with the player. There is a slight visual error when looking straight at a wall
 * that has a hallway next to it where you cannot be the hallway, but this could be fixed with more cases if important.
 * Doors are also implemented in the game, where currently walking into the door with win the game.
 * 
 * The main hurdle to still be added is enemies and combat, along with the menu on the right side of the screen with items
 * and a map. Combat is the largest section that still needs to be added into the game, but I believe my current infrastruction
 * will allow for a somewhat simple implementation.
 * 
 * Currently, there are no bugs that I know of.
 * 
 * To play the game, press start on the menu (which says "a") to enter the game, where you can turn left or right, or move forward
 * when applicable. After you win, press start to return to the menu. You can also press select on the menu to go instructions, where
 * you press start to return to the menu.
 * 
 * 
 * MILESTONE 2:
 * The main accomplishment that was added during this milestone is the addition of enemies with combat
 * Enemies will have predetermined rooms and attack the player in a looping pattern when nearby. Currently.
 * there is only one enemy with a basic pattern, but I hope to add at least one more. More infrastructure work
 * was also done to improve interactions between files (having different files for enemies, rooms, player, etc.
 * is nice for not having extremely long files, but was a mistake overall), as well as a health system.
 * 
 * Currently, the game still uses the same basic circle map. However, thanks to the infrastructure in place,
 * it should be relatively simple to set up a larger map. Along with expanding the dungeon, adding a mini-map
 * is a high priority to make exploring the dungeon much more enjoyable. Outside of these necessary additions,
 * I would also like to add chests (keys, health potions, upgraded weapons), new enemies, and possibly a boss, 
 * in that order. However, all core gameplay mechanics are currently functional (exploring, fighting, dying, escaping)
 * 
 * Currently, there are no bugs that I know of.
 * 
 * In addition to the controls from milestone 1, the player has gained the ability to attack and defend. Press A
 * to attack, hold B to defend. You cannot do both at the same time, and the player cannot do either for a brief
 * period after attacking. The game also has a lose screen, which can be exited by pressing start.
 * 
 * MILESTONE 3:
 * The first new addition for this milestone are more complete splash screens, including a parallax menu. I have also
 * added music for the gameplay, as well as a sound effect that plays when the player gets hit. The hearts have been
 * animated along with the enemy. The sprite palette is modified on hit. By pressing Select while standing on the spawn
 * room and facing BACK, the background map is modified, which will act as the cheat once implemented fully.
 * 
 * I still only have the circle room for the dungeon, so the actual layout still needs to be built. Everything else is extra,
 * but I would still like to add a key and hopefully a mini-map
 * 
 * The controls have stayed the same.
*/

#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "tilemapOne.h"
#include "tilemapTwo.h"
#include "tilemapThree.h"
#include "tilemapFour.h"
#include "tileset.h"
#include "tilemapMenu.h"
#include "tilemapMenuTwo.h"
#include "spritesheet.h"
#include "game.h"
#include "sound.h"
#include "play.h"
#include "key.h"

// #define MAPWIDTH 0
// #define MAPHEIGHT 0

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
        buttons = REG_BUTTONS;

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
    }
}


void initialize() {
    mgba_open();

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_LARGE | BG_4BPP;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE | BG_4BPP;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE | BG_4BPP;
    REG_BG3CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_LARGE | BG_4BPP;

    goToStart();
}

void goToStart() {
    
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2);
    DMANow(3, spritesheetPalCopy, &SPRITEPALETTE[0], spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    DMANow(3, tilemapMenuMap, &SCREENBLOCK[20], tilemapMenuMapLen / 2);
    DMANow(3, tilemapMenuMap, &SCREENBLOCK[24], tilemapMenuMapLen / 2);
    DMANow(3, tilemapMenuMap, &SCREENBLOCK[28], tilemapMenuMapLen / 2);

    REG_BG0VOFF = 320;
    REG_BG0HOFF = 240;
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG2VOFF = 160;
    REG_BG2HOFF = 0;

    initGame();
    setupSounds();
    setupInterrupts();
    initSound();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = START;
}

void start() {
    BG2hOff++;
    BG1hOff += 2;
    REG_BG2HOFF = BG2hOff;
    REG_BG1HOFF = BG1hOff;
    waitForVBlank();
    drawStart();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

void goToInstructions() {
    REG_BG0VOFF = 320;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = INSTRUCTIONS;
}

void instructions() {
    waitForVBlank();
    drawInstructions();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToGame() {

    DMANow(3, tilemapOneMap, &SCREENBLOCK[20], tilemapOneMapLen / 2); 
    DMANow(3, tilemapTwoMap, &SCREENBLOCK[24], tilemapTwoMapLen / 2); 
    DMANow(3, tilemapThreeMap, &SCREENBLOCK[28], tilemapThreeMapLen / 2); 
    DMANow(3, tilemapFourMap, &SCREENBLOCK[16], tilemapFourMapLen / 2);

    resetMapExtra();

    unpauseSounds();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = GAME;
}

void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    DMANow(3, shadowOAM, OAM, 512);
    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
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
    DMANow(3, tilemapMenuTwoMap, &SCREENBLOCK[20], tilemapMenuMapLen / 2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    pauseSounds();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToLose() {
    hasLost = 0;

    DMANow(3, tilemapMenuTwoMap, &SCREENBLOCK[20], tilemapMenuMapLen / 2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 240;

    stopSounds();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = LOSE;
}

void lose() {
    waitForVBlank();
    drawOver();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {

    hasWon = 0;

    DMANow(3, tilemapMenuTwoMap, &SCREENBLOCK[20], tilemapMenuMapLen / 2);

    REG_BG0VOFF = 160;
    REG_BG0HOFF = 0;

    stopSounds();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = WIN;
}

void win() {
    waitForVBlank();
    drawOver();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void setupInterrupts() {

	REG_IME = 0;

    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;

    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

void interruptHandler() {

	REG_IME = 0;

	if (REG_IF & IRQ_VBLANK) {

        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {
                    soundA.vBlankCount = 0;
                } else {
                    soundA.isPlaying = 0;
                    REG_TM0CNT = TIMER_OFF;
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
                    REG_TM1CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }

		}

	}

    if (REG_IF & IRQ_TIMER(2)) {
        second = (second + 1) % 60;
    } 

    if (REG_IF & IRQ_TIMER(3)) {
        minute = (minute + 1) % 100;
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}