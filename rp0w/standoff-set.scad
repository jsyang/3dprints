use <threads.scad>;

// Not the greatest. Should probably use a different joint for this.
// Pronged spring connector?

module standoff_bolt(depth=5, bolt_length=20) {    
    union() {
        difference(){
            cylinder(r=3.5, h=bolt_length, $fn=6);
            translate([0,0,-0.01])
                metric_thread(diameter=2.9, pitch=1.1, length=depth + 1, internal=true);
        }
        
        translate([0,0,bolt_length])
            metric_thread(diameter=2.9, pitch=0.8, length=depth, internal=false);    
    }
}

standoff_bolt();