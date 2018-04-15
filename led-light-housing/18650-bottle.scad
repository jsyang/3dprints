use <../threads.scad>;


module cell_18650(tolerance=0.5) {
  cylinder(r=(18+tolerance)/2, h=65,$fn=32);
}

module bottle_body(tolerance=0.4){
  diameter=18+5;
  bottleHeight = 65+8;
  
  difference(){
    translate([0,0,tolerance])
    hull() {
      cylinder(r=diameter/2 + tolerance, h=bottleHeight);

      translate([0,10,0])
      cylinder(r=diameter*0.7 + tolerance, h=bottleHeight, $fn=16);      
    }
    
    translate([0,26,-1])
      cylinder(r=diameter*0.6 + tolerance, h=bottleHeight+2, $fn=6);      
    
    sideNotchSize= [8,60,9];
    
    
    translate(([0,0,-bottleHeight] + sideNotchSize)*-.5 + [15,0,0])
      cube(sideNotchSize);
    
    translate(([0,0,-bottleHeight] + sideNotchSize)*-.5 + [-15,0,0])
      cube(sideNotchSize);

    // todo: internal metric thread is not working well.
    metric_thread (diameter=diameter-4+tolerance*4, pitch=2, length=4, internal=true, n_starts=2);

    translate([0,0,bottleHeight-4+tolerance*1.5])
      metric_thread (diameter=diameter-4+tolerance*4, pitch=2, length=4, internal=true, n_starts=2);

    cylinder(r=(diameter-5)/2 + tolerance, h=bottleHeight);
  }
}

module knurled_cap_top(tolerance=0.4){
  diameter=18+5;
  
  difference(){
    cylinder(r=diameter/2 + tolerance, h=4);
    
    for(i=[0:8:360]){
      rotate([0,0,i])
      translate([diameter/2 + .4,0,-1])
       rotate([0,0,45])
       cube([1,1,0]*0.8 + [0,0,6]);
    }
  }
}

module bottle_cap(tolerance=0.4) {
  diameter=18+5;
  
  union() {
    difference() {    
      union(){
        translate([0,0,4])
          knurled_cap_top();
        
        metric_thread (diameter=diameter-4+tolerance*2, pitch=2, length=4, internal=false, n_starts=2);  
      }  
      
      translate([0,0,-tolerance])
        cylinder(r=(diameter-7)/2,h=6);
      
      translate([0,6,1])
      cylinder(r=1.5, h=12, $fn=12);
    }
    
    wireSize = [1,10,4];
    
    difference(){
      cylinder(r=(diameter-14)/2, h=6);

      // Wire Guide
      rotate([25,0,0])
      translate((wireSize-[0,wireSize[1],wireSize[2]])*-.5 + [0,0,-3])
        cube(wireSize);
      
      rotate([25,0,90])
      translate((wireSize-[0,wireSize[1],wireSize[2]])*-.5 + [0,0,-3])
        cube(wireSize);

      translate([-0.5,0.5,-0.1])
      cylinder(r=1, h=1, $fn=12);
    }
  }
}

bottle_body();
//bottle_cap();

// cell_18650();