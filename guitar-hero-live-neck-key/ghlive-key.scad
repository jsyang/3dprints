desiredEquiTriLength = 6.5;
radius = sqrt(pow(desiredEquiTriLength,2) / (2 - 2*cos(120)));

rotate([0,-90,0])
union() {
  cylinder(r=radius,h=10,$fn=3);

  translate([0,0,10])
  scale([1,2,1]) 
    cylinder(r=radius,h=10,$fn=3);
}