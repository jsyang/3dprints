module cardFrame() {
    import("dbs-frame.stl", convexity=3);
}

for(i=[0:1]) {
    for(j=[0:3]) {
        translate([70*i, 40*j,0])
        cardFrame();
    }
}