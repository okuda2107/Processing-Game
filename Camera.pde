class Camera extends Actor {
    private float forwardSpeed = 0;
    private float strafeSpeed = 0;
    private float angleSpeed = 0;

    Camera(Game game) {
        super(game);
    }

    @Override
    public void updateActor(float deltatime) {
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

        PVector temp = new PVector(-sin(this.rotation.y), 0, cos(this.rotation.y));
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
            this.position.x + forwardVec.x,
            this.position.y + forwardVec.y,
            this.position.z + forwardVec.z,
            0, 1, 0
        ); // ここちょっと違う，rotationは角度なのでcosとかsinとかを使う必要アリ
        this.forwardSpeed = 0;
        this.strafeSpeed = 0;
        this.angleSpeed = 0;
    }
}
