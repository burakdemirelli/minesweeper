int x = 15;
int y = 15;
int bombCount = 15;
color backgroundColor = color(255, 255, 255);
color flagColor = color(255, 255, 255);
int flagCount;

//RENDERING CONSTANTS
int tileWidth = 10;
int tileHeight = tileWidth;



void setup() {
    int[][][] gameGrid = generateGrid(x, y, bombCount);
    flagCount = 0;
    
}

void draw() {
    //listen to inputs && update grid
    //render grid
}

/*
---GRID EXAMPLE---
[
[ [0,0],[flag, bomb],[],[] ],
[ [],[],[],[] ],
[ [],[],[],[] ],
[ [],[],[],[] ] 
]
*/

//check for duplicates

int[][][] generateGrid(int x, int y, int bombCount){

    //generates a 3D array
    int[][][] grid;
    grid = new int[y][x][2];
    
    //constants for the random bomb coordinates
    int maxY = y;
    int maxX = x;
    int min = 1;
    int rangeX = maxX - min + 1;
    int rangeY = maxY - min + 1;

    //placing bombs into the grids
    //need to add duplication check
    for(int i=0; i<bombCount; i++){
        
        int x = (int)(Math.random() * rangeX) + min;
        int y = (int)(Math.random() * rangeY) + min;
        grid[y][x][1] = 1;
        
    }
}
 
void placeFlag(int[][][] grid, int x, int y){
    grid[y][x][0] = 1;
    flagCount += 1;
}

//input -> tile x,y
//check if the tile pressed is empty 

int getNearbyBombs(int x, int y){
    int nearbyBombs = 0;
    int dummyX = x-1;
    int dummyY = y-1;

    /* 
    the dummy coordinates offsets the x and y coordinates to the top left corner

    for loop goes through rows and columns checking ig it is a bomb
    see the actual coordinates (!not offset ones!) below:

    actual coordinates
    [x-1,y-1], [x,y-1], [x+1,y-1],
    [x-1,y],   [x,y],    [x+1,y],
    [x-1,y+1], [x,y+1],  [x+1,y+1]
    */
    for (int row = 0; row < 3; row++){
        for(int column = 0; row < 3; column++){
            if(getState(dummyX, dummyY) == Level.BOMB){
                nearbyBombs += 1; 
            }
            dummyX += 1;
        }
        dummyY += 1;
    }
    return nearbyBombs;
}

enum State = {
    FLAG,
    BOMB,
    EMPTY
}

State getState(int x, int y){
    State state;
    //if it is a flag or a flagged bomb
    // ! CAUTION ! if a bomb is flagged this will return a flag
    // not sure if this affects gameplay || causes bugs
    if( gameGrid[y][x] == [1,1] || gameGrid[y][x] == [1,0]){
        state = state.FLAG;
    }
    else if(gameGrid[y][x] == [0,1]){
        state = state.BOMB;
    }
    else{
        state = state.EMPTY;
    }
    return state;
}
//mouse handler

// TO-DO
// getState | done
// research Breadth first search or depth first search
// write getNearbyBombs() | done
// >> user pressed
// if bomb -> game over
// else, if nearbyBomb is 0 display it
// 