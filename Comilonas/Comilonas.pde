ArrayList<Bolas> bola;
int numero;











void setup(){
size(800,800);

bola = new ArrayList<Bolas>();

  
}


void draw(){
  background(255);

  for (Bolas bolas : bola) {
     bolas.mover();
     bolas.desenhar(); 
    bolas.pontas(); 
     }
  numero=bola.size();
  fill(0);
  text(numero,400,10);
  
  for (int i = bola.size()-1; i >= 0; i--) {
       Bolas b = bola.get(i);  
      b.separacao(i);
            for (int j = bola.size()-1; j >= 0; j--) {
                if ( j != i){
                  Bolas c = bola.get(j);
                  b.repulsao(i,j,c);      
                }
            }
     }  
}

class Bolas{
   PVector posicao,velocidade;
   float b,tamanho;
   Bolas(float x,float y,float t){
       posicao = new PVector(x,y);  
       velocidade = new PVector(random(-2,2),random(-2,2));
       tamanho = t;
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
   
   if (posicao.x < tamanho){
     velocidade.set(velocidade.x*-1,velocidade.y);
       
}
   
   if (posicao.y < tamanho){
   
    velocidade.set(velocidade.x,velocidade.y*-1);
      
   }
   if (posicao.x > width-tamanho){     
     velocidade.set(velocidade.x*-1,velocidade.y);
       
   }
   if (posicao.y > width-tamanho){
     velocidade.set(velocidade.x,velocidade.y*-1);
       
   }
  } 
  void repulsao(int i,int j,Bolas c){ 
        float tamanho2;
        int numerob, numeroc;
        numerob = i;
        numeroc = j;
        tamanho2 = sqrt((sq(tamanho)+sq(c.tamanho())));
        if (j > i){
        numeroc = j-1;
        }
        
        
        b= posicao.dist(c.posicao()); 
        if(b<tamanho){
          
          
          bola.add(new Bolas(posicao.x, posicao.y,tamanho2));
          bola.remove(numerob);
          bola.remove(numeroc);
        }
       
      }
  PVector posicao(){   
  return posicao;    
     }     
  float tamanho(){
 return tamanho;
  } 
  void separacao(int i){
    float teste;
    float tamanho3,tamanho2,tamanho1;
    int numero = i;
   if (tamanho>30){
  teste= random(0,1);
   if (teste<0.9){
     print("oi");
     
     tamanho1=sq(tamanho);
     tamanho2=tamanho1/2;
     tamanho3=sqrt(tamanho2);
     bola.add(new Bolas(posicao.x+tamanho, posicao.y,tamanho3));
     bola.add(new Bolas(posicao.x-tamanho, posicao.y,tamanho3));
     bola.remove(i);
   }
   print(teste);
   }  
  }
  
}

void mousePressed(){      
    bola.add(new Bolas(mouseX, mouseY,random(5,10)));
  }
