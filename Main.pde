Game game;

void setup() {
    fullScreen(P3D);
    game = new Game(this);
    game.initialize();
}

void draw() {
    game.processInput();
    game.updateGame();
    game.generateOutput();
}
