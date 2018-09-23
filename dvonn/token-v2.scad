module C_Top(height) {
  $fn=64;
  translate([0,1,0]*11.3)
  translate([3,height/2,0])
  circle(9);
}

module B_Bottom() {
  $fn=64;
  translate([0,1,0]*11.4)
  translate([3,3.5,0])
  circle(16);
}

module A_CrossSection(height=3.5){
  $fn=32;

  translate([10,0,0])
  difference() {
    intersection()
    {
      B_Bottom();
      
      hull() {
        circle(1);

        translate([6,0,0])
          circle(1);
          
        translate([6,height,0])
          circle(1);
       
        translate([0,height,0])
          circle(1);
      }
    }

    C_Top(height);
  }
}

module D_Token(){
  rotate_extrude(convexity=30, $fn=128)
    A_CrossSection();
}

module E_TokenTower(count=5) {
  for(i=[1:count]) {
    translate([0,0,(2.5+3.5)*i])
      D_Token();
  }
}

module Z_Main(){
    E_TokenTower();
}

Z_Main();

//    A_CrossSection();