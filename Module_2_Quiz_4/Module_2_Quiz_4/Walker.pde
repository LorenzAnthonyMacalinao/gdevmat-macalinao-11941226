public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  public float scale = 0;
  public float r = 25, g = 255, b = 54;
  
  void render()
  {
    scale = map(noise(scale), 0, 1, 5, 150);
    r = map(noise(r), 0, 1, 0, 255);
    g = map(noise(g), 0, 1, 0, 255);
    b = map(noise(b), 0, 1, 0, 255);

    scale += 0.01f;
    r += 0.05f;
    g += 0.05f;
    b += 0.05f;    
    noStroke();
    fill(r, g, b);
    circle( x, y, scale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -640, 640);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}
