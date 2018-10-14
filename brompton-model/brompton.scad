module A_Pipe(r1,r2,p1,p2,fn=16) {
  $fn=fn;
  
  hull(){
    translate(p1)
      sphere(r1);
    translate(p2)
      sphere(r2);
  }
}

module B_MainFrame() {
  A_Pipe(6,6,[0,0,0],[2,6,0]);
}

module W_Wheel() {
  circle(102.02541);
}

module Z_Main() {
  B_MainFrame();
}

Z_Main();