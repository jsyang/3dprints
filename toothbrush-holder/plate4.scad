module plate1() {
    difference() {
        import("Mount Plate.stl", convexity=3);

        translate([-35,-70,-25])
        cube([30,90,65]);
    }
}

if(1){
for(i=[0:3]) {
    translate([40*i,0,0])
    plate1();
}    
}

//    plate1();