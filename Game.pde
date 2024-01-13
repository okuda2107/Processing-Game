import java.util.List;
import java.util.ArrayList;

class Game {
    private Renderer renderer = new Renderer(this);
    private int screenWidth;
    private int screenHeight;
    public Renderer getRenderer() {
        return this.renderer;
    }

    private boolean updatingActors;

    private List<Actor> actors = new ArrayList<>();
    private List<Actor> pendingActors = new ArrayList<>();

    Game(int width, int height) {
        this.screenWidth = width;
        this.screenHeight = height;
    }

    public void initialize() {
        this.renderer.initialize();
        this.loadData();
    }

    public void processInput() {

    }

    public void updateGame() {
        // translate(width/2, height/2);
        // rotateY(PI/3);
        float deltatime = 1 / 60;
        updateActors(deltatime);
    }

    public void generateOutput() {
        // box(150, 150, 150);
        this.renderer.draw();
    }

    private void updateActors(float deltatime) {
        this.updatingActors = true;
        for (var actor : this.actors) {
            actor.update(deltatime);
        }
        this.updatingActors = false;

        for (var pending : this.pendingActors) {
            actors.add(pending);
        }
        this.pendingActors.clear();

        List<Actor> deadActors = new ArrayList<>();
        for (var actor : this.actors) {
            if (actor.state == Actor.State.Dead) {
                deadActors.add(actor);
            }
        }
        for (var actor : deadActors) {
            actor.close();
        }
    }

    public void addActor(Actor actor) {
        this.actors.add(actor);
    }

    public void removeActor(Actor actor) {
        this.actors.remove(actor);
    }

    private void loadData() {

    }
}
