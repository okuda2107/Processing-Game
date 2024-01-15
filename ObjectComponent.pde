class ObjectComponent extends Component {
    private PShape object;
    public void setShape(String objName) {
        this.object = loadShape(objName);
    }

    ObjectComponent(Actor owner) {
        super(owner);
        this.owner.getGame().getRenderer().addObject(this);
    }

    @Override
    public void close() {
        super.close();
        this.owner.getGame().getRenderer().removeObject(this);
    }

    public void draw(int screenWidth, int screenHeight) {
        translate(
            this.owner.position.x,
            this.owner.position.y,
            this.owner.position.z
        );
        rotateX(this.owner.rotation.x);
        rotateY(this.owner.rotation.y);
        rotateZ(this.owner.rotation.z);
        scale(100); // 小さかったらココ編集
        shape(object);
    }
}
