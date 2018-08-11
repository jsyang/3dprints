module A_BatteryHolder() {
  difference() {
    cylinder(r=27/2, h=70, $fn=6);
    
    #
    translate([0,0,2])
    hull() {
      translate([0,8,0])
        cylinder(r=18.2/2, h=65.8,$fn=32);
        
      cylinder(r=18.6/2,h=65.8,$fn=32);
    }
  
  }
}

A_BatteryHolder();