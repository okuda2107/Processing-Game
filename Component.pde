class Component {
    protected Actor owner;
    protected int updateOrder = 100;
    public int getUpdateOrder() {
        return this.updateOrder;
    }

    Component(Actor owner, int updateOrder) {
        this.owner = owner;
        this.updateOrder = updateOrder;
        this.owner.addComponent();
    }

    Component(Actor owner) {
        this.owner = owner;
        this.owner.addComponent();
    }

    public void close() {
        this.owner.removeComponent();
    }

    public void processInput() {}
    public void update(fload deltatime) {}
}
