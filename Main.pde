Game game;

int receivePort = 20000;
String sendIP = "localhost";
int sendPort = 20001;

// positionとrotationは相手とずらす必要がある
PVector myRot = new PVector(0, 0, -1);
PVector myPos = new PVector(0, 0, 300);

void setup() {
    //fullScreen(P3D);
    size(400, 400, P3D);
    game = new Game(this);
    game.initialize();
}

void draw() {
    game.processInput();
    game.updateGame();
    game.generateOutput();
}
