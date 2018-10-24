class Interference{
  
  String mode; 
  PVector mLoc;
  float range;
  
  Interference(float x, float y, float range_){
    
    mLoc = new PVector(x,y);
    
    float randFloat = random(1);
    if(randFloat<0.5) mode = "ATTRACT";
    else mode = "REJECT";
    
    range = random(0,range_);
  }
}
class Particle {

  PVector mLoc;
  PVector dir;

  Particle(float x, float y) {
    mLoc = new PVector(x, y);
  }

  void update(Interference itf, float force) {
    float distance = dist(itf.mLoc.x, itf.mLoc.y, mLoc.x, mLoc.y);
    if (distance<itf.range) {
      if (itf.mode.equals("ATTRACT")) {
        dir = PVector.sub(itf.mLoc, mLoc);
      }
      else {
        dir = PVector.sub(mLoc, itf.mLoc);
      }
      dir.normalize();
      dir.mult(force/distance);
      mLoc.add(dir);
    }
  }

  void display() {
    stroke(20, 10);
    point(mLoc.x, mLoc.y);
  }
}
class ParticleController{
  
  Interference [] interferences;
  Particle [] particles;
  
  ParticleController(){
  }
  
  void pAddCircle(int amt, float rRange){
    particles = new Particle[amt];
    for(int i=0;i<amt;i++){
      float r = rRange;
      float randDegree = random(360);
      float x = cos(radians(randDegree))*r*random(0.9, 1.1) +width/2;
      float y = sin(radians(randDegree))*r*random(0.9, 1.1)+height/2;
      particles[i] = new Particle(x,y);
    }
  }
  
  void iAddCircle(int amt, float rRange, float irange){
    interferences = new Interference[amt];
    for(int i=0;i<amt;i++){
      float r = rRange;
      float randDegree = random(360);
      float x = cos(radians(randDegree))*r+width/2;
      float y = sin(radians(randDegree))*r+height/2;
      interferences[i] = new Interference(x,y, irange);
    }
  }
  
  void pAddLine(int amt, float height_){
    particles = new Particle[amt];
    for(int i=0;i<amt;i++){
      float y = height_;
      float x = random(width);
      particles[i] = new Particle(x,y);
    }
  }
  
  void iAddLine(int amt, float height_, float irange){
    interferences = new Interference[amt];
    for(int i=0;i<amt;i++){
      float x = random(width);
      float y = height_;
      interferences[i] = new Interference(x,y, irange);
    }
  }
  
  void update(float force){
    for(int i=0;i<interferences.length;i++){
      for(int j=0;j<particles.length;j++){
        particles[j].update(interferences[i],force);
      }
    }
  }
  
  void display(){
    for(int i=0;i<particles.length;i++){
      particles[i].display();
    }
  }
}