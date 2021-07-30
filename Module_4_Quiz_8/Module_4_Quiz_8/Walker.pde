public class Walker
{
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public int r, g, b;
  public float velocityLimit = 10;
  public float scale;
  public float mass;
  
  public Walker()
  {
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    mass = (1) + (int)(Math.random() * ((10 - (1)) + 1));
    scale = mass * 15;
  }
  
  //Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); //force accumulation
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration); //velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); //resets acceleration every frame
  }
  
  public void render()
  {
    noStroke();
    fill(r, g, b);
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
