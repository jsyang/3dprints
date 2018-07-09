module hook(){
  $fn=48;
  union() {
    rotate_extrude(angle=160) {
      translate([20,0])
      circle(r=5);
    }
    
    translate([20,0,0])
    rotate([90,0,0])
      cylinder(r=5,h=70.5);
        
    translate([17.25,-50,0])
    rotate([90,0,-40])
      cylinder(r=5,h=70);

    translate([-20,-110])
    rotate([180,0,50-180])
    rotate_extrude(angle=90) {
      translate([10,0])
      circle(r=5);
    }
    
    translate([0,-40])
    rotate([180,0,0])
    rotate_extrude(angle=40) {
      translate([20,0])
      circle(r=5);
    }

    translate([0,-70.5])
    rotate([180,0,0])
    rotate_extrude(angle=40) {
      translate([20,0])
      circle(r=5);
    }

    translate([18.,-80,0])
    rotate([90,0,-40])
      cylinder(r=5,h=50);

    translate([-20,-110])
    rotate([180,0,50-180])
    rotate_extrude(angle=-90) {
      translate([10,0])
      circle(r=5);
    }
  }
}

planeSize=1000;

difference(){
  hook();

  translate([-planeSize/2,-planeSize/2,3.5])
    cube([planeSize,planeSize,40]);
  
  translate([-planeSize/2,-planeSize/2,-40-3.5])
    cube([planeSize,planeSize,40]);
}