import processing.net.*;

class Client {
    private Game game;
    private String IP = "123.234.345";
    private int port = 20000;
    private Client client;

    Client(Game game) {
        this.game = game;
    }

    public void initialize(PApplet that) {
        this.client = new Client(that, this.IP, this.port);
    }
}
