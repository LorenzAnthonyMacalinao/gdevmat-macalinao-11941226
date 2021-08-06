public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float r, g, b, a;
  public float velocityLimit = 10;
  public float scale = 15;
  
  public float mass;
  
  public float gravitationalConstant = 1;
  
  public Walker()
  {
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    a = int(random(256));
    mass = int(random(5, 30));
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
    fill (r, g, b, a);
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
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); //direction
    float distance = force.mag();
    force.normalize(); // normalize to accurately get position
    
    distance = constrain(distance, 5, 25); //solves divide by 0, and divide by really tiny values
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
