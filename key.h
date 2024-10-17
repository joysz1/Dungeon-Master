#include "sprites.h"

typedef struct {
    int active;
    int hide;
    int oamSpace;
    int depth;
} KEY;

void initKeys();
void updateKeys();
void drawKeys();

#define NUM_KEYS 2
KEY keys[NUM_KEYS];