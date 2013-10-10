import oscP5.*;
import netP5.*;

ArrayList<Particle> myParticles;
boolean doneDrawing = false;

int margin;

void setup() {
  size(864, 864);
  myParticles = new ArrayList<Particle>();
 
  margin = 50;

  for (int i=0; i<400; i++) {
    float rx = random(margin, width-margin);
    float ry = random(margin, height-margin);
    myParticles.add( new Particle(rx, ry));
  }
  smooth();
}
 
void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}
void keyPressed() {
  if (key == 's') {
    doneDrawing = true;
  }
}
 
void draw() {
  // background (255);
  float gravityForcex = 0;
  float gravityForcey = 0.02;
  float mutualRepulsionAmount = 1.05;
 
 
  // calculating repulsion and updating particles
  for (int i=0; i<myParticles.size(); i++) {
    Particle ithParticle = myParticles.get(i);
    float px = ithParticle.currentPosition.x;
    float py = ithParticle.currentPosition.y;
 
    if (mousePressed) {
      ithParticle.addForce (gravityForcex, gravityForcey);
    }
 
    for (int j=0; j<i; j++) {
      Particle jthParticle = myParticles.get(j);
      float qx = jthParticle.currentPosition.x;
      float qy = jthParticle.currentPosition.y;
 
      float dx = px - qx;
      float dy = py - qy;
      float dh = sqrt(dx*dx + dy*dy);
      if (dh > 1.0) {
         
        float componentInX = dx/dh;
        float componentInY = dy/dh;
        float proportionToDistanceSquared = 1.0/(dh*dh);
         
        float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
        float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;
 
        ithParticle.addForce( repulsionForcex,  repulsionForcey); // add in forces
        jthParticle.addForce(-repulsionForcex, -repulsionForcey); // add in forces
      }
    }
  }
 
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = false;
    myParticles.get(i).update(); // update all locations
  }
 
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).render(); // draw all particl
  }
}



