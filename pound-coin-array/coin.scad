module coin() {
  difference() {
    
cylinder(h=2.9,d=22,center=true);
    translate([0,0,1])

    linear_extrude(1)
      text("1",10,"Courier Bold",halign="center",valign="center");
  }
}

/*
for(i=[0:3]){
  for(j=[0:3]){
    translate([24*i,24*j,0])
    coin();
  }
}
*/

coin();