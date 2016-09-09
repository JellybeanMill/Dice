boolean titleScreen = true;
boolean prolouge = false;
boolean story1 = false;
boolean dayToDay = false;
int day = 1;
boolean tourneyGame = false;
Die dice;
void setup()
{
	size(1000,600);
}
void draw()
{
	background(0);
	if (titleScreen == true)
	{
		titleScreenDraw();
	}
	if (prolouge == true)
	{
		prolougeDraw();
	}
	if (story1 == true)
	{
		story1Draw();
	}
	if (tourneyGame == true)
	{
		dice = new Die(mouseX,mouseY);
		dice.show();
	}
}
void titleScreenDraw()
{
	textAlign(CENTER,TOP);
	textSize(50);
	fill(255);
	text("The Dice Run",500,100);
	textAlign(CENTER,CENTER);
	if ((mouseX>400)&&(mouseX<600)&&(mouseY>250)&&(mouseY<300))
	{
		stroke(255);
		fill(0);
		rect(390,240,220,70);
		fill(255);
		textSize(32);
		text("Play",500,275);
		if (mousePressed == true)
		{
			titleScreen = false;
			prolouge = true;
		}
	}else
	{
		stroke(255);
		fill(0);
		rect(400,250,200,50);
		fill(255);
		textSize(30);
		text("Play",500,275);
	}
	
}
void prolougeDraw()
{
	fill(255);
	textAlign(CENTER,CENTER);
	textSize(30);
	text("The year is 2052.",500,50);
	text("Dice Rolling is now a popular sport.",500,150);
	text("You, an amature Dice Roller, decides",500,250);
	text("to make yourself rich off Dice Rolling.",500,350);
	text("Let's see you in Action.",500,450);
	if ((mouseX>400)&&(mouseX<600)&&(mouseY>525)&&(mouseY<575))
	{
		stroke(255);
		fill(0);
		rect(395,520,210,60);
		textSize(32);
		fill(255);
		text("Begin",500,550);
		if(mousePressed == true)
		{
			story1 = true;
			prolouge = false;
		}
	}else
	{
		stroke(255);
		fill(0);
		rect(400,525,200,50);
		textSize(30);
		fill(255);
		text("Begin",500,550);
	}
}
void story1Draw()
{
	textSize(25);
	fill(255);
	textAlign(CENTER,CENTER);
	text("Day "+day,500,25);
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
		fill(255);
		rect(myX,myY,75,75,10);
		if(roll == 1)
		{
			stroke(0);
			fill(0);
			ellipse(myX+38,myY+38,20,20);
		}
		if(roll == 2)
		{
			stroke(0);
			fill(0);
			ellipse(myX+13,myY+13,20,20);
			ellipse(myX+63,myY+63,20,20);
		}
		if(roll == 3)
		{
			stroke(0);
			fill(0);
			ellipse(myX+63,myY+13,20,20);
			ellipse(myX+38,myY+38,20,20);
			ellipse(myX+13,myY+63,20,20);
		}
		if(roll == 4)
		{
			stroke(0);
			fill(0);
			ellipse(myX+13,myY+13,20,20);
			ellipse(myX+63,myY+13,20,20);
			ellipse(myX+13,myY+63,20,20);
			ellipse(myX+63,myY+63,20,20);
		}
		if(roll == 5)
		{
			stroke(0);
			fill(0);
			ellipse(myX+13,myY+13,20,20);
			ellipse(myX+63,myY+13,20,20);
			ellipse(myX+13,myY+63,20,20);
			ellipse(myX+63,myY+63,20,20);
			ellipse(myX+38,myY+38,20,20);
		}
		if(roll == 6)
		{
			stroke(0);
			fill(0);
			ellipse(myX+13,myY+13,20,20);
			ellipse(myX+63,myY+13,20,20);
			ellipse(myX+13,myY+63,20,20);
			ellipse(myX+63,myY+63,20,20);
			ellipse(myX+13,myY+38,20,20);
			ellipse(myX+63,myY+38,20,20);
		}
	}
}
