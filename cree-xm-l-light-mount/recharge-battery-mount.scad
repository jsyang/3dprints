PACKSIZE=[75.6,68,16];
  
module A_RechargeBatteryPack() {
  translate(PACKSIZE*-0.5)
    cube(PACKSIZE);
}

module Z_Main() {
  SIZE=(
    PACKSIZE +
    [1,0,1]*2.5*2 - // 2.5mm offset from the XZ plane
    [0,PACKSIZE[1]-10,0] // set Y (thickness)
  );
  
  difference(){ 
    translate(SIZE*-.5)
      cube(SIZE);
    
    A_RechargeBatteryPack();
  }
}

Z_Main();