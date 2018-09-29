// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function add2(v) = [for(p=v) 1] * v;
function mean(v) = add2(v) / len(v);

nutHoleRadius = 6.6/2;
tolerance=0.3;

cornerRadius = 3.5;
length=mean([120.4-tolerance]);
width=mean([57.7-tolerance]);

module lensHole() {
  $fn=32;
  depth=1;
  
  hull() {
    // camera + led hole
    translate([4.5+2.6,2.6+4.5,-1])
    cylinder(r=4.5, h=depth+2);
    // camera hole
    translate([4.5+2.6,14,-1])
    cylinder(r=4.5, h=depth+2);
  }
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
    
    lensHole();
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
    
    lensHole();
  }
}

module main() {
  cubeRadius = 1.2;
  cubeSize = 9-tolerance+0.06;
  cornerCutSize = 1.4;
  
  pegSize = [12.9,12.9,2.5];
  topSize = [17,17,2];
  
  rotate([0,0,90])  {
    union(){
      backPlateL1();
      translate([0,0,1])
        backPlateL2();

      // square insert
      translate([0,0,2])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      translate([0,0,pegSize[2]]*.5)
      translate(pegSize*-.5)
      cube(pegSize);

      // square insert top
      translate([0,0,2+2.5])
      translate([length+cornerRadius,width+cornerRadius,0]*0.5)
      translate([0,0,topSize[2]]*.5)
      translate(topSize*-.5)
      cube(topSize);

    }      
  }
}

main();