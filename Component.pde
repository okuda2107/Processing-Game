class Component {
    protected Actor owner;
    protected int updateOrder = 100;
    public int getUpdateOrder() {
        return this.updateOrder;
    }

    Component(Actor owner, int updateOrder) {
        this.owner = owner;
        this.updateOrder = updateOrder;
        this.owner.addComponent(this);
    }

    Component(Actor owner) {
        this.owner = owner;
        this.owner.addComponent(this);
    }

    public void close() {
        this.owner.removeComponent(this);
    }

    public void processInput() {}
    public void update(float deltatime) {}
}
