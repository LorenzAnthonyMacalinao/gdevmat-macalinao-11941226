public class Walker
{
  public PVector position = new PVector();
  public float scale;
  public boolean isTarget;
  public boolean isInside;
  public int r;
  public int g;
  public int b;
  
  //this is the constructor that determines if it's a whitehole or a debris. If it's true, it's a whitehole. Otherwise, debris.
  public Walker(boolean isTarget)
  {
    this.isTarget = isTarget;
    this.isInside = false;
    
    if (this.isTarget)
    {
      this.scale = 100; //whitehole is always 100 pixels diameter
      //range is from -540 to 540 minus the diameter
      this.position.x = -(Window.windowWidth/2 - this.scale/2) + (int)(Math.random() * (Window.windowWidth - this.scale));
      //range is from -360 to 360 minus the diameter
      this.position.y = -(Window.windowHeight/2 - this.scale/2) + (int)(Math.random() * (Window.windowHeight - this.scale));
      
      //it's always white (whitehole)
      this.r = 255;
      this.g = 255;
      this.b = 255;
    }
    else
    {
      //debris diameter range is between 10 and 50
      this.scale = 10 + (int)(Math.random() * 40);
      //range is from -540 to 540 
      this.position.x = -Window.windowWidth/2 + (int)(Math.random() * Window.windowWidth);
      //range is from -360 to 360 
      this.position.y = -Window.windowHeight/2 + (int)(Math.random() * Window.windowHeight);
      //the debris has random color (including white)
      this.r = int(random(255));
      this.g = int(random(255));
      this.b = int(random(255));
    }
  }
  
  public void render()
  {
    noStroke(); 
    fill(this.r, this.g, this.b);
    circle(this.position.x, this.position.y, this.scale);
  }

}
