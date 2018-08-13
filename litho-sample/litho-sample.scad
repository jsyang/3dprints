difference() {
  translate([200,356,0]*-.5*.5)
    cube([200,356,0]*0.5 + [0,0,8.5]);
  
  translate([0,0,-0.01])
  scale([0.5,0.5,0.08])
    surface(file = "litho-sample.png", center = true, convexity = 5);
}


