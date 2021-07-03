Walker[] debris; 
Walker target;
int numDebris;
int frameCounter;

void setup()
{
  frameRate(60);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
  //number of debris is 100, can be changed here
  numDebris = 100;
  initializeWalkers();
}

void initializeWalkers()
{
  debris = new Walker [numDebris];
  for (int i = 0; i < debris.length; i++)
  {
      debris[i] = new Walker(false);
  }
  target = new Walker (true);
}

void draw()
{
  background(0);
  //render each matter
  for (int i = 0; i < debris.length; i++)
  {
    debris[i].render();
  }

  target.render();
  
  for (int i = 0; i < debris.length; i++)
  {
    if (Math.abs(target.position.x - debris[i].position.x) < 1 && Math.abs(target.position.y - debris[i].position.y) < 1)
    {
        debris[i].isInside = true;
    }
  }
  
  for (int i = 0; i < debris.length; i++)
  {
    if (debris[i].isInside == false)
    {
        //compute dir for each matter
        PVector direction = PVector.sub(target.position, debris[i].position);
        //add normalized dir to each
        debris[i].position.add(direction.normalize());
    }
  }
  
  //frame count is already 300, start a new catastrophe.
  if(frameCounter++ > 300)
  {
    frameCounter = 0;
    initializeWalkers();
  }
}
