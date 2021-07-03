Walker[] debris; 
Walker target;

void setup()
{
  //frameRate(400);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
  initializeWalkers();
}

void initializeWalkers()
{
  debris = new Walker [100];
  for (int i = 0; i < debris.length; i++)
  {
      debris[i] = new Walker(false);
  }

  target = new Walker (true);
}

void draw()
{
  background(0);

  for (int i = 0; i < debris.length; i++)
  {
    debris[i].render();
  }

  target.render();
  
  for (int i = 0; i < debris.length; i++)
  {
    if (Math.abs(target.position.x - debris[i].position.x) < 10 && Math.abs(target.position.y - debris[i].position.y) < 10)
    {
        //debris[i] = new Walker(false);
        debris[i].isInside = true;
    }
  }
  
  for (int i = 0; i < debris.length; i++)
  {
    if (debris[i].isInside == false)
    {
        PVector direction = PVector.sub(target.position, debris[i].position);
        debris[i].position.add(direction.normalize());
    }

  }
  for (int i = 0; i < debris.length; i++)
  {
    if (debris[i].isInside == false)
    {
      return;
    }
  }
  initializeWalkers();
}
