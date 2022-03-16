module teeth() {
   import("teeth.svg");
}

module body() {
   import("body.svg");
}


difference() {
  linear_extrude(8)
    body();

  translate([4,6,6])
  linear_extrude(3)
  scale([1,1,1]*1.1)
    teeth();
  
  translate([11.75,16.5,2])
    cylinder(h=10, r=6,center=true, $fn=32);
  

  translate([67.5,40,8-0.24])
  linear_extrude(8)
  union() {
    translate([0,8,0])
      text("BOOKMAN    ",size=18.5, halign="center", font="Univers LT 59 Ultra Condensed:style=Bold");
    
    translate([0,-14,0])
        text("ARCHIVE.com",size=18.5, halign="center", font="Univers LT 59 Ultra Condensed:style=Bold");
  }
}