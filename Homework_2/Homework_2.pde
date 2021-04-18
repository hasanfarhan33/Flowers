Flower[] flowers = new Flower[20]; 
float time; 
void setup()
{
  size(900, 700);
  time = millis();

  for (int i = 0; i < flowers.length; i++)
  {
    flowers[i] = new Flower();
  }
}

void draw()
{
  background(#44743E);

  for (int i = 0; i < flowers.length; i++)
  {
    flowers[i].createFlower();
    //flowers[i].rotateFlower();
    if (millis() - time > 10000)
    {
      flowers[i].createPollen();
      flowers[i].movePollen();
    }

    if (millis() - time > 12000)
    {
      //Start checking if the pollen has landed into the circle  
      //println("Sixth second has passed"); 
      flowers[i].checkHit();
    }
  }
  //flowers.createFlower();
  //flowers.emitPollen();
}
