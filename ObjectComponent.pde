class ObjectComponent extends Component {

    ObjectComponent(Actor owner) {
        super(owner);
        this.owner.getGame().getRenderer().addObject(this);
    }

    @Override
    public void close() {
        super.close();
        this.owner.getGame().getRenderer().removeObject(this);
    }
}
