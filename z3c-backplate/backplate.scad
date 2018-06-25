// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function add2(v) = [for(p=v) 1] * v;
function mean(v) = add2(v) / len(v);

nutHoleRadius = 6.6/2;
tolerance=0.3;

cornerRadius = 3.5;
length=mean([120.4-tolerance]);
width=mean([57.7-tolerance]);


module nutHole(r1=nutHoleRadius, r2=nutHoleRadius) {
  translate([0,0,-3])
  cylinder(r1=r1, r2=r2, h=6, $fn=6);
}

module backPlateL1() {
  $fn=32;
  depth=1;
  
  /**
  
    A --- B
    |     |
    D --- C
  
  **/
  
  difference() {
    linear_extrude(height=depth)
    hull() {
      // D
      translate([cornerRadius,cornerRadius])
      circle(cornerRadius);
      
      // C
      translate([length,cornerRadius])
      circle(cornerRadius);

      // B
      translate([length,width])
      circle(cornerRadius);
      
      // A
      translate([cornerRadius,width])
      circle(cornerRadius);    
    }
    

    // camera hole
    translate([8.3,15,-1])
    cylinder(r=4.5, h=depth+2);
    
    // flash led hole
    translate([8.3,30.5,-1])
    cylinder(r=1.5,h=depth+2);
  }
}


module backPlateL2() {
  $fn=32;
  depth=1;
  
  /**
  
    A --- B
    |     |
    D --- C
  
  **/
  r2diff = 2.2;
  
  difference() {
    hull() {
      // D
      translate([cornerRadius,cornerRadius])
      cylinder(r1=cornerRadius,r2=cornerRadius-r2diff, height=depth);
      
      // C
      translate([length,cornerRadius])
      cylinder(r1=cornerRadius,r2=cornerRadius-r2diff, height=depth);

      // B
      translate([length,width])
      cylinder(r1=cornerRadius,r2=cornerRadius-r2diff, height=depth);
      
      // A
      translate([cornerRadius,width])
      cylinder(r1=cornerRadius,r2=cornerRadius-r2diff, height=depth);
    }
    

    // camera hole
    translate([8.3,15,-1])
    cylinder(r1=3,r2=8,h=depth+2);
    
    // flash led hole
    translate([8.3,30.5,-1])
    cylinder(r1=0.5, r2=9,h=depth+2);
  }
}

module main() {
  cubeRadius = 1.2;
  cubeSize = 9-tolerance+0.06;
  cornerCutSize = 1.4;
  
  rotate([0,0,90])  {
    difference(){
      union(){
        backPlateL1();
        translate([0,0,1])
          backPlateL2();

        // square insert
        translate([0,0,3])
        translate([length+cornerRadius,width+cornerRadius,0]*0.5)
        translate([-0.5,-0.5,0]*cubeSize)
        cube([cubeSize,cubeSize,1.5]);

        translate([0,0,2])
        translate([length+cornerRadius,width+cornerRadius,0]*0.5)        
        cylinder(r2=2,r1=30,$fn=6,h=1.5);
      }
      
      // cutting corners
      translate([cubeSize/2,cubeSize/2,3.301])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*cornerCutSize)
      cube([1,1,1]*cornerCutSize);
      translate([-cubeSize/2,cubeSize/2,3.301])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*cornerCutSize)
      cube([1,1,1]*cornerCutSize);
      translate([-cubeSize/2,-cubeSize/2,3.301])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*cornerCutSize)
      cube([1,1,1]*cornerCutSize);
      translate([cubeSize/2,-cubeSize/2,3.301])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*cornerCutSize)
      cube([1,1,1]*cornerCutSize);
      
      
      
      // pilot screw hole for square insert
      translate([0,0,2])
      translate([length+cornerRadius,width+cornerRadius,1]*0.5)      
      cylinder(r=4.5/2+tolerance,h=2.6,$fn=32);      
      
      // pilot screw hole for square insert
      translate([0,0,-1])
      translate([length+cornerRadius,width+cornerRadius,1]*0.5)      
      cylinder(r1=4,r2=1.5,h=1,$fn=32);      


      //* screw hole for square insert
      translate([length+cornerRadius,width+cornerRadius,-1]*0.5)      
      cylinder($fn=32,r=(1.6+tolerance)/2,h=4);
      //*/
    }  
  }
}

main();