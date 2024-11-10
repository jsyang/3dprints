module char(c) {
    difference() {
    cube([180,180,1.75], center=true);

    translate([0,-65,-4])
    linear_extrude(height=8) {
    text(c, size=130, font="Heiti TC", language="zh", halign="center", valign="middle");
    }
    }
}

module bridge() {
    cube([30,4,.6]);
}



//bridge();

// ch="明";
//ch="益";

char(ch);

