public static class Window
{
    public static int windowWidth = 1280;
    public static int windowHeight = 720;
    public static int w = windowWidth/2;
    public static int h = windowHeight/2;
    public static int top = h;
    public static int bottom = -h;
    public static int left = -w;
    public static int right = w;
    public static float eyeZ = -(windowHeight/2.0) / tan(PI*30.0 / 180.0);
}

class Walker
{
  
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);

  void render()
      {
        background(255);
        fill(182, 52, 100);
        circle(position.x, position.y, 50);
      }
      
  void moveAndBounce()
      {
          position.add (speed);
       
          if ((position.x > Window.right) || (position.x < Window.left))
          {
            speed.x *= -1;
          }
         
          if ((position.y > Window.top) || (position.y < Window.bottom))
          {
            speed.y *= -1;
          }
      }
}
