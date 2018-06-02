import netP5.*;
import oscP5.*;
OscP5 oscP5;
int turn=4;
int uturn=0;

float speed = 20;
int movingSpeed = 10;

int count=0;
int count1=0;
int count2=0;
int back;
int back1;

boolean a = false;
boolean d = false;
boolean w = false;
boolean s = false;

boolean chiaoState=false;
boolean oscarState=false;
boolean momState=false;
boolean leoState=false;

float amplitude=0;
float ampScaled;
float scale=6;
float smoothFactor=0.1;
float sum;

int imgNum=3;
Plural imgs[]=new Plural[imgNum];

Chiao ch;

Star[] stars = new Star[600];

void setup() {
  size(1920, 1080);
  //size(1200,800);
  //fullScreen();
  oscP5=new OscP5(this, 12000);

  for (int i=0; i<imgNum; i++) {
    imgs[i]=new Plural(i);
  }

  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  ch=new Chiao();
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  //background(0);
  count2+=1%4;
  if (turn==0) {

    fill(ampScaled/5, ampScaled/5, 0, 125);
  } else if (turn==1) {

    fill(0, ampScaled/5, ampScaled/10, 125);
  } else if (turn==2) {

    fill(0, ampScaled/12, ampScaled/5, 125);
  } else if (turn==3) {

    fill(ampScaled/5, ampScaled/12, ampScaled/12, 125);
  } else if (turn==5) {

    fill(0, ampScaled/12, 0, 125);
  } else {
    fill(0, 0, 0, 125);
  }

  rectMode(CENTER);
  rect(width/2, height/2, width*2, height*2);

  count=(count+1)%((width-200)*2);
  back=100+abs(count-width);
  count1=(count1+2)%((height-200)*2);
  back1=100+abs(count1-height);

  sum+=(amplitude-sum)*smoothFactor;
  ampScaled=sum*(height/2)*scale;
  for (int i=0; i<stars.length; i++) {
    stars[i].move();
    stars[i].show();
    if (a) {
      stars[i].movingLeft();
    }
    if (d) {
      stars[i].movingRight();
    }
    if (w) {
      stars[i].movingUp();
    }
    if (s) {
      stars[i].movingDown();
    }
  }


  popMatrix();

  for (int i=0; i<imgNum; i++) {
    imgs[i].display(ampScaled, turn);
  }

  if (momState||chiaoState||leoState||oscarState) {
    ch.display(uturn, back, back1, 200+ampScaled/3);
  }
}

void oscEvent(OscMessage theOscMessage) {


  if (theOscMessage.checkAddrPattern("/amp")) {
    float value=theOscMessage.get(0).floatValue();
    if (value>0.1) {
      amplitude=value;
    } else {
      amplitude=0.0;
    }
  }
  if (theOscMessage.checkAddrPattern("/speed")) {
    float value1=theOscMessage.get(0).floatValue();
    println(value1);
    speed=value1*10;
  }

  if (theOscMessage.checkAddrPattern("/turn")) {
    int turnValue=theOscMessage.get(0).intValue();
    if (turnValue==74) {
      turn=0;
    } else if (turnValue==75) {
      turn=1;
    } else if (turnValue==76) {
      turn=2;
    } else if (turnValue==89) {
      turn=3;
    } else if (turnValue==73) {
      turn=4;
    } else if (turnValue==90) {
      turn=5;
    } else if (turnValue==92) {
      uturn=4;
      momState=false;
      leoState=false;
      chiaoState=false;
      oscarState=false;
    }
  }

  if (theOscMessage.checkAddrPattern("/mom")) {
    int momValue=theOscMessage.get(0).intValue();
    if (momValue==11) {
      println("mom!!!!!!!");
      momState=true;
      uturn=1;
    } else {
      momState=false;
    }
  }

  if (theOscMessage.checkAddrPattern("/leo")) {
    int leoValue=theOscMessage.get(0).intValue();
    if (leoValue==6) {
      leoState=true;
      println("leo!!!!");
      uturn=2;
    } else {
      leoState=false;
    }
  }

  if (theOscMessage.checkAddrPattern("/chiao")) {
    int chiaoValue=theOscMessage.get(0).intValue();
    if (chiaoValue==5) {
      println("chiao!!!!!!!!!");
      chiaoState=true;
      uturn=0;
    } else {
      chiaoState=false;
    }
  }


  if (theOscMessage.checkAddrPattern("/oscar")) {
    int oscarValue=theOscMessage.get(0).intValue();
    if (oscarValue==13) {
      println("oscar!!!!!!!");
      oscarState=true;
      uturn=3;
    } else {
      oscarState=false;
    }
  }
}

void keyPressed() {

  if (key == 'a') {
    a = true;
  }
  if (key == 'd') {
    d = true;
  }
  if (key == 'w') {
    w = true;
  }
  if (key == 's') {
    s = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    a = false;
  }
  if (key == 'd') {
    d = false;
  }
  if (key == 'w') {
    w = false;
  }
  if (key == 's') {
    s = false;
  }
}