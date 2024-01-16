import processing.net.*;

class Receiver {
    private Game game;
    private String myIP = "123.234.345";
    private int myPort = 20000;
    private Server server;
    public Server getServer() {
        return this.server;
    }

    Receiver(Game game) {
        this.game = game;
    }

    public void initialize(PApplet that) {
        this.server = new Server(that, this.myPort);
    }
}
