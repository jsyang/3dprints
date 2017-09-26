// Pi Zero W Camera board

LENGTH = 6.5;
WIDTH = 3;

module plate(
    peg_hole_radius=0.14,
    peg_offset=0.2,
    plate_height=0.2
) {
    linear_extrude(height=plate_height)
    difference() {
        hull() {
            let (radius = 0.3) {
                translate([radius,radius,0]) 
                    circle(r=radius, $fn=16);
                translate([(LENGTH - radius),radius,0]) 
                    circle(r=radius, $fn=16);
                
                // TOP
                translate([radius,WIDTH - radius,0]) 
                    circle(r=radius, $fn=16);
                translate([(LENGTH - radius),WIDTH - radius,0]) 
                    circle(r=radius, $fn=16);
            }
        }
        
        
        let(offset=peg_offset+peg_hole_radius) {
            translate([offset,offset,0])
                circle(peg_hole_radius, $fn=16);
        
            translate([offset,WIDTH - offset,0])
                circle(peg_hole_radius, $fn=16);
            
            translate([LENGTH-offset,offset,0])
                circle(peg_hole_radius, $fn=16);
        
            translate([LENGTH-offset,WIDTH - offset,0])
                circle(peg_hole_radius, $fn=16);

        }
    }
}

module tripod_nut() {
    cylinder(r=0.6,h=0.5, $fn=6);
}

plate();

