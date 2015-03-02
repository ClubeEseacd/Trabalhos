class Menu{
 int ratox,ratoy;
 String tipo; 
 
  Menu(){
 
     
  }
void  desenhar(){
   noLoop();
   background(255);
   rect(100,50,600,100);
   fill(255);
   text("sair",400,75);
   fill(0);
   rect(100,250,600,100);
   fill(255);
   text("apagar",400,275);
   fill(0);
   rect(100,450,600,100);
   rect(100,650,600,100);
  }    
  
void botoes(int x,int y,String qual){
 
 ratox=x;
 ratoy=y;
 tipo=qual;
 
 if (ratox > 50 && ratox < 700 &&  ratoy > 50 && ratoy < 150 && tipo == "rato")
   {
    pausa = 0;
    
    sair();
    
   }  
  if (ratox > 50 && ratox < 700 &&  ratoy > 250 && ratoy < 350 && tipo == "rato")
   {
    
    limpar();
    
    
   }  
   if (ratox > 50 && ratox < 700 &&  ratoy > 450 && ratoy < 550 && tipo == "rato")
   {
   
     mod=mod*-1;
     oi = modo(mod);
     
   }
  
   
   
   
     
  
   if (keyCode == 32 && tipo == "teclado")
   {
    pausa = 1;    
    desenhar();
    
   }
 
 if (key == ENTER && tipo == "teclado")
  {
    pausa = 0;
    sair();
   
   }  
 
  
}
  
void carreguei(){
int x,y;
x=mouseX;
y=mouseY;
botoes(x,y,"rato");
}  
void  sair(){
  
   loop(); 
    
  }
 }
 
void limpar(){
 
  while( bola.size()>0){
     bola.remove(0);
   }
 print("oi");
 
} 

String modo(int mod){
 int modo = mod; 
 
  if (modo == 1){
   a = "atracao";
   return a; 
  }
  if (modo == -1){
    a= "repulsao";
   return a ;
  }
  if (modo == 0){
   return a; 
  }
  
 return a; 
  
}



