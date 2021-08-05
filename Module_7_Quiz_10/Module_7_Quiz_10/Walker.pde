public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public int r, g, b;
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  
  public Walker()
  {
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
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
  if (this.position.x >= Window.right)
  {
    this.position.x = Window.right;
    this.velocity.x *= -1;
  }
  
  else if (this.position.x <= Window.left)
  {
    this.position.x = Window.left;
    this.velocity.x *= -1;
  }
  
  if (this.position.y >= Window.top)
  {
    this.position.y = Window.top;
    this.velocity.y *= -1;
  }
  
  else if (this.position.y <= Window.bottom)
  {
    this.position.y = Window.bottom;
    this.velocity.y *= -1;
  }
 }
}
