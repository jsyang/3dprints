bulgeRadius = 12;
bulgeHeight = 20;
bulgeLength = 20;
bulgeDepth  = 40;

holeWidth = 4;
holeHeight = 7;

module bulge() {
  linear_extrude(bulgeDepth)
  difference(){
    hull() {    
      circle(bulgeRadius);

      translate([0,bulgeHeight,0])
        circle(bulgeRadius);
    }
    

    translate([0,bulgeHeight,0])
    union(){
      circle(bulgeRadius + .05);
      square([bulgeRadius*2 + 0.05, bulgeRadius + .05], true);
    }
  }
}

module throughHole() {
  translate([0,0,holeHeight/2])
    cube([bulgeRadius*2+0.1, holeWidth, holeHeight], true);
}

difference(){
  bulge();
  
  translate([0,0,bulgeDepth - holeHeight- holeWidth])
  throughHole();
  
  translate([0,0,holeHeight- holeWidth])
  throughHole();
}