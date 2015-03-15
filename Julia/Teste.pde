 class Julio{
float cx, cy,size;
float xmax,ymax,xmin,ymin;
  Julio (float x, float y,float mox,float moy, float sz){
   size=sz ;
   cx= map(x,0,width,-2,2);
   cy= map(y,0,width,2,-2);
     mx = map(mox,0,width,-2,2);
      my = map(moy,0,height,1.5,-1.5);
      
  }
  
   void preview(){ 
  
 y = 0;
djulia.beginDraw();      
djulia.loadPixels();
  for (int j = 0; j < height; j++) {

    x = 0;
    for (int h = 0;  h < width; h++) {
        
int hw = width/2;
int hh = height/2;
      
      xi= map(x,0,width,-2,2);
   yi= map(y,0,width,2,-2);
     
          
  
     
    
     
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
      c=i*3;
      
      djulia.pixels[x+y*width] = color(c);
    }
   else{
     fill(255);
     djulia.pixels[x+y*width] = color(255);
            
                
    }
     
      x++;
  }
   y++;
   
  
      }
djulia.updatePixels();
 
djulia.endDraw();
  prejulia = djulia.get(0,0,height,width);
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
      
    xmax = cx +size;
    xmin = cx -size;
    ymax = cy +size;
    ymin = cy -size;
    
   xi= map(x,0,width,xmin,xmax);
   yi= map(y,0,width,ymax,ymin);
     
     
   xf=xi;
   yf=yi;
   i = 0;
   
   
   while( i < 100){     
      float yy = yf * yf;
      float xx = xf * xf;
      float twoxy = 2 * xf * yf;
      
      xf = xx - yy +mx ;
      yf = twoxy + my;
      
      if(xf*xf + yf*yf > 3.5){
   
       break;
       
       
      }
      
     i++; 
    
      
    } 
   
    if (i<100) {
      c=i*2;
      pixels[x+y*width] = color(c);
     
    }
   else{
                pixels[x+y*width] = color(200);
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
  
   if (cont==-3618616 ){
     text("Connected",400,40);
   }
   else {
    text("Disconnected",400,40);
   }
   text(mx,400,20);
   text(my,400,30);
   
  
    }
    
 void save(){
  
  djulia.save("Julia.png");
}  

 float bound(){
  
  return size;
 } 
 
 PVector  mouse(){
   float tempmx =map(mx,2,-2,width,0);
   float tempmy =map(my,1.5,-1.5,0,height);
   PVector mouse = new PVector (tempmx,tempmy);
 
   return mouse;
 }
} 


