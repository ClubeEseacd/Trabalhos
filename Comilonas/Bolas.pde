class Bolas{
   PVector posicao,velocidade;
   float b,tamanho;
   int tempo1;
   Bolas(float x,float y,float t){
       posicao = new PVector(x,y);  
       velocidade = new PVector(random(-2,2),random(-2,2));
       tamanho = t;
       tempo1= minute();
       }
    void mover(){    
        velocidade.limit(2);
        posicao.add(velocidade);
  
     }
   void desenhar(){
         fill(255); 
         stroke(0);
         ellipseMode(RADIUS);
         ellipse(posicao.x,posicao.y,tamanho,tamanho);         
      }  
       void pontas(){
   
   
   
   if (posicao.y < tamanho){
   
    velocidade.set(velocidade.x,velocidade.y*-1);
      
   }
   if (posicao.x > width-tamanho){     
     velocidade.set(velocidade.x*-1,velocidade.y);
       
   }
   if (posicao.y > width-tamanho){
     velocidade.set(velocidade.x,velocidade.y*-1);
       
   }
   if (posicao.x < tamanho){
     velocidade.set(velocidade.x*-1,velocidade.y);
       
}
   
   if (posicao.y < 0){
   
    posicao.y=0;
      
   }
   if (posicao.x > width){     
     posicao.x=width;
       
   }
   if (posicao.y > width){
     posicao.y=width;
       
   }
   
   if (posicao.x < 0){
      posicao.x=0;
       
}
   
   
  } 
  void comer(int i,int j,Bolas c){ 
        float tamanho2;
        int numerob, numeroc;
        numerob = i;
        numeroc = j;
        tamanho2 = sqrt((sq(tamanho)+sq(c.tamanho())));       
      
        
       
        b= posicao.dist(c.posicao()); 
        if(b<tamanho && tamanho>c.tamanho()){  
          
          bola.remove(numeroc);
          print("adeus ", numeroc);
          tamanho=tamanho2;
        }
       
      }
  PVector posicao(){   
  return posicao;    
     }     
  float tamanho(){
 return tamanho;
  }  
  
void separacao(int i){
    float teste,posicaox,posicaoy;
    int  tempo2;
    tempo2 =minute();
    float tamanho3,tamanho2,tamanho1;
    int numero = i;
    posicaox=posicao.x;
    posicaoy=posicao.y;
     if (tempo2 != tempo1){
     tempo1= tempo2;
  teste= random(0,1);
   if (teste<=0.5){
     
     tamanho1=sq(tamanho);
     tamanho2=tamanho1/2;
     tamanho3=sqrt(tamanho2);
     bola.remove(i);
     print("adeus");
     
     bola.add(new Bolas(posicaox, posicaoy,tamanho3));
     bola.add(new Bolas(posicaox, posicaoy,tamanho3));
     
     
     
   }
     }
   }  
  
  
}

