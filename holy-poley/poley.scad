include <../threads.scad>;

module _PlaneCut(dist=10) {
  SIZE=1000;
  HORIZON=[1,1,1]*SIZE;
  
  difference() {
    children();
    
    // top plane
    translate([0,0,1]*0.5*(SIZE+dist))
      cube(HORIZON,center=true);
    
    // bottom plane
    translate([0,0,1]*-0.5*(SIZE+dist))
      cube(HORIZON,center=true);
  }
}

module A_FemaleEnd(r=10,length=30) {
  difference(){
    hull(){
      sphere(r);
      translate([1,0,0]*(length-10))
        sphere(r);
    }
    
    rotate([0,90,0])
      metric_thread(diameter=12, thread_size=3, pitch=5, internal=true, length=length);
  }
}

module B_MaleEnd(r=10,length=30) {
  union(){
    hull(){
      sphere(r);
      translate([-1,0,0]*(length-10))
        sphere(r);
    }
    
    rotate([0,90,0])
      metric_thread(diameter=12, thread_size=3, pitch=5, internal=false, length=length);
  }
}


_PlaneCut(6) {
  A_FemaleEnd();  
  translate([0,50,0])
    B_MaleEnd();
}