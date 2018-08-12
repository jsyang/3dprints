shouldPrintBlue=false;

module A_Print(custom_spacing=0.83,letter="V",isBold=true,SIZE=12.5,THRESHOLD=1.2) {
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

module B_BluePrint(threshold=1.2) {
  union() {
    translate([-0.5,0,0])
    A_Print(letter="Verona",THRESHOLD=threshold);  
    translate([0,-12,0])
      A_Print(letter="2018",THRESHOLD=threshold);
  }
}

module C_WhitePrint(_isBold=false,threshold=1.2) {
  union() {
    translate([-0.5,0,0])
    A_Print(letter="Verona",isBold=_isBold,THRESHOLD=threshold);
    translate([0,-12,0])
      A_Print(letter="2018",isBold=_isBold,THRESHOLD=threshold);
  }
}  

module D_TicketHolder(){ 
  BACK_SIZE=[45,25];
  HOLDERHOLE_SIZE=[44.6,10,2.5];
  
  difference() {
    
    linear_extrude(height=5)
    translate(-.5*BACK_SIZE)
    minkowski($fn=32){
      square(BACK_SIZE);
      circle(2);
    }

    translate([0,-10,2])
    translate(-.5*HOLDERHOLE_SIZE)    
    cube(HOLDERHOLE_SIZE);
    
    translate([-10,0,0.75])
      cylinder(r=2.6,h=7,$fn=32);
    
    translate([10,0,0.75])
      cylinder(r=2.6,h=7,$fn=32);
  }
}

if(shouldPrintBlue) {
  difference() {
    linear_extrude(height=2)
      B_BluePrint();

    translate([0,0,1])
    linear_extrude(height=1.5)
      C_WhitePrint(_isBold=true,threshold=0.3);
  }
} else {
     
  difference() {
    D_TicketHolder();
    translate([0,0,4.5])
    linear_extrude(height=1.5)
      B_BluePrint(threshold=1.3);
  }

  translate([0,-35,0])
  linear_extrude(height=1.5)
    C_WhitePrint();
  
}