void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, - (height/2.0) / tan (PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}
/* Module 1 - Macalinao */
void draw()
{
  background(0);
  
  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <=300; i +=10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawQuadraticFunction()
{
  /*
  f(x) = x^2 − 15x − 3 (yellow color)
  let x be 2, then y = -29 (2,-29)
  let x be 5, then y = 53 (5,53)
  */ 
  color yellow = color (255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <=300; x+=0.1f)
  {
    circle(x, ((x * x) - (15 * x) - 3), 3);
  }
}

void drawLinearFunction()
{
  /*
  f(x) =−5x + 30 (purple color)
  let x be 2, then y = 20 (2,20)
  let x be -2, then y = 40 (-2,40)
  */ 
  
  color purple = color (128, 0, 128);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, ((-5 * x) + 30), 3);
  }
}

void drawSineWave()
{
  color red = color (255, 0, 0);
  fill(red);
  stroke(red);
  
  for (int x = -300; x <=300; x++)
  {
    circle(x,((20 * (float)Math.sin(0.1 * (x)))) , 3);
  }
  /*2 sin(4(x − 0.5)) + 3*/
}
