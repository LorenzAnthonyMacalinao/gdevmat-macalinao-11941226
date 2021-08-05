public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector(0.2, 0);
  //public PVector direction;
  
  public int r, g, b, a;
  public float velocityLimit = 10;
  public float scale = 15;
  
  public float mass = 1;
  
  public Walker()
  {
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    a = int(random(256));
    scale = int (random(15, 30));
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    noStroke();
    fill (r, g, b);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (position.x >= Window.right)
    {
      position.x = Window.right;
      velocity.x *= -1;
    }
    else if (position.y <= Window.bottom)
    {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
}
