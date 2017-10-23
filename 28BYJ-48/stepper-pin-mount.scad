module hole(tolerance=0.1) {
    difference() {
        circle(d=5+tolerance/2, $fn=32);
          
        translate([-2.5,1.5+tolerance/2])
        square([5,5]);
 
        scale([1,-1])
        translate([-2.5,1.5+tolerance/2])
        square([5,5]);
    }
}


linear_extrude(height=3)
difference() {
    translate([-5,-5])
    square([10,10]);
    
    hole();
}