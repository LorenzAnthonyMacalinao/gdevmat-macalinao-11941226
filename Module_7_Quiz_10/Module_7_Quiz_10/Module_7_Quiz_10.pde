Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posX = 0;
  for (int i = 0; i < 10; i++)
  {
    posX = 2 * (Window.windowWidth / 10) * (i - 5);
    walkers[i] = new Walker();
    walkers[i].position = new PVector (posX + 50, 300);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  for (Walker w : walkers)
  {
    
    w.render();
    w.update();
    
    PVector wind = new PVector(0.1, 0);
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(wind);
    w.applyForce(gravity); // applying gravity to Walker
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    //F = -uNv
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); //apply friction to Walker
    
    w.checkEdges();
  
    if(ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
           if (mousePressed)
       {
          setup();
       }
}
