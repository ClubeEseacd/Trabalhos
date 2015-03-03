ArrayList<Bolas> bola;
int numero;











void setup() {
  size(800, 800);

  bola = new ArrayList<Bolas>();
}


void draw() {
  background(255);

  for (Bolas bolas : bola) {
    bolas.mover();
    bolas.desenhar(); 
    bolas.pontas();
  }
  numero=bola.size();
  fill(0);
  text(numero, 400, 10);

  for (int i = bola.size ()-1; i >= 0; i--) {
    Bolas b = bola.get(i);  
    if (b.tamanho()>30) {
      b.separacao(i);
    }
    for (int j = bola.size ()-1; j >= 0; j--) {
      if ( j != i) {
        Bolas c = bola.get(j);
        b.comer(i, j, c);    
        if (b.tamanho()>30) {
          b.separacao(i);
        }
      }
    }
  }
}


void mousePressed() {      
  bola.add(new Bolas(mouseX, mouseY, random(5, 10)));
}

