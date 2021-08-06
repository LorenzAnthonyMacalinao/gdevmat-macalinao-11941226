Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posX = 0;
  int posY = 0;
  for (int i = 0; i < walkers.length; i++) 
  {
    posX = int(random(-640, 640));
    posY = int(random(-360, 360));
    walkers[i] = new Walker();
    walkers[i].position = new PVector (posX, posY);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++) 
    {
      if (i != j) 
      {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }

    walkers[i].update();
    walkers[i].render();
  }
}
