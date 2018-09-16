module A_Wheel() {
  TEXT="http://www.jsyang.ca";

  union() {
    difference(){
      cylinder(r=40/2,h=5,$fn=32);
      translate([0,0,-1])
      cylinder(r=22.15/2,h=7,$fn=32);

      for(i=[0:len(TEXT)]){
        rotate([0,0,i*-12])
        translate([0,14,5-1.5])
        linear_extrude(height=2){
          text(TEXT[i],size=4.2,font="fantasque sans mono:style=bold",halign="center");
        }
      }
    }
    
    for(i=[0:4.5:360]){
      rotate([0,0,i])
      translate([18,0,0])
        cube([6,1,5]);
    }
  }
}

PEG_DIAM=8;

// using an ABEC-11 608RS bearing
// manufacturer: Slime Precision

module B_Bracket(){
  difference(){
    hull(){
      circle(r=40/2,$fn=32);

      translate([-10,-40])
      translate([16,25]*-.5)
      minkowski($fn=16){
        square([18,25]);
        circle(2);
      }        
    }
    
    circle(r=PEG_DIAM/2,$fn=24);
  }
  
}

module C_MaterialHolder(){
  difference() {
    hull(){
      B_Bracket();
      
      translate([10,-25])
        square([10,10]);
    }
    

    translate([0,-20])
      square([40,20]);
    
    circle(r=50/2,$fn=36);

    // Slot for material
    translate([18,-23])
    rotate([0,0,90])
      square([10,1]);
  }
}

module D_Peg(){
  difference(){
    rotate([0,90,0])
      minkowski(){
        cylinder(r=(PEG_DIAM-0.08)/2-1,h=7.5+4-2, $fn=32);
            sphere(1,$fn=32);
      }

    translate([0,0,-7.5])    
    translate([500,500,0]*-.5)
      cube([500,500,4]);
  }
}

module E_Spring(){
  cube([8,0.8,6]);
}

module Z_Main(){
  
  union() {  
    translate([0,0,7.5+2])
    linear_extrude(height=2)
      B_Bracket();

    linear_extrude(height=2)
      B_Bracket();

    linear_extrude(height=7.5+4)
      C_MaterialHolder();
  }
}


rotate([90,0,0])
E_Spring();
//Z_Main();

/*

%
translate([0,0,7.5+4])
rotate([0,90,0])
  D_Peg();

translate([0,0,3.25])
  A_Wheel();

*/
