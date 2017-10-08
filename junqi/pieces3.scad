IMPORT_SCALE=0.02;
EXPORT_SCALE =1.5;

module extrudeSVG(name) {
    linear_extrude(height=2)
    scale([IMPORT_SCALE,IMPORT_SCALE,IMPORT_SCALE])
        import(str("./",name,".svg"));
}

module piece(name="flag") {
    union() {
        extrudeSVG(name);
    
        translate([0,0,-2])
        hull()
        extrudeSVG(name);
    }
}

piece("bomb");