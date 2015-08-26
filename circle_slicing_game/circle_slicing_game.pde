int dia=30;
float gravity = 20;
MyCircle circle;
int framerate = 60;
float timer;
int score = 0;

class MyCircle {
 int dia=50;
 float x=100;
 float y=1;
 boolean isLive = true;

MyCircle(int x,int y,int dia){
this.x=x;
this.y=y;
this.dia=dia;
}

  void draw(){
      this.y=getDroppingYperframe(this.y);
      ellipse(this.x,this.y, this.dia, this.dia);
  }
  
  void destroy(){    
    circle = null;
    background(255);
  }
}

void setup() {
  gravity = 20;
  frameRate(framerate);
  size(640, 480);
 timer = 1;
 circle = new MyCircle(100,100,40);

}

void mouseDragged(){
  strokeWeight(3);
line(pmouseX,pmouseY,mouseX,mouseY);
if(circle != null)
if(mouseX < circle.x + circle.dia && mouseX > circle.x - circle.dia && mouseY < circle.y + circle.dia && mouseY > circle.y - circle.dia){
     circle.destroy();
    }
}



float getDroppingYperframe(float y){
  //h= 1/2 * gt^2
  y = 0.95*y + 0.5 * gravity *(timer/60)*(timer/60);
  return y;
}

void draw() {
  background(255);
  fill(50);
  textSize(20);
  if(millis() < 5000){
    text("Slicing the circle by dragging the mouse.\nCan you score 30000?",100,100);
  }
  if(millis() > 2000 && millis() < 5000){
     text("Ready? " + (5 - (int) (millis()/1000)) , (width/2) -50 ,height/2);
  }
if(millis() > 5000) {
    background(255);

  text("Score: " + score +"/30000", 30,30);


     if(circle != null){
       circle.draw();
       if(circle.y-dia >= height){
        circle.destroy();
        
        int restartTime = millis() + 200;
       
        score = 0;
      
        while (millis() <= restartTime){
        

        }
        setup();
        
       }
     }
     else{
       print("creating new circle");
       score+=1000;
       timer = 1/framerate;
       circle = new MyCircle((int)random(dia, width-dia), (int)random(50,300), dia);       
     }
     //print(mouseX);
     //print(mouseY);
    timer += 1;
    println(timer);
    
        if(score >= 5000 && score < 10000) {
         textSize(12);
         text("Welldone! it's gonna be harder now, gravity increase to 4x!!!!!!",20,60);
          gravity = 40;
      }
      
      if(score >= 10000 && score < 15000) {
         textSize(12);
         text("Welldone! it's gonna be harder now, gravity increase to 6x!!!!!!",20,60);
          gravity = 60;
      }
      
       if(score >= 15000 && score < 20000) {
         textSize(12);
         text("Welldone! it's gonna be harder now, gravity increase to 8x!!!!!!",20,60);
          gravity = 80;
      }
      
       if(score >= 20000 && score < 30000) {
         textSize(12);
         text("Welldone! it's gonna be harder now, gravity increase to 10x!!!!!!",20,60);
          gravity = 100;
      }
      
      if(score == 30000){
          background(255);
       textSize(30);
         text("Score: " + score +"/30000", 30,30);

       text("Welldone! You've won the game!",30,100);
        noLoop();
      }
      
      
  //}
}
}