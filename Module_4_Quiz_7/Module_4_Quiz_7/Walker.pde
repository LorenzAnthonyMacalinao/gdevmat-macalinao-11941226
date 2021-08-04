public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector mouse = new PVector();
  public float velocityLimit = 5;
  public float scale;
  
  public Walker()
  {
    this.position.x = -(Window.windowWidth/2) + (int)(Math.random() * (Window.windowWidth));
    this.position.y = -(Window.windowHeight/2) + (int)(Math.random() * (Window.windowHeight));

    this.scale = 10 + (int)(Math.random() * 40);

  }
  
  public void update()
  {

    mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(0.2);
    acceleration = mouse;
    
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.velocity.limit(velocityLimit);

  }
  
  public  void render()
  {
    noStroke();
    circle(this.position.x, this.position.y, this.scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.windowWidth)
    {
      this.position.x = 0;
    }
    else if (this.position.x < 0)
    {
      this.position.x = Window.windowWidth;
    }
    if (this.position.y > Window.windowHeight)
    {
      this.position.y = 0;
    }
    else if (this.position.y < 0)
    {
      this.position.y = Window.windowHeight;
    }
  }
}
