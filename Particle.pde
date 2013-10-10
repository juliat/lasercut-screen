class Particle {
  //float px;
  //float py;
  float vx;
  float vy;
  PVector currentPosition;
  ArrayList<PVector> trail;
  int trailWidth;
  float damping;
  float mass;
  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = true;
  
 
  // Constructor for the Particle
  Particle (float x, float y) {
    currentPosition = new PVector(x, y);
    vx = vy = 0;
    damping = 0.96;
    mass = 1.0;
    trail = new ArrayList<PVector>();
    trailWidth = 9;
  }
   
  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx += ax;
    vy += ay;
  }
 
  // Update the position. Another step of Euler integration.
  void update() {
    vx *= damping;
    vy *= damping;
    limitVelocities();
    handleBoundaries();
    currentPosition.x += vx;
    currentPosition.y += vy;
    PVector logPosition = new PVector(currentPosition.x, currentPosition.y);
    trail.add(logPosition);
    println(trail.size());
  }
   
   
  void limitVelocities(){
    if (bLimitVelocities){
      float speed = sqrt(vx*vx + vy*vy);
      float maxSpeed = 10;
      if (speed > maxSpeed){
        vx *= maxSpeed/speed;
        vy *= maxSpeed/speed;
      }
    }
  }
 
  void handleBoundaries() {
    // wraparound
    if (bPeriodicBoundaries) {
      if (currentPosition.x > width - margin ) currentPosition.x -= width;
      if (currentPosition.x < margin     ) currentPosition.x += width;
      if (currentPosition.y > height - margin) currentPosition.y -= height;
      if (currentPosition.y < margin     ) currentPosition.y += height;
    }
    // bounce
    else {
      if (currentPosition.x > width - margin ) vx = -vx;
      if (currentPosition.x < margin     ) vx = -vx;
      if (currentPosition.y > height - margin) vy = -vy;
      if (currentPosition.y < margin     ) vy = -vy;
    }
  }
 
 
 /* I want my particles to draw their trails but can't figure out how. Thoughts? */
  void render() {
    drawStrokeOutline(trail, trailWidth);
  }
}

