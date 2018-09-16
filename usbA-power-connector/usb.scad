module A_Channel(p1,p2){
  hull() {
    translate(p1)
      circle(r=1.6/2,$fn=16);
    
    translate(p2)
      circle(r=1.6/2,$fn=16);
  }
}

module B_WireChannel() {
  union(){
    A_Channel(
      [-4,6],
      [-4,10]
    );
    
    A_Channel(
      [-4,10],
      [-1.5,8]
    );
    
    A_Channel(
      [-1.5,8],
      [-1.5,15]
    );
  }
}

module C_Hollow(){
  PLUG_SIZE=[1,1]*12.05;
  TO_ORIGIN = PLUG_SIZE*-.5;
  
  union() {
    translate(TO_ORIGIN)
      square(PLUG_SIZE);

    B_WireChannel();
    mirror([1,0,0])
      B_WireChannel();    
  }
}

// Ensure front and rear are open for USB-A and wires out, resp.
module D_HollowThrough() {
  translate([0,-1])
  scale([1,1.25,1])
    C_Hollow();
}


module E_FullBottom() {
  minkowski($fn=16){
    hull() C_Hollow();
    circle(2.5);
  }
}

// Leveled part
module F_HollowThroughShell() {
  intersection(){
    E_FullBottom();
    
    minkowski($fn=16) {
      D_HollowThrough();
      circle(1);
    }
  }
}

module G_PlugBottom() {
  difference() {
    union() {
      linear_extrude(height=5) 
        E_FullBottom();
      
      translate([0,0,5])
      linear_extrude(height=2.5)
        F_HollowThroughShell();
    }

    translate([0,0,2.5])
    linear_extrude(height=6)    
      D_HollowThrough();
  }
}

module H_PlugTop() {
  union() {
    difference() {
      linear_extrude(height=5) 
        E_FullBottom();
      
      translate([0,0,2.5])
      linear_extrude(height=5)
        F_HollowThroughShell();
    }
    
    // Retaining wall for metal plug notch
    WALL_SIZE=[16,4,2.5+0.32];

    translate([0,-6.5,WALL_SIZE[2]/2])    
    translate(WALL_SIZE*-.5)
      cube(WALL_SIZE);
  }
}

G_PlugBottom();

translate([30,0,0])
  H_PlugTop();