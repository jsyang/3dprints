
//difference() {

//    translate([0,0,-3])
//    cylinder(h=3, r=36, $fn=256);
    
    translate([10,5,-1])
    linear_extrude(1)
    text("SONY", size=10, font="SONY's Logo:style=Regular",halign="center", valign="center");
    

    translate([-2,-8,-1])
    linear_extrude(1)
    text("QX", size=10, font="Pathway Extreme:style=ExtraLight",halign="center", valign="center");
//}