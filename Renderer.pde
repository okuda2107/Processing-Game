import java.util.List;
import java.util.ArrayList;

class Renderer {
    private Game game;
    private int screenWidth = displayWidth;
    private int screenHeight = displayHeight;

    private List<ObjectComponent> objects = new ArrayList<>();

    Renderer(Game game) {
        this.game = game;
    }

    public void initialize() {
        background(120);
        directionalLight(0, 0, 0, 1, 1, -1);
    }

    public void draw() {
        background(120);
        for (var obj : objects) {
            obj.draw(this.screenWidth, this.screenHeight);
        }
    }

    public void addObject(ObjectComponent object) {
        this.objects.add(object);
    }

    public void removeObject(ObjectComponent object) {
        this.objects.remove(object);
    }
}
