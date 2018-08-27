GLOBAL_SCALE=[6,6,1];

module A_Character(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    text(c, font="经典繁方篆", valign="center", halign="center");
  }
}

module B_CharacterCutOut(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    minkowski() {
      text(c, font="经典繁方篆", valign="center", halign="center");
      circle(0.05,$fn=32);
    }
  }  
}

module C_CharacterOutline(c,h,SCALE=GLOBAL_SCALE) {
  scale(SCALE)
  linear_extrude(height=h){
    minkowski() {
      text(c, font="经典繁方篆", valign="center", halign="center");
      circle(1,$fn=32);
    }
  }  
}

// 思成 思为
  
module Z_CharacterSet(c,isOutline=0) {  
  if(isOutline==1) {      
    difference() {
      C_CharacterOutline(c,2);
      translate([0,0,0.32*2])
        B_CharacterCutOut(c,5);
    }
  } else {
    A_Character(c,3);    
  }
}

// 睡 - bedroom
// 洗 - bathroom
// 思 - study
// 吃 - kitchen
// 是 - living room

Z_CharacterSet("印",1);