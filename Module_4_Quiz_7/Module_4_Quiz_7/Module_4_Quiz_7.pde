Walker[] walkers = new Walker[100];

void setup()
{
  size(1080,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(80);
  
  for (int i = 0; i < walkers.length; i++)
  {

    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }

}
