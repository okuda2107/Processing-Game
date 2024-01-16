import processing.net.*;

class SendComponent extends Component {
    SendComponent(Actor owner) {
        super(owner);
    }

    @Override
    void update(float deltatime) {
        // 送信処理
        String m = new String();
        m = String.join(",", owner.position.array()) + "," + String.join(",", owner.position.array());
        this.owner.getGame().getSender().getClient().write(m);
    }
}
