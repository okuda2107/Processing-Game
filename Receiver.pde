import processing.net.*;

class Receiver {
    private Game game;
    private String myIP = "localhost";
    private int myPort = receivePort;
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
