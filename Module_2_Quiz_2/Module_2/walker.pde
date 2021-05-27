class Walker
{
  float x;
  float y;
  
  void render()
  {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    int a = 50 + (int)(Math.random() * ((100 - 50) + 1));
    fill(r, g, b, a);
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) //North
    {
      y+=10;
    }
    
    else if (rng == 1) //South
    {
      y-=10;
    }
    
    else if (rng == 2) //East
    {
      x+=10;
    }
    else if (rng == 3) //West
    {
      x-=10;
    }
    else if (rng == 4) //North West
    {
      x-=10;
      y+=10;
    }
    else if (rng == 5) //South West
    {
      x-=10;
      y-=10;
    }
    else if (rng == 6) //North East
    {
      x+=10;
      y+=10;
    }
    else if (rng == 7) //South East
    {
      x+=10;
      y-=10;
    }
  }
  void randomWalkBiased()
  {
        int rng = int(random(4));

        
        if (Math.random() * 100 < 40)
        {
              if (rng == 0) //North
              {
                y+=10;
              }
              
              else
              {
                
              }
        }
        
        else
          {
            if (rng == 1) //South
              {
                y-=10;
              }
            
            else if (rng == 2) //East
              {
                x+=10;
              }
            
            else if (rng == 3) //West
              {
                x-=10;
              }
          }
  }
}
