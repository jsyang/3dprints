shouldPrintBlue=false;

module A_Print(custom_spacing=0.83,letter="V",isBold=true,SIZE=16.5,THRESHOLD=1.2) {
  FONT_NAME=str("Fantasque Sans Mono:style=Bold");
  
  if(isBold) {
    minkowski($fn=12) {
      text(text=letter,size=SIZE, font=FONT_NAME,spacing=custom_spacing,halign="center");
      circle(THRESHOLD);
    }
  } else {
    text(text=letter,size=SIZE, font=FONT_NAME,spacing=custom_spacing,halign="center");
  }
}


module A_CutoutPrint(threshold=1.2) {
    A_Print(letter="Delyth",isBold=false,THRESHOLD=threshold);
    translate([0,-16,0])
      A_Print(letter="Edwards",isBold=false,THRESHOLD=threshold);  
}

module B_BluePrint(threshold=1.2) {
    A_Print(letter="Delyth",THRESHOLD=threshold);
    translate([0,-16,0])
      A_Print(letter="Edwards",THRESHOLD=threshold);  
}

difference() {
linear_extrude(height=5)
  B_BluePrint();

translate([0,0,2.5])
linear_extrude(height=8)
  A_CutoutPrint();
}