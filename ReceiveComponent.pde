import processing.net.*;

class ReceiveComponent extends Component {
    ReceiveComponent(Actor owner) {
        super(owner);
    }

    @Override
    public void close() {
        super.close();
    }

    @Override
    public void update(float deltatime) {
        // 受信処理
        Client c = this.owner.getGame().getReceiver().getServer().available();
        if (c != null) {
            String s = c.readString();
            String[] arr = s.split(";");
            String[] pos = arr[0].replace("[", "").replace("]", "").split(",");
            String[] rot = arr[1].replace("[", "").replace("]", "").split(",");
            this.owner.position = new PVector(
                Float.parseFloat(pos[0]),
                Float.parseFloat(pos[1]),
                Float.parseFloat(pos[2])
            );
            println(pos[2]);
            println(rot[2]);
            println("debug");
            this.owner.rotation = new PVector(
                Float.parseFloat(rot[0]),
                Float.parseFloat(rot[1]),
                Float.parseFloat(rot[2])
            );
        }
    }
}
