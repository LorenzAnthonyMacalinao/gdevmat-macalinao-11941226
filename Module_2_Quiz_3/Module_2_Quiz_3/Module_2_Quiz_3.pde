void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  float circleGaussian = randomGaussian();
  println(gaussian);
  
  float standardDeviation = 400;
  float mean = 0;
  float circleStandardDeviation = 50;
  float circleMean = 0;
  
  float x = standardDeviation * gaussian + mean;
  int y = (-720) + (int)(Math.random() * ((720 - (-720)) + 1));
  float scale = circleStandardDeviation * circleGaussian + circleMean;
  
  noStroke();
  
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    int a = 50 + (int)(Math.random() * ((100 - 50) + 1));
    fill(r, g, b, a);
    circle(x, y, scale);
}
