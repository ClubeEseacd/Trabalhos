


ArrayList<Bolas> bola;
int tamanho,pausa;
PVector rep;
String tipo;
String oi = "repulsao";
String a="atracao";
int mod= -1;


void setup(){
size(800,800);
background(255);
line(400,0,400,20);

bola = new ArrayList<Bolas>();

}





void draw(){
  background(255);
  fill(255);
  ellipse(400,400,780,780);
  ellipse(400,400,30,30);
  
  
     for (Bolas bolas : bola) {
        bolas.mover();
        bolas.desenhar();
        bolas.atracaomag(oi);
        bolas.informacao();
     }


     for (int i = bola.size()-1; i >= 0; i--) {
       Bolas b = bola.get(i);  
       b.remover(i); 
            for (int j = bola.size()-1; j >= 0; j--) {
                if ( j != i){
                  Bolas c = bola.get(j);
                  b.repulsao(c);      
                }
            }
     }       
  tamanho = bola.size();
  fill(0);
  text(tamanho,400,40);
}


void mousePressed(){  
  if (pausa == 0){
    
    bola.add(new Bolas(mouseX, mouseY));
  }
  if (pausa == 1){
    Menu menu = new Menu(); 
    menu.carreguei();

  }
  
}


void keyPressed(){
    Menu menu = new Menu(); 
   menu.botoes(0,0,"teclado");
 
}

 

