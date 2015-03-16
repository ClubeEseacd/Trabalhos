
/*
First off I must say that the code is very poorly optimized so it runs slow on most computers. 
You just need to press the mouse botton for it to draw, it will also give you the number C and if the julia set is connected or not. 
In the top screen it gives ou a quick preview if you want to see what happens before you generate the set.
Any other key saves the current set as a .png 
It's in black and white because I still didn't figure out a good colour pallet
*/
Julio julia =  new Julio(0,0,mouseX,mouseY,2);

float newsize;
float xi,yi,xf,yf,c,mx,my;
int i,x,y;
  PGraphics djulia; 
 PImage prejulia;
 PVector mouse ;
void setup(){
  size(800,800);
   background(255);
   
  djulia = createGraphics(width,height);
   prejulia = createImage(width,height,RGB);
}

void draw(){
 // desenhar();

   Julio julia =  new Julio(width/2,height/2,mouseX,mouseY,2);
  
julia.preview();
 
  
}



  void mousePressed(){
    julia.cleari();
   Julio julia =  new Julio(width/2,height/2,mouseX,mouseY,2);
   
   
   julia.drawjulia();
   line(width/2,0,width/2,height/2-1);
   line(0,height/2,width/2-1,height/2);
   line(width/2,height/2+1,width/2,height);
   line(width/2+1,height/2,width,height/2);
    newsize = julia.bound();
    mouse = julia.mmouse();
  }
  
  void keyPressed(){
    
    
    
  newsize=newsize/2;

  Julio julia = new Julio(mouseX,mouseY,mouse.x,mouse.y,newsize);
  julia.drawjulia();
  }
 
