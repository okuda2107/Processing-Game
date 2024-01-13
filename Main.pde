Game game;

void setup() {
    size(400, 400, P3D);
    game = new Game(400, 400);
    game.initialize();
}

void draw() {
    game.processInput();
    game.updateGame();
    game.generateOutput();
}
