/*
First off I must say that the code is very poorly optimized so it runs slow on most computers. 
You just need to press the mouse botton for it to draw, it will also give you the number C and if the julia set is connected or not. 
In the top screen it gives ou a quick preview if you want to see what happens before you generate the set.
Any other key saves the current set as a .png 
It's in black and white because I still didn't figure out a good colour pallet
*/


float xi,yi,xf,yf,c,mx,my;
int i,x,y;
PGraphics julia; 
PImage prejulia;
void setup(){
  size(800,800);
   background(255);
   julia = createGraphics(width,height);
   prejulia = createImage(width,height,RGB);
}

void draw(){
 // desenhar();
 preview();
 
  
}

void preview(){ 


   
 y = 0;
julia.beginDraw();      
julia.loadPixels();
  for (int j = 0; j < height; j++) {

    x = 0;
    for (int h = 0;  h < width; h++) {
        
int hw = width/2;
int hh = height/2;
      
      mx = map(mouseX,0,width,-2,2);
      my =-1 * map(mouseY,0,height,-1.5,1.5);
     
       xi = map(x,0,width,-2,2);
       yi = map(y,0,height,2,-2);    
  
     
    
     
   xf=xi;
   yf=yi;
   i = 0;
   
  
   while( i < 100){     
      float yy = yf * yf;
      float xx = xf * xf;
      float twoxy = 2 * xf * yf;
      
      xf = xx - yy +mx ;
      yf = twoxy + my;
      
      if(xf*xf + yf*yf > 4){
   
       break;
       
       
      }
      
     i++; 
    
      
    } 
   
    if (i<100) {
      c=i*2%255;
      
      julia.pixels[x+y*width] = color(c);
    }
   else{
     fill(255);
     julia.pixels[x+y*width] = color(255);
            
                
    }
     
      x++;
  }
   y++;
   
  
      }
julia.updatePixels();
 
julia.endDraw();
  prejulia = julia.get(0,0,height,width);
  prejulia.resize(width/4,height/4);
  image(prejulia,width-width/4,0);
  
}

void drawjulia(){ 
 loadPixels(); 

 
  
 y = 0;
  for (int j = 0; j < height; j++) {

    x = 0;
    for (int h = 0;  h < width; h++) {
int hw = width/2;
int hh = height/2;
      
      mx = map(mouseX,0,width,-2,2);
      my =-1 * map(mouseY,0,height,-1.5,1.5);
      xi = map(x,0,width,-2,2);
       yi = map(y,0,height,2,-2);    
  
     
   xf=xi;
   yf=yi;
   i = 0;
   
   
   while( i < 100){     
      float yy = yf * yf;
      float xx = xf * xf;
      float twoxy = 2 * xf * yf;
      
      xf = xx - yy +mx ;
      yf = twoxy + my;
      
      if(xf*xf + yf*yf > 4){
   
       break;
       
       
      }
      
     i++; 
    
      
    } 
   
    if (i<100) {
      c=i*2%255;
      pixels[x+y*width] = color(c);
     
    }
   else{
                pixels[x+y*width] = color(255);
    }
    
      x++;
  }
   y++;
   
  
     
       
   
      }
   updatePixels();
   color cont= get(width/2,height/2);  
   line(width/2,0,width/2,height/2-1);
   line(0,height/2,width/2-1,height/2);
   line(width/2,height/2+1,width/2,height);
   line(width/2+1,height/2,width,height/2);
   fill(255);
   if (cont==-1){
     text("Connected",400,40);
   }
   else {
    text("Disconnected",400,40);
   }
   text(mx,400,20);
   text(my,400,30);
   
  
    }
      
   
  void mousePressed(){
    drawjulia();
    
    
  }
  
  void keyPressed(){
    
   julia.save("julia.png"); 
  }
