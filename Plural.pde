class Plural {
  float x, y, s,trans;
  int id;
  //PImage pic=loadImage("pie.png");
  PImage pug;
  PImage pie;
  PImage mom;
  PImage hu;
  PImage pic[]=new PImage[6] ;
  


  Plural(int _id) {
    pic[1]=loadImage("Cooper-offical.png");
    pic[3]=loadImage("pie.png");
    pic[0]=loadImage("momal.png");
    pic[2]=loadImage("moomin2.png");
    pic[4]=loadImage("QQ.png");
    pic[5]=loadImage("bug.png");
    pug=loadImage("Cooper-offical.png");
    trans=255;

    id=_id;
    
  }
  void display(float _s,int turn) {
    s=_s;
    pushMatrix();
    //rotate(random(0,180));
    
    imageMode(CENTER);

    translate(random(width/5, 4*width/5), random(height/5, 4*height/5));
    rotate(radians(random(0, 360)));
    tint(255, 255);
    image(pic[turn], 0, 0, s/2, s/2);
    popMatrix();
  }
}