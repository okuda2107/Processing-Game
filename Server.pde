import processing.net.*;

class Server {
    private Game game;
    private String myIP = "123.234.345";
    private int myPort = 20000;
    private Server server;

    Server(Game game) {
        this.game = game;
    }

    public void initialize(PApplet that) {
        this.server = new Server(that, this.myPort);
    }
}
