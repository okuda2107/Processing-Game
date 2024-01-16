import processing.net.*;

class ReceiveComponent extends Component {
    ReceiveComponent(Actor owner) {
        super(owner);
    }

    @Override
    void update(float deltatime) {
        // 受信処理
        Client c = this.owner.getGame().getReceiver().getServer().available();
        if (c != null) {
            String s = c.readString();
            String[] arr = s.split(",");
            owner.position = new PVector(
                Float.parseFloat(arr[0]),
                Float.parseFloat(arr[1]),
                Float.parseFloat(arr[2])
            );
            owner.rotation = new PVector(
                Float.parseFloat(arr[3]),
                Float.parseFloat(arr[4]),
                Float.parseFloat(arr[5])
            );
        }
    }
}
