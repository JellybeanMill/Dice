void setup()
{
	size(1000,600);
}
void draw()
{
	//your code here
}
void mousePressed()
{
	
}
class Die //models one single dice cube
{
	int myX;
	int myY;
	int roll;
	//variable declarations here
	Die(int x, int y)
	{
		myX = x;
		myY = y;
		roll = (int)((Math.random()*6)+1);
	}
	void show()
	{
		
	}
}
