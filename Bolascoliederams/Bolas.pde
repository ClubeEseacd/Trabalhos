
class Bolas{
  PVector posicao,distancia,aceleracao,velocidade,centro,direcao,forca,forcam;
  float numero,vel,acel,d,forcac,b;
       Bolas(int x,int y){
       posicao = new PVector(x,y);  
       velocidade = new PVector(0,0);
       forca = new PVector(0,0);
       }
  

       void desenhar(){
         fill(255); 
         stroke(0);
         ellipse(posicao.x,posicao.y,10,10);
         
         
      }


      void repulsao(Bolas c){ 
        float mag;
        b= posicao.dist(c.posicao()); 
        if(b<10){
          PVector dir = PVector.sub(posicao,c.posicao());
          mag = velocidade.mag();
          dir.mult(mag*0.01);
          velocidade.add(dir);
          
        }
       if(b<5){
          PVector dir = PVector.sub(posicao,c.posicao());
          mag = velocidade.mag();
          dir.mult(mag*0.1);
          velocidade.add(dir);
          
       } 
      }
 
 
     PVector posicao(){   
  return posicao;    
     }
 
 
     void mover(){  
        aceleracao = forca.get(); 
        aceleracao.limit(1);
        velocidade.add(aceleracao);
        velocidade.limit(2);
        posicao.add(velocidade);
  
     }
 
     void atracaomag(String tipo){
      String modo=tipo; 
      
      if (tipo=="repulsao"){
      direcao = new PVector(posicao.x-400,posicao.y-400);
      direcao.normalize();
      centro = new PVector(400,400);
      d = PVector.dist(posicao,centro);
      forca= direcao.get();
      forca.div(d);
       if ( d>395){
        direcao.mult(-0.01); 
        forca= direcao.get(); 
       } 
      }
       if (tipo=="atracao"){
      direcao = new PVector(posicao.x-400,posicao.y-400);
      direcao.normalize();
      centro = new PVector(400,400);
      d = PVector.dist(posicao,centro);
      forca= direcao.get();
      forca.div(d);
      forca.mult(-1);
       if ( d<20){
        direcao.mult(1); 
        forca= direcao.get(); 
       }  
        
        
       }
     }
 
 
void informacao(){
  
  String tposx = nfc(posicao.x,1);
  String tacelx = nf(aceleracao.x,0,4);
  String tvelx = nf(velocidade.x,1,2);
  String tposy =  nfc(posicao.y,1);
  String tacely = nf(aceleracao.y,0,4);
  String tvely =nf(velocidade.y,1,2);
  
  
  String tpos = tposx+" "+tposy;
  String tvel = tvelx+" "+tvely;
  String tacel = tacelx+" "+tacely;
  
     if (mouseX < posicao.x+7.5 && mouseX > posicao.x-7.5 && mouseY < posicao.y+7.5 && mouseY >posicao.y-7.5){
       
       
  fill(0); 
  text(tpos,mouseX+10,mouseY);     
  text(tvel,mouseX+10,mouseY+10);     
  text(tacel,mouseX+10,mouseY+20);
     }


}  
 
 

   
   
   
 
 
 void remover(int i){
   int numero = i;
   if (posicao.x < 5){
     velocidade.set(velocidade.x*-0.8,velocidade.y);
       if (posicao.x < 0){
       velocidade.set(1,velocidade.y);
   }  
}
   
   if (posicao.y < 5){
    // bola.remove(numero);
    velocidade.set(velocidade.x,velocidade.y*-0.8);
      if (posicao.y < 4)
      velocidade.set(velocidade.x,1);
   }
   if (posicao.x > width-5){     
     velocidade.set(velocidade.x*-0.8,velocidade.y);
       if (posicao.x > width-4)
       velocidade.set(-1,velocidade.y);
   }
   if (posicao.y > width-5){
     velocidade.set(velocidade.x,velocidade.y*-0.8);
       if (posicao.y > width-4)
       velocidade.set(velocidade.x,1);
   }
  } 
}
