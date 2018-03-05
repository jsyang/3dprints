// Pi Zero W Plate

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

// Mounting clip slots
difference(){
  plate(plate_height=4);
  
  // Distance between the slots is 8mm
  // Slot thickness = 3.1mm
  translate([(65-33)/2, 9,-10])
  cube([33,3.1,20]);
  
  translate([(65-33)/2, 18,-10])
  cube([33,3.1,20]);
}