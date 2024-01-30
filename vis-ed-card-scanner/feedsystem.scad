module Hopper() {
  CARDW = 90;
  CARDH = 38;
  
  HOPPERD = 60;
  HOPPER_WALL_SIZE = 2;
  
  difference(){
    union() {
      cube([CARDW + HOPPER_WALL_SIZE, HOPPERD, CARDH + HOPPER_WALL_SIZE], center=true);
      
      // Flange for mounting
      translate([0,-HOPPERD/2,0])
        cube([CARDW + HOPPER_WALL_SIZE * 10, 3, CARDH + HOPPER_WALL_SIZE * 3], center=true);
    }
    
    // Cutout channel
    cube([CARDW + HOPPER_WALL_SIZE, HOPPERD, CARDH + HOPPER_WALL_SIZE], center=true);
  }
}

Hopper();