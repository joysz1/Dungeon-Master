#include "player.h"
#include "gba.h"
#include "mode0.h"
#include "play.h"
#include "sound.h"
#include "mode0.h"

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
    //instruct
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(168);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 12);
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[1].attr1 = ATTR1_SMALL | ATTR1_X(200);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 12);
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(148);
    shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(232);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 12);

    //play
    shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[3].attr1 = ATTR1_SMALL | ATTR1_X(4);
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 22);
    shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[4].attr1 = ATTR1_SMALL | ATTR1_X(36);
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 22);
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateKeys();
    if (BUTTON_PRESSED(BUTTON_SELECT) && player.room == &rooms[1] && player.direction == LEFT) {
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

    REG_BG0HOFF = hOffZero;
    REG_BG0VOFF = vOffZero;
    REG_BG1HOFF = hOffOne;
    REG_BG1VOFF = vOffOne;
    REG_BG2HOFF = hOffTwo;
    REG_BG2VOFF = vOffTwo;
    REG_BG3HOFF = hOffThree;
    REG_BG3VOFF = vOffThree;
}

void drawOver() {
    //play
    shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[3].attr1 = ATTR1_SMALL | ATTR1_X(4);
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 22);
    shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[4].attr1 = ATTR1_SMALL | ATTR1_X(36);
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 22);
}

void drawInstructions() {
    //A
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(16);
    shadowOAM[0].attr1 = ATTR1_MEDIUM | ATTR1_X(24);
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);

    //B
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(100);
    shadowOAM[1].attr1 = ATTR1_MEDIUM | ATTR1_X(24);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 18);

    //A = 
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(24);
    shadowOAM[2].attr1 = ATTR1_SMALL | ATTR1_X(60);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 15);

    //B = 
    shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(108);
    shadowOAM[3].attr1 = ATTR1_SMALL | ATTR1_X(60);
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 15);

    //Sword
    shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(10);
    shadowOAM[4].attr1 = ATTR1_LARGE | ATTR1_X(70);
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 9);

    //Shield
    shadowOAM[5].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(100);
    shadowOAM[5].attr1 = ATTR1_LARGE | ATTR1_X(78);
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 9);

    //Turn
    shadowOAM[6].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(10);
    shadowOAM[6].attr1 = ATTR1_LARGE | ATTR1_X(144);
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 17);

    //<-
    shadowOAM[7].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(32);
    shadowOAM[7].attr1 = ATTR1_MEDIUM | ATTR1_X(132);
    shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 13);

    //->
    shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(40);
    shadowOAM[8].attr1 = ATTR1_MEDIUM | ATTR1_X(168);
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 17);

    //Move
    shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(80);
    shadowOAM[9].attr1 = ATTR1_LARGE | ATTR1_X(144);
    shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(11, 13);

    //^
    shadowOAM[10].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(120);
    shadowOAM[10].attr1 = ATTR1_MEDIUM | ATTR1_X(152);
    shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 17);

    //START
    shadowOAM[11].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[11].attr1 = ATTR1_SMALL | ATTR1_X(4);
    shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 22);

    //PLAY
    shadowOAM[12].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(148);
    shadowOAM[12].attr1 = ATTR1_SMALL | ATTR1_X(36);
    shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 22);
}

void resetMapExtra() {
    mapOneExtra = 0;
    mapTwoExtra = 0;
    mapThreeExtra = 0;
    mapFourExtra = 0;
}

void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;

}

void playSoundA(const signed char* data, int dataLength, int looping) {
    
    DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    REG_TM0CNT = TIMER_OFF;
    int cyclesPerSample = (PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ);
    REG_TM0D = 65536 - cyclesPerSample;
    REG_TM0CNT = TIMER_ON;

    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.looping = looping;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char* data, int dataLength, int looping) {

    DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    REG_TM1CNT = TIMER_OFF;
    int cyclesPerSample = (PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ);
    REG_TM1D = 65536 - cyclesPerSample;
    REG_TM1CNT = TIMER_ON;

    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.looping = looping;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundB.vBlankCount = 0;

}

void pauseSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;

    REG_TM2CNT = 0;
    REG_TM3CNT = 0;
}

void unpauseSounds() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON; 

    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}

void stopSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    dma[1].cnt = 0;
    dma[2].cnt = 0;

}

void revealSecret() {
    SCREENBLOCK[21].tilemap[OFFSET(7, 9, 32)] = TMAP_ENTRY_TILEID(773);
    SCREENBLOCK[21].tilemap[OFFSET(8, 9, 32)] = TMAP_ENTRY_TILEID(774);
    SCREENBLOCK[21].tilemap[OFFSET(9, 9, 32)] = TMAP_ENTRY_TILEID(775);
    SCREENBLOCK[21].tilemap[OFFSET(10, 9, 32)] = TMAP_ENTRY_TILEID(776);
    SCREENBLOCK[21].tilemap[OFFSET(7, 10, 32)] = TMAP_ENTRY_TILEID(837);
    SCREENBLOCK[21].tilemap[OFFSET(8, 10, 32)] = TMAP_ENTRY_TILEID(838);
    SCREENBLOCK[21].tilemap[OFFSET(9, 10, 32)] = TMAP_ENTRY_TILEID(839);
    SCREENBLOCK[21].tilemap[OFFSET(10, 10, 32)] = TMAP_ENTRY_TILEID(840);
    secretFound = 1;
}