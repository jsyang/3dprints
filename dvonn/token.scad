module ring_cross_section() {
    translate([27.5,25,0])
    mirror([1,1,0])
    hull() {
        translate([5,5,0])
            circle(r=10, $fn=20);
        
        translate([6,25,0])
            circle(r=15, $fn=20);
        
        translate([15,55,0])
            circle(r=2.5, $fn=20);
        
        translate([20,52.5,0])
            square(5);
        
        translate([20,20,0])
            circle(r=5, $fn=20);
    }
}

module token() {
    rotate_extrude(angle=360, convexity=2) {
        translate([50,0,0])
        ring_cross_section();
    }
}

module token_array(w,h) {
    OFFSET = 165;
    
    for(x=[0:w-1]) {
        for(y=[0:h-1]) {
            translate([x*OFFSET,y*OFFSET,0])
            token();
        }
    }
}

SCALE_FACTOR = 1/8;
WORLD_SCALE = [SCALE_FACTOR,SCALE_FACTOR,SCALE_FACTOR];

translate([12,12,0])
scale(WORLD_SCALE) token_array(3,1);