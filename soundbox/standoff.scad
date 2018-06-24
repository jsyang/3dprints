$fn=32;

difference(){
  cylinder(r=(5.2+3)/2, h=6);
  translate([0,0,-1])
    cylinder(r=(5.2)/2, h=8);
}