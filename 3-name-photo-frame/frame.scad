GLOBAL_SCALE=[6,4.5,1];
GLOBAL_FONT="Fantasque Sans Mono:style=Bold";
GLOBAL_SPACING=0.9;

module A_Character(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    text(c, font=GLOBAL_FONT, valign="center", halign="center",spacing=GLOBAL_SPACING);
  }
}

module B_CharacterCutOut(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    minkowski() {
      text(c, font=GLOBAL_FONT, valign="center", halign="center",spacing=GLOBAL_SPACING);
      circle(0.05,$fn=32);
    }
  }  
}

module C_CharacterOutline(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    minkowski() {
      text(c, font=GLOBAL_FONT, valign="center", halign="center",spacing=GLOBAL_SPACING);
      circle(1,$fn=32);
    }
  }  
}

  
module Z_CharacterSet(c,isOutline=0) {  
  if(isOutline==1) {      
    difference() {
      C_CharacterOutline(c,4);
      translate([0,0,0.32*2])
        B_CharacterCutOut(c,5);
    }
  } else {
    A_Character(c,3);    
  }
}

difference() {
  scale([0.8,0.8,1])
  union(){
    translate([25,64,0])
    rotate([0,0,-45])
      Z_CharacterSet("EMILY",1);
    
    rotate([0,0,90])
    translate([50,80,0])
      Z_CharacterSet("SAM",1);
    
    translate([0,-26,0])
      Z_CharacterSet("MAX",1);
    
    linear_extrude(height=2) {    
      polygon(
        [
          [-60,115],
          [62,-3],       
          [-60,-3]
        ]
      );
    }
  }
  
  // Neodymium magnet holes
  
  translate([-40,76,0.32])
    cylinder(r=2.6,h=7,$fn=32);
  
  translate([-40,4,0.32])
    cylinder(r=2.6,h=7,$fn=32);

  translate([32,4,0.32])
    cylinder(r=2.6,h=7,$fn=32);
}