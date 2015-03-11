float xi,yi,xf,yf,c,mx,my;
int i,x,y;


void setup(){
  size(600,600);
   background(255);
   
}

void draw(){
  
  desenhar();
  
}

void desenhar(){ 
 loadPixels();
 y = 0;
  for (int j = 0; j < height; j++) {

    x = 0;
    for (int h = 0;  h < width; h++) {

      int hw = width/2;
      int hh = height/2;
      mx = map(mouseX,0,width,-2,2);
      my = map(mouseY,0,height,-1.5,1.5);
     if (x < hw && y < hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,0,hh,2,0);    
     }
     
    if (x > hw && y<hh){
       xi = map(x,hw,width,0,2);
       yi = map(y,0,hh,2,0);   
     }
    if (x<hw && y>hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,hh,height,0,-2);       
     }
     
    if (x>hw && y>hh){
       xi = map(x,hw,width,0,2);
       yi = map(y,hh,height,0,-2);             
     }
     if (x<hw && y==hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,hh,height,0,-2);         
     }
     if (x==hw && y>hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,hh,height,0,-2);       
     }
     if (x>hw && y==hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,hh,height,0,-2);       
     }
     if (x==hw && y<hh){
       xi = map(x,0,hw,-2,0);
       yi = map(y,hh,height,0,-2);       
     }
     
   xf=xi;
   yf=yi;
   i = 0;
   while( i < 100){     
      float yy = yf * yf;
      float xx = xf * xf;
      float twoxy = 2.0 * xf * yf;
      
      xf = xx - yy +mx ;
      yf = twoxy + my;
      
      if(xf*xf + yf*yf > 4){
   
       break;
       
       
      }
      
     i++; 
    
      
    } 
    if (i<100) {
      c=map(i,0,20,0,255);
      pixels[x+y*width] = color(c);
     
    }
   else{
                pixels[x+y*width] = color(255);
    }
    
      x++;
  }
   y++;
   
   updatePixels();
   line(width/2,0,width/2,height);
   line(0,height/2,width,height/2);
    }
      
   
}   

