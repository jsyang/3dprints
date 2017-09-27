use <threads.scad>;

// Pi Zero W Camera board

LENGTH = 65;
WIDTH = 30;

module plate(
    peg_hole_radius=1.4,
    peg_offset=2,
    plate_height=2
) {
    linear_extrude(height=plate_height)
    difference() {
        hull() {
            let (radius = 3) {
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

module camera() {
    cube([12,9,6]);
}

module tripod_nut() {
    cylinder(r=6,h=5, $fn=6);
}

// plate();
// camera();

module fisheye_adaptor() {
    translate([0,0,3.5])
    rotate([0,180,0])
    difference() {
        cube([20,20,3.5]);
        
        // thread diameter for this is indeed 17.8 to mate with the fisheye lens
        translate([10,10,-0.01]) 
            metric_thread(diameter=17.8, pitch=1, length=2.5);
    }

}

fisheye_nut();