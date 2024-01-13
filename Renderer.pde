import java.util.List;
import java.util.ArrayList;

class Renderer {
    private Game game;
    private int screenWidth;
    private int screenHeight;

    private List<ObjectComponent> objects = new ArrayList<>();

    Renderer(Game game) {
        this.game = game;
        this.screenWidth = game.screenWidth;
        this.screenHeight = game.screenHeight;
    }

    public void initialize() {
        background(120);
    }

    public void draw() {
        for (var obj : objects) {
            obj.draw();
        }
    }

    public void addObject(ObjectComponent object) {
        this.objects.add(object);
    }

    public void removeObject(ObjectComponent object) {
        this.objects.remove(object);
    }
}
