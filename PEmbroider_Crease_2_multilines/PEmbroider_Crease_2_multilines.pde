// Test program for the PEmbroider library for Processing:
// Lines and curves

import processing.embroider.*;
PEmbroiderGraphics E;
int frameX = 160; //width of embroidery frame (mm)
int frameY = 130; //height of embroidery frame (mm)

void setup() {
  noLoop(); 
  size (1040, 1040);
  

  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("Crease_stroke15_space5_nline3.pes");
  E.setPath(outputFilePath); 

  E.beginDraw(); 
  E.clear();
  E.noFill(); 
 
  //-----------------------
  // Vary stroke weight, 
  // show both PERPENDICULAR & TANGENT
  int nLines = 4; 
  int lineLength = width-100;
  
  E.strokeSpacing(5.0); //stitch spacing (param1)
  E.setStitch(5, 15, 0.0);
  E.PARALLEL_RESAMPLING_OFFSET_FACTOR = 0.33;
  
  
  //#1: PERPENDICULAR (column1)
  E.strokeCap(SQUARE); // NOTE: currently not working for PERPENDICULAR
  E.strokeMode(PEmbroiderGraphics.PERPENDICULAR); 
  //repeats a stitch at the end of each line drawn
  E.beginRepeatEnd(2);  
  
  
  int lineX =50; //initial X from g column
  for (int i=0; i<nLines; i++) {
    float x0 = lineX; 
    float x1 = x0+lineLength;
    //float y0 = height/2;
    float y0 = map(i, 0, nLines-1, 50, height-50);
    //E.strokeWeight((i+1)*5); //strokeWeight (param2) --round1
    E.strokeWeight(15); //strokeWeight (param2) --round2
    E.line (x0, y0, x1, y0);
  }
 
  E.endRepeatEnd();

  //-----------------------
  E.optimize(); // slow, but very good and important
  E.visualize();
  E.endDraw(); // write out the file
  save("Crease_stroke15_space5_nline3.png");
}
