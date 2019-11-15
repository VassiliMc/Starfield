int sizeX = 1000;
int sizeY = 1000;
boolean explosions = false;
Particle[] explosion = new Particle[(int)(Math.random()*500)+50];
OddballParticle[] spark = new OddballParticle[(int)(Math.random()*500)+50];
void setup()
{
	background(0);
    size(1000,1000);
}
void draw()
{
	background(0);
	if(explosions){
		for(int i = 0; i < explosion.length; i++){
			explosion[i].appear();
        	explosion[i].move();
    	}
    	for(int i = 0; i < spark.length; i++){
			spark[i].appear();
        	spark[i].move();
        	spark[i].fluctuate();
    	}
    }
}
void mousePressed(){
	explosions = true;
	for(int i = 0; i < explosion.length; i++){
		explosion[i] = null;
	}
	for(int i = 0; i < spark.length; i++){
		spark[i] = null;
	}
	background(0);
    for(int i = 0; i < explosion.length; i++){
        explosion[i] = new Particle();
        explosion[i].appear();
    }
    for(int i = 0; i < spark.length; i++){
        spark[i] = new OddballParticle();
        spark[i].appear();
    }
}
class Particle
{
	float myX, myY, mySpeed, mySize;
	float myDirectionY, myDirectionX;
	int myColour;
    public Particle(){
    	myX = mouseX;
    	myY = mouseY;
    	mySpeed = (float)Math.random()*10+1;
    	mySize = 100/mySpeed;
    	myDirectionY = (float)(Math.sin(Math.random()*2*3.14-3.14));
    	myDirectionX = (float)(Math.cos(Math.random()*2*3.14-3.14));
    	myColour = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);


    }
    public void move(){
    	myY = myY + mySpeed/myDirectionY;
    	myX = myX + mySpeed/myDirectionX;
    }
    public void appear(){
    	fill(myColour);
    	ellipse(myX, myY, mySize/2, mySize/2);
    }
}

class OddballParticle extends Particle
{
	public OddballParticle(){
		mySpeed = (float)Math.random()*2-1;
		mySize = 30*mySpeed;
		myColour = color((int)(Math.random()*30)+225, (int)(Math.random()*155)+100, (int)(Math.random()*155)+1);
	}
	public void fluctuate(){
		if((int)(Math.random()*5) == 2){
			myY += Math.random()*2-1;
			myX += Math.random()*2-1;
		}
	}
}
