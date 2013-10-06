void drawStrokeOutline(ArrayList<PVector> points, int strokeWidth) {
  noFill();
  stroke(0);
  strokeWeight(1);
    
  beginShape();
  // iterate over points in array going from to back, drawing shape
  for (int i=0; i < points.size(); i++) {
    PVector currentPoint = points.get(i);
    vertex(currentPoint.x, currentPoint.y);
  }
  endShape();
  
  /*
  beginShape();
  // then go backwards, and shift all points down by strokeWidth, 
  // continuing the same shape
  int lastIndex = points.size() - 1;
  for (int i=lastIndex; i >=0; i--) {
    PVector currentPoint = points.get(i);
    vertex(currentPoint.x - strokeWidth, currentPoint.y + (strokeWidth*0.5));
  }
  endShape();
  */
  
  /* delete later
   stroke(0);
   PVector sPoint = points.get(points.size() - 1);
   line(sPoint.x, sPoint.y, sPoint.x - strokeWidth, sPoint.y + (strokeWidth*0.5));
  */
  
  if (doneDrawing) {  // draw start cap
   /* stroke(0);
    PVector startPoint = points.get(0);
    line(startPoint.x, startPoint.y, startPoint.x - strokeWidth, startPoint.y + (strokeWidth*0.5));

    // close line by drawing caps
    PVector endPoint = points.get(lastIndex);
    line(endPoint.x, endPoint.y, endPoint.x - strokeWidth, endPoint.y + (strokeWidth*0.5));
    */
    noLoop();
  }
} 
