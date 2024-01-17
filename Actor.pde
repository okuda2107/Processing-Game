enum State {
    Active,
    Dead
}

class Actor {
    private Game game;
    public Game getGame() {
        return this.game;
    }

    public PVector position = new PVector(0, 0, 0);
    public float scale = 0.0;
    public PVector rotation = new PVector(0, 0, 0);
    public State state = State.Active;

    List<Component> components = new ArrayList<>();

    Actor(Game game) {
        this.game = game;
        this.game.addActor(this);
    }

    public void close() {
        this.game.removeActor(this);
        while (components != null && components.size() != 0) {
            this.components.remove(this.components.size() - 1).close();
        }
    }

    public void processInput() {
        if (this.state == State.Active) {
            for (var comp : this.components) {
                comp.processInput();
            }
            actorInput();
        }
    }

    private void actorInput() {};

    public void update(float deltatime) {
        if (this.state == State.Active) {
            this.updateComponent(deltatime);
            this.updateActor(deltatime);
        }
    }

    private void updateComponent(float deltatime) {
        for (var comp : this.components) {
            comp.update(deltatime);
        }
    }

    public void updateActor(float deltatime) {}

    public void addComponent(Component component) {
        int updateOrder = component.getUpdateOrder();
        int i = 0;
        for (; i < this.components.size(); i++) {
            if (updateOrder < this.components.get(i).getUpdateOrder()) break;
        }
        if (i >= this.components.size()) this.components.add(component);
        else this.components.add(i, component);
    }

    public void removeComponent(Component component) {
        this.components.remove(component);
    }
}
