// hanoi
FN=128;
DIAM=29;
isCrossSectioned=true;

difference(){
  rotate_extrude($fn=FN)
  translate([33,0,0])
  difference() {
    circle(DIAM/2,$fn=FN);
    circle(DIAM/2-3,$fn=FN);    
  }
    
  if(isCrossSectioned) {
    translate([1,0,0]*.5*500)
      cube([500,500,500],center=true);
  }

}