#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"

#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#include "play.h"
#include "sound.h"

#include "psychorus.h"


SONG songs[SONGCOUNT];
int intensity[10];

int paused;
int shuffle;

int minute;
int second;

int frame;
int progress;

int currentSong;

char* screenTitle;
int titlePosition;


void initSound() {

    for (int i = 0; i < 10; i++) {
        intensity[i] = 0;

    }

    paused = 1;
    shuffle = 0;

    currentSong = 0;

    songs[0].sampleRate = psychorus_sampleRate;
    songs[0].length = psychorus_length;
    songs[0].data = (signed char*) psychorus_data;
    
    soundA.looping = 1;
    soundB.looping = 0;
    

    playSong(currentSong);

} 

void playSong(int s) {

    playSoundA(songs[s].data, songs[s].length, 1);

    frame = 0;
    titlePosition = 0;

    REG_TM2CNT = 0;
    REG_TM2D = 65536 - 16384;
    
    REG_TM3CNT = 0;
    REG_TM3D = 65536 - 60;
    
    if (paused) {
        
        pauseSounds();


    } else {
        REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
        REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;

    }

}