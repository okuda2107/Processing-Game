import java.util.Arrays;
import processing.net.*;

class SendComponent extends Component {
    SendComponent(Actor owner) {
        super(owner);
    }

    @Override
    public void close() {
        super.close();
    }

    @Override
    public void update(float deltatime) {
        // 送信処理
        String m = new String();
        m = Arrays.toString(owner.position.array()) + ";" + Arrays.toString(owner.rotation.array()) + ";";
        this.owner.getGame().getSender().getClient().write(m);
    }
}
