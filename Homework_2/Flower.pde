class Flower {
  //Variables for flower
  float faceX, faceY, faceRadius, numOfPetals, r, g, b, petalLength, petalWidth;
  color orange = #FCC173; //Face Color

  //Variables for rotating 
  float rotateX, rotateY; 
  float angle = 0; 
  float rotateSpeed = random(-0.001, 0.001);

  //Variables for Pollen
  float pollenX, pollenY, pollenRadius = random(2, 5); 
  float xSpeed = random(-2, 2); 
  float ySpeed = random(-2, 2);
  boolean hit = false; 
  color yellow = #FFF583;

  //PVectors 
  PVector Face; 
  PVector Pollen; 
  float distance;

  //Variables for dead flowers 
  color dead = #8B8B8B;
  float petalShrink = 0.01; 


  public Flower()
  { 
    faceX = random(0, width); 
    faceY = random(0, height); 
    rotateX = faceX; 
    rotateY = faceY; 
    faceRadius = random(15, 30);
    pollenX = faceX; 
    pollenY = faceY;
    r = random(200, 255); 
    g = random(200, 255); 
    b = random(200, 255); 
    petalLength = map(faceRadius, 15, 30, 30, 90);
    petalWidth = random(10, 20);
  }

  public void createFlower()
  {  


    //Creating the petals
    for (int i=0; i < 360; i+=15) {
      pushMatrix();
      strokeWeight(0.5);
      stroke(0);
      if (hit == false)
      {
        fill(r, g, b);
        translate(faceX, faceY);
        rotate(radians(i));
        rotate(angle+=rotateSpeed);
      } else
      {
        fill(dead); 
        translate(faceX, faceY); 
        rotate(radians(i));
        petalLength = petalLength - petalShrink; 
        //petalWidth = petalLength - petalShrink; 
        if (petalLength < faceRadius)
        {
          petalShrink = 0;
        }
        angle = 0;
      }
      ellipse(0, 0, petalLength, petalWidth); 

      popMatrix();
    }
    //Creating the face
    pushMatrix();
    stroke(0);
    if (hit == false)
    {
      fill(orange);
    } else
    {
      fill(dead);
    }    
    ellipse(faceX, faceY, faceRadius, faceRadius);
    popMatrix();

    Face = new PVector(faceX, faceY);
  }

  public void createPollen()
  {
    if(hit == false)
    {
      strokeWeight(0.5); 
      fill(yellow);
      ellipse(pollenX, pollenY, pollenRadius, pollenRadius);
    }
    else
    {
      //Don't create a pollen; 
    }
  }

  public void movePollen()
  {
    pollenX += xSpeed; 
    pollenY += ySpeed;

    if (pollenY > height || pollenY < 0)
    {
      if (pollenY > height)
      {
        pollenY = random(-5, 0);
        pollenX = random(0, width);
      } else if (pollenY < 0)
      {
        pollenY = height + random(0, 5);
        pollenX = random(0, width);
      }
    }

    if (pollenX > width || pollenX < 0)
    {
      if (pollenX > width)
      {
        pollenX = random(-5, 0); 
        pollenY = random(0, height);
      } else if (pollenX < 0)
      {
        pollenX = width + random(0, 5);
        pollenY = random(0, height);
      }
    }

    Pollen = new PVector(pollenX, pollenY);
  }

  public void checkHit()
  {
    if (pollenX != faceX && pollenY != faceY)
    {
      distance = PVector.dist(Pollen, Face); 
      if (distance < faceRadius)
      {
        hit = true;
      }
    }
  }
}
