Walker[] walkers = new Walker[8];
PVector wind = new PVector(0, 0.15);
float mew;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posY = 0;
  for (int i = 0; i < 8; i++)
  {
    posY = 2 * (Window.windowHeight / 8) * (i - (8/2));
    walkers[i] = new Walker();
    walkers[i].position = new PVector(-500, posY);
    walkers[i].mass = 8 - i;
    walkers[i].scale = walkers[i].mass * 15;
  }
}

 void draw()
 {
  background(255);

  for (Walker w : walkers)
  {

    //Friction = -1 * mew * N * v
    if (w.position.x <= 0)
    {
       mew = 0.01f; //coefficient of friction
    }
    else
    {
       mew = 0.4f;
    }
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy(); // copy copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    PVector gravity = new PVector(0.2, 0);
    w.update();
    w.render();
    //w.applyForce(wind);
    w.applyForce(gravity);
    w.checkEdges();
    stroke(0);
    strokeWeight(4);
    line(0, 720, 0, -720);
  }
     if (mousePressed)
     {
        setup();
     }
}
