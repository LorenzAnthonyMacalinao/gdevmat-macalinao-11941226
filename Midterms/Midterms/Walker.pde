public class Walker
{
  public PVector position = new PVector();
  public float scale = 100;
  public boolean isTarget;
  public boolean isInside;
  public int r;
  public int g;
  public int b;
  
  public Walker(boolean isTarget)
  {
    this.isTarget = isTarget;
    this.isInside = false;
    
    if (this.isTarget)
    {
      this.scale = 100;
      //range is from -540 to 540 minus the diameter
      this.position.x = -(540 - this.scale/2) + (int)(Math.random() * (1080 - this.scale));
      //range is from -360 to 360 minus the diameter
      this.position.y = -(360 - this.scale/2) + (int)(Math.random() * (720 - this.scale));
      
      this.r = 255;
      this.g = 255;
      this.b = 255;
    }
    else
    {
      this.scale = 10 + (int)(Math.random() * 40);
      //range is from -540 to 540 minus the diameter
      this.position.x = -(540 - this.scale/2) + (int)(Math.random() * (1080 - this.scale));
      //range is from -360 to 360 minus the diameter
      this.position.y = -(360 - this.scale/2) + (int)(Math.random() * (720 - this.scale));
      
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
