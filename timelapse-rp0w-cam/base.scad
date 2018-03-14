module fillet(size=3) {
  difference(){
    square([size,size]);
    
    translate([size,size,0])
    circle(size, $fn=24);
  }  
}

module prong(){
  union() {
    // Head
    translate([0.5,-0.5,0])
    hull($fn = 16){
      translate([3,6])
      circle(0.5);
      
      translate([0.5,7.5])
      circle(1);
      
      translate([-0.5,5.25])
      square([3,1]);
    }
    
    // Prong
    square([3,6]);  

    // Right fillet
    translate([3,0])    
    fillet(2);
    
    // Left fillet
    mirror([1,0,0])
    fillet(2);
  }
}

module layer(nutLongEdge=12.5, height=3, isEndLayer=true) {
  plateWidth = 60;
  plateHeight = 16;

  linear_extrude(height)
  union(){
    difference() {
      square([plateWidth,plateHeight]);    

      // M3 bolt hole 1
      translate([(plateWidth - 30)/2, plateHeight/2])
      circle(1.6,$fn=16);
      
      // M3 bolt hole 2
      translate([(plateWidth + 30)/2, plateHeight/2])
      circle(1.6,$fn=16);
      
      if(isEndLayer) {
        // 1/4" tripod bolt hole
        translate([plateWidth/2,plateHeight/2])
        circle(3.5,$fn=16);
        
      } else {          
        // Slot for 1/4" tripod nut
        translate([(plateWidth-nutLongEdge)/2, 2.5])
        square([nutLongEdge,11]);
      }
    }
   
    if(false && isEndLayer) {
      translate([(plateWidth + 27)/2, plateHeight])
      prong(); 
      
      translate([(plateWidth - 27)/2, plateHeight])
      mirror([1,0,0])
      prong();
    }
  }
}

layer(height=1.2);
//layer(height=8, isEndLayer = false);