void setup()
{
  size(1080,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  drawLightSaberRed();
  drawLightSaberWhite();
  drawLightSaberHandle();
}

void drawLightSaberHandle()
{
    PVector mouse1 = mousePos();
    mouse1.normalize().mult(100);
    stroke(0, 0 , 0);
    strokeWeight(15);  
    line(0, 0, mouse1.x, mouse1.y);  
    line(0, 0, -(mouse1.x), -(mouse1.y)); 
}

void drawLightSaberWhite()
{   
    PVector mouse = mousePos();
    mouse.normalize().mult(350);
    stroke(255, 255 , 255);
    strokeWeight(10);  
    line(0, 0, mouse.x, mouse.y);  
    line(0, 0, -(mouse.x), -(mouse.y));
    println(mouse.mag());
}

void drawLightSaberRed()
{   
    PVector mouse2 = mousePos();
    mouse2.normalize().mult(350);
    stroke(255, 0 , 0);
    strokeWeight(20);  
    line(0, 0, mouse2.x, mouse2.y);  
    line(0, 0, -(mouse2.x), -(mouse2.y)); 
}
