//Raven Kwok (aka Guo Ruiwen)
//ravenkwok.com
/*
Inspired by Ale's(http://openprocessing.org/user/12899) drawingMachine_10(http://openprocessing.org/sketch/34320).
*/

ParticleController pc;
ParticleController pc2;
ParticleController pc3;
//ParticleController pc4;
Tree[] trees;

void setup(){
  size(1000,1000);
  smooth();
  background(255);
  pc = new ParticleController();
  pc.pAddLine(3000,height);
  pc.iAddLine(300,800, height * 3);
  pc2 = new ParticleController();
  pc2.pAddLine(3000,height);
  pc2.iAddLine(300,800, height * 0.75);
  pc3 = new ParticleController();
  pc3.pAddLine(3000,height);
  pc3.iAddLine(300,800, height * 0.75);
  //pc4 = new ParticleController();
  //pc4.pAddLine(1000,0);
  //pc4.iAddLine(100,300, 1000);
  trees = new Tree[int(random(3, 13))];
  for (int i = 0; i < trees.length; i++){
    trees[i] = new Tree(new PVector(random(20, width - 20), 800), new PVector(0,-1), random(5, 12));
  } 
}

void draw(){
  pc.update(50);
  pc.display();
  pc2.update(9.9);
  pc2.display();
  pc3.update(9.5);
  pc3.display();
  for (int i = 0; i < trees.length; i++){
    trees[i].display();
  }
  
  
  if(keyPressed){
    save("/Perso/image3.jpg");
  }

  
}