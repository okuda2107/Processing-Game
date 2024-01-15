class Camera extends Actor {
    private float forwardSpeed = 0;
    private float strafeSpeed = 0;
    private float angleSpeed = 0.01;

    Camera(Game game) {
        super(game);
    }

    @Override
    public void update(float deltatime) {
        if (keyPressed == true && key == 'a') {
            this.strafeSpeed = -100;
        }
        if (keyPressed == true && key == 's') {
            this.forwardSpeed = -100;
        }
        if (keyPressed == true && key == 'w') {
            this.forwardSpeed = 100;
        }
        if (keyPressed == true && key == 'd') {
            this.strafeSpeed = 100;
        }

        PVector temp = new PVector(this.rotation.x, 0, this.rotation.z);
        PVector forwardVec = new PVector();
        PVector rightVec = new PVector();
        temp.normalize(forwardVec);
        temp = forwardVec;
        rightVec = temp.cross(new PVector(0, 1, 0));
        this.position = PVector.add(this.position, PVector.mult(forwardVec, this.forwardSpeed * deltatime));
        this.position = PVector.add(this.position, PVector.mult(rightVec, this.strafeSpeed * deltatime));
        // PVector diff = new PVector(pmouseX - mouseX, pmouseY - mouseY);
        // diff = PVector.mult(diff, angleSpeed);
        // temp = PVector.add(this.rotation, diff);
        // temp.normalize(this.rotation);
        camera(
            this.position.x,
            this.position.y,
            this.position.z,
            this.position.x + this.rotation.x,
            this.position.y + this.rotation.y,
            this.position.z + this.rotation.z,
            0, 1, 0
        );
        this.forwardSpeed = 0;
        this.strafeSpeed = 0;
    }
}
