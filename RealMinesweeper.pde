int x;
int y;
int bombCount;
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

// TO-DO
// write getNearbyBombs()
// >> user pressed
// if bomb -> game over
// else, if nearbyBomb is 0 display it
// 