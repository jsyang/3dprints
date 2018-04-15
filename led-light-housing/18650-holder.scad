module terminal(tolerance=0.3) {
  connectorSize = [5,14,2];

  translate([-.5*connectorSize[0],0,0])
  difference(){
    union(){
      translate([0,0,1.5])
      rotate([0,90,0])
      cylinder(r=1.5,h=connectorSize[0], $fn=16);
      
      cube(connectorSize);
    }
    
    translate([connectorSize[0]/2,0,-.5])
    rotate([0,0,0])
    cylinder(r=(1+tolerance)/2, h=5, $fn=16);
    
    translate([connectorSize[0]/2,16,0.4])
    rotate([90,0,0])
    cylinder(r=(1+tolerance)/2, h=20, $fn=16);

  }
}

module cell18650(tolerance=0.5) {
  cylinder(r=(18+tolerance)/2, h=65,$fn=32);
}

module holder(tolerance=0.3, showCell=true){
  plateSize = [24,5,65+6];
  stabilizerSize = [24,10,65-tolerance];
  verticalStabSize = [24,8,3];
  
  difference(){
      
    union(){
      terminal();

      translate([0,0,65+6])
      rotate([0,180,0])
      terminal();
      
      translate([.5,.5,0]*-plateSize[0] + [0,14+plateSize[1]+2,0])
      cube(plateSize);
      
      if(showCell) {
        #
        translate([0,0,3])
          cell18650();
      }
      
      // Stabilizer fins to stop cell from moving horizontally
      difference() {      
        translate([0,4,plateSize[2]*0.5])
        translate(-.5*stabilizerSize)
          cube(stabilizerSize);
        
        translate([0,0,3])
          cell18650();
      }
      
      // Vert stab to stop cell from moving vertically
      translate(verticalStabSize*-.5+[0,5,2-tolerance*2])
      difference(){
        cube(verticalStabSize);        
        translate([verticalStabSize[0]-8,-1,-1]*.5)
        cube(verticalStabSize-[16,-1,-2]);
      }
      
      translate(verticalStabSize*-.5+[0,5,2-tolerance*2 + 65+6 - 3])
      difference(){
        cube(verticalStabSize);        
        translate([verticalStabSize[0]-8,-1,-1]*.5)
        cube(verticalStabSize-[16,-1,-2]);
      }

    }
    
    translate([0,16,0.4])
    rotate([90,0,0])
      cylinder(r=(1+tolerance)/2, h=20, $fn=16);
    
    translate([0,16,65+6-0.4])
    rotate([90,0,0])
      cylinder(r=(1+tolerance)/2, h=20, $fn=16);

  }
}

holder(showCell=false);