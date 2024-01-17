import processing.net.*;

class Sender {
    private Game game;
    private String IP = sendIP;
    private int port = sendPort;
    private Client client;
    public Client getClient() {
        return this.client;
    }

    Sender(Game game) {
        this.game = game;
    }

    public void initialize(PApplet that) {
        this.client = new Client(that, this.IP, this.port);
        while (!this.client.active()) {
            this.client = new Client(that, this.IP, this.port);
        }
    }
}
