module chainringBoltSpacer(diameter=9.9, tolerance=0.26, _fn = 32) {
  difference() {
    cylinder(r=9, h=2, $fn=_fn);
    
    translate([0,0,-0.1])
      cylinder(r=diameter * 0.5 + tolerance, h=2.2, $fn=_fn);
  }
}

chainringBoltSpacer();