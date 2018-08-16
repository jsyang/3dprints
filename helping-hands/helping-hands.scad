// Rest of the arms and joints can be found at 
// https://www.thingiverse.com/thing:3045687

module A_Foot(){
  difference() {
    union() {
      translate([0,15/4,40])
        sphere(r=15/2, $fn=32);
      cylinder(r=15/4, $fn=32, h=40);
    }
    
    translate([-100,-8-15/6,-1])
      cube([200,8,200]);
  }
}

module B_M5BoltHole() {
    translate([0, 5, 0])
    rotate([90,0,0])
      cylinder(r=5/2, h=10, $fn=32);
}

module C_FeetPlate() {
  
  difference() {
    union() {
      translate([40,0,0])
        A_Foot();

      translate([-40,0,0])
        A_Foot();
      
      translate([-40,-15/6,0])
        cube([80,15/3,10]);
    }
    
    translate([32,0,5])
      B_M5BoltHole();
    
    translate([-32,0,5])
      B_M5BoltHole();
  }
}

rotate([90,0,0])
C_FeetPlate();