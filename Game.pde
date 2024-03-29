import java.util.List;
import java.util.ArrayList;
import processing.net.*;

class Game {
    private PApplet mainProcess;

    private Renderer renderer = new Renderer(this);
    public Renderer getRenderer() {
        return this.renderer;
    }

    private Receiver receiver = new Receiver(this);
    public Receiver getReceiver() {
        return this.receiver;
    }
    private Sender sender = new Sender(this);
    public Sender getSender() {
        return this.sender;
    }

    private boolean updatingActors;

    private List<Actor> actors = new ArrayList<>();
    private List<Actor> pendingActors = new ArrayList<>();

    Game(PApplet that) {
        this.mainProcess = that;
    }

    public void initialize() {
        frameRate(60);
        this.renderer.initialize();
        this.receiver.initialize(this.mainProcess);
        this.sender.initialize(this.mainProcess);
        this.loadData();
    }

    public void processInput() {

    }

    public void updateGame() {
        float deltatime = 1.0 / 60.0;
        updateActors(deltatime);
    }

    public void generateOutput() {
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
            if (actor.state == State.Dead) {
                deadActors.add(actor);
            }
        }
        for (var actor : deadActors) {
            actor.close();
        }
    }

    public void addActor(Actor actor) {
        if (updatingActors) this.pendingActors.add(actor);
        else this.actors.add(actor);
    }

    public void removeActor(Actor actor) {
        this.pendingActors.remove(actor);
        this.actors.remove(actor);
    }

    private void loadData() {
        Actor actor = new Actor(this);
        ObjectComponent oc = new ObjectComponent(actor);
        ReceiveComponent rc = new ReceiveComponent(actor);
        oc.setShape("Player.obj");
        Camera camera = new Camera(this);
        camera.rotation = myRot;
        camera.position = myPos;
        SendComponent sc = new SendComponent(camera);
    }
}
