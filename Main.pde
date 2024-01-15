Game game;

void setup() {
    fullScreen(P3D);
    game = new Game();
    game.initialize();
}

void draw() {
    game.processInput();
    game.updateGame();
    game.generateOutput();
}
