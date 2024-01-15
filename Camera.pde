class Camera extends Actor {
    private float moveSpeed = 100;
    private float angleSpeed = 0.001;

    Camera(Game game) {
        super(game);
    }

    @Override
    public void update(float deltatime) {
        if (keyPressed == true && key == 'a') {
            this.position.x -= this.moveSpeed * deltatime;
        }
        if (keyPressed == true && key == 's') {
            this.position.z += this.moveSpeed * deltatime;
        }
        if (keyPressed == true && key == 'w') {
            this.position.z -= this.moveSpeed * deltatime;
        }
        if (keyPressed == true && key == 'd') {
            this.position.x += this.moveSpeed * deltatime;
        }
        PVector diff = new PVector(pmouseX - mouseX, pmouseY - mouseY);
        diff = PVector.mult(diff, angleSpeed);
        PVector temp = new PVector();
        temp = PVector.add(this.rotation, diff);
        temp.normalize(this.rotation);
        camera(
            this.position.x,
            this.position.y,
            this.position.z,
            this.position.x + this.rotation.x,
            this.position.y + this.rotation.y,
            this.position.z + this.rotation.z,
            0, 1, 0);
    }
}
