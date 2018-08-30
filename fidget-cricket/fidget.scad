module A_Wheel() {
  TEXT="http://www.jsyang.ca";

  union() {
    difference(){
      cylinder(r=40/2,h=5,$fn=32);
      translate([0,0,-1])
      cylinder(r=22.05/2,h=7,$fn=32);

      for(i=[0:len(TEXT)]){
        rotate([0,0,i*-6])
        translate([0,14,5-1.5])
        linear_extrude(height=2){
          text(TEXT[i],size=2.2,font="courier:style=bold",halign="center");
        }
      }
    }
    
    for(i=[0:4:360]){
      rotate([0,0,i])
      translate([18,0,0])
        cube([6,1,5]);
    }
  }
}

PEG_DIAM=8.05;

module B_Bracket(){
  difference(){
    hull(){
      circle(r=40/2,$fn=32);

      translate([0,-30])
      translate([16,25]*-.5)
      minkowski($fn=16){
        square([16,25]);
        circle(2);
      }        
    }
    
    circle(r=PEG_DIAM/2,$fn=24);
  }
  
}

module C_MaterialHolder(){
  difference() {
    B_Bracket();
    circle(r=50/2,$fn=36);

    // Slot for material
    translate([14,-23])
    rotate([0,0,90-12])
      square([10,0.6]);
  }
}

module D_Peg(){
  difference(){
    rotate([0,90,0])
      minkowski(){
        cylinder(r=(PEG_DIAM-0.05)/2-1,h=7.5+4, $fn=32);
            sphere(1,$fn=32);
      }

    translate([0,0,-7.5])    
    translate([500,500,0]*-.5)
      cube([500,500,4]);
  }
}

module E_Spring(){
  cube([8,0.5,6]);
}

module Z_Main(){
  
  translate([0,0,7.5+2])
  linear_extrude(height=2)
    B_Bracket();

  linear_extrude(height=2)
    B_Bracket();

  translate([0,0,2])
  linear_extrude(height=7.5)
    C_MaterialHolder();
  
}


Z_Main();

%
translate([0,0,7.5+4])
rotate([0,90,0])
  D_Peg();

translate([0,0,3.25])
  A_Wheel();

