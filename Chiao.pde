class Chiao {
  int x=10;
  int y=10;
  int id;
  PImage ppic[]=new PImage[5] ;
  PImage pic;

  Chiao() {
    //id=_id;
    
    pic=loadImage("pug.png");
    ppic[0]=loadImage("ume.png");
    ppic[1]=loadImage("momm.png");
    //ppic[2]=loadImage("myboan.png");
    ppic[2]=loadImage("leo.png");
    ppic[3]=loadImage("oscar.png");
    ppic[4]=loadImage("QQ.png");
  }
  void display(int turn,int _x,int _y,float _s) {
    
    pushMatrix();
    //rotate(random(0,180));
 
    imageMode(CENTER);
    rotate(radians(random(0,360)));
    //translate(width/2,height/2);
    tint(255, 255);
    image(ppic[turn], _x, _y, _s, _s);
    popMatrix();
  }
}