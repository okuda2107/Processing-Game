import java.util.List;
import java.util.ArrayList;

class Game {
    private int screenWidth;
    private int screenHeight;

    List<Actor> actors = new ArrayList<>();

    Game(int width, int height) {
        this.screenWidth = width;
        this.screenHeight = height;
    }

    public void initialize() {
        background(120);
    }

    public void processInput() {

    }

    public void updateGame() {
        translate(width/2, height/2);
        rotateY(PI/3);
    }

    public void generateOutput() {
        box(150, 150, 150);
    }

    public void AddActor(Actor actor) {

    }

    public void RemoveActor(Actor actor) {

    }
}
