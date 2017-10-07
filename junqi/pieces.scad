IMPORT_SCALE=0.03;
EXPORT_SCALE =1.5;

module flag() {
    translate([-23,5.5,0])
    rotate([-90,0,90])
    scale([IMPORT_SCALE,IMPORT_SCALE,IMPORT_SCALE])
        import("./flag_fixed.stl", $fn=2);
}

module flag_tile() {
    union(){        
        scale([1,1,4])
        flag();
        
        translate([-0.2,0.1,-1.7])
        cube([13.4,8.9,2.5],center=true);
    }
}




scale([EXPORT_SCALE,EXPORT_SCALE,EXPORT_SCALE])
flag_tile();