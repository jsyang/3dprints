// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function add2(v) = [for(p=v) 1] * v;
function mean(v) = add2(v) / len(v);

nutHoleRadius = 6.6/2;
tolerance=0.3;

cornerRadius = 3.5;
length=mean([120.4-tolerance]);
width=mean([57.5-tolerance]);


module nutHole(r1=nutHoleRadius, r2=nutHoleRadius) {
  translate([0,0,-3])
  cylinder(r1=r1, r2=r2, h=6, $fn=6);
}

module backPlateL1() {
  $fn=32;
  depth=1.5;
  
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
    translate([8.3,15.5,-1])
    cylinder(r=4.5, h=depth+2);
    
    // flash led hole
    translate([8.3,30.5,-1])
    cylinder(r=1.5,h=depth+2);

    // B nut hole
    translate([8.3,width-8.25+nutHoleRadius,0])
    nutHole(r1=nutHoleRadius+2,r2=nutHoleRadius-0.7);

    // D nut hole
    translate([length-3.8+nutHoleRadius, 4.8, 0])
    nutHole(r1=nutHoleRadius+1,r2=nutHoleRadius-0.7);

    // A nut hole
    translate([4.8+nutHoleRadius, 5.5, 0])
    nutHole(r1=nutHoleRadius+2,r2=nutHoleRadius-0.7);    
    
    // C nut hole
    translate([length-5.5+nutHoleRadius, width-2.5, 0])
    nutHole(r1=nutHoleRadius+2,r2=nutHoleRadius-0.7);
  }
}


module backPlateL2() {
  $fn=32;
  depth=1.5;
  
  /**
  
    A --- B
    |     |
    D --- C
  
  **/
  r2diff = 1.5;
  
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
    translate([8.3,15.5,-1])
    cylinder(r1=3,r2=8,h=depth+2);
    
    // flash led hole
    translate([8.3,30.5,-1])
    cylinder(r1=0.5, r2=4,h=depth+2);

    // B nut hole
    translate([8.3,width-8.25+nutHoleRadius,0])
    nutHole();

    // D nut hole
    translate([length-3.8+nutHoleRadius, 4.8, 0])
    nutHole();
    
    // A nut hole
    translate([4.8+nutHoleRadius, 5.5, 0])
    nutHole();

    // C nut hole
    translate([length-5.5+nutHoleRadius, width-2.5, 0])
    nutHole();

  }
}

module main() {
  cubeRadius = 1.2;
  cubeSize = 9-tolerance;

  
  rotate([0,0,90])  {
    difference(){
      union(){
        backPlateL1();
        translate([0,0,1.5])
          backPlateL2();

        // square insert
        translate([0,0,2.5])
        translate([length+cornerRadius,width+cornerRadius,0]*0.5)
        translate([-0.5,-0.5,0]*cubeSize)
        cube([cubeSize,cubeSize,1.25]);
      }
      
      // cutting corners
      translate([cubeSize/2,cubeSize/2,2.501])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*1.6)
      cube([1,1,1]*1.6);
      translate([-cubeSize/2,cubeSize/2,2.501])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*1.6)
      cube([1,1,1]*1.6);
      translate([-cubeSize/2,-cubeSize/2,2.501])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*1.6)
      cube([1,1,1]*1.6);
      translate([cubeSize/2,-cubeSize/2,2.501])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      rotate([0,0,45])
      translate([-0.5,-0.5,0]*1.6)
      cube([1,1,1]*1.6);
      
      
      
      // pilot screw hole for square insert
      translate([0,0,2])
      translate([length+cornerRadius,width+cornerRadius,1]*0.5)      
      cylinder(r=4.5/2+tolerance,h=1.6,$fn=32);      
      
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