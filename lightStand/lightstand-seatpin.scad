legSize=[80,30,10];
tolerance=0.3;

difference(){
  union(){
    $fn=48;
    cylinder(r1=50/2, r2=42/2, h=30);

    for(i=[0:120:360]){
      rotate([0,0,i])
      translate(legSize*-.5+[50,0,5])
        cube(legSize);
    }
  }
  
  $fn=32;
  translate([0,0,10])
  cylinder(r=34.3/2+tolerance,h=40);
}