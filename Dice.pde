//important variables
int dialouge;
int day = 1;
boolean decider;
//scenes
boolean titleScreen = true;
boolean prolouge = false;
boolean story1 = false;
boolean dayToDay = false;
boolean tournaments = false;
boolean tourneyGame = false;
//buttons
Button titleScreenPlay;
Button prolougeCont;
Button story1Cont;
Button gameTournaments;
Button gameClubs;
Button gameFinaces;
Button gameSave;
//dice
Die dice;
void setup()
{
	size(1000,600);
}
void mouseReleased()
{
	if(titleScreen==true)
	{
		decider = titleScreenPlay.hover();
		if(decider=true)
		{
			titleScreen = false;
			prolouge = true;
			dialouge = 0;
		}
	}
	if(prolouge==true)
	{	
		dialouge++;
		if (dialouge>2)
		{
			decider = prolougeCont.hover();
			if(decider=true)
			{
				story1 = true;
				prolouge = false;
				dialouge = 0;		
			}
		}
	}
	if(story1==true)
	{
		dialouge++;
		if((mouseX>400)&&(mouseX<600)&&(mouseY>525)&&(mouseY<575)&&(dialouge>=2))
		{
			dayToDay = true;
			story1 = false;
			dialouge = 0;
		}
	}
	if(dayToDay==true)
	{
		if((mouseX>190)&&(mouseX<490)&&(mouseY>90)&&(mouseY<290))
		{

		}
	}
}
void promptClick()
{
	story1Cont = new Button(400,525,200,50,30,"Continue");
	story1Cont.show();
}
void draw()
{
	background(0);
	if (titleScreen == true)
	{
		titleScreen();
	}
	if (prolouge == true)
	{
		prolouge();
	}
	if (story1 == true)
	{
		story1();
	}
	if(dayToDay == true)
	{
		dayToDay();
	}
	if(tourneyGame == true)
	{
		dice = new Die(mouseX,mouseY);
		dice.show();
	}
}
void titleScreen()
{
	textAlign(CENTER,TOP);
	textSize(50);
	fill(255);
	text("The Dice Run",500,100);
	textAlign(CENTER,CENTER);
	titleScreenPlay = new Button(390,240,220,70,30,"Play");
	titleScreenPlay.show();
}
void prolouge()
{
	fill(255);
	textAlign(CENTER,CENTER);
	textSize(30);
	if (dialouge>=1)
	{
		text("The year is 2052.",500,50);
	}
	if (dialouge>=2)
	{
		text("Dice Rolling is now a popular sport.",500,150);
	}
	if (dialouge>=3)
	{
		text("You, Eric, are an amature Dice Roller.",500,250);
	}
	if (dialouge>=4)
	{
		text("You decide to make yourself rich off Dice Rolling.",500,350);
	}
	if (dialouge>=5)
	{
		text("Let's see you in Action.",500,450);
	}
	if (dialouge>5)
	{
		prolougeCont = new Button(400,525,200,50,30,"Continue");
		prolougeCont.show();
	}
}
void story1()
{
	textSize(25);
	fill(255);
	textAlign(CENTER,CENTER);
	text("Day "+day,500,25);
	textAlign(CENTER,CENTER);
	textSize(30);
	fill(255);
	if(dialouge>=1)
	{
		text("ERIC!",500,100);
	}
	if(dialouge>=2)
	{
		text("GET OFF YOUR LAZY ASS AND DO SOMETHING!",500,200);
	}
	if(dialouge<2)
	{
		textSize(10);
		text("Click",500,550);
	}else
	{
		promptClick();
	}
}
void dayToDay()
{
	textSize(25);
	fill(255);
	textAlign(CENTER,CENTER);
	text("Day "+day,500,25);
	gameTournaments = new Button(190,90,300,200,30,"Tournaments");
	gameTournaments.show();
	gameClubs = new Button(510,90,300,200,30,"Clubs");
	gameClubs.show();
	gameFinaces = new Button(190,310,300,200,30,"Finaces");
	gameFinaces.show();
	gameSave = new Button(510,310,300,200,30,"Save");
	gameSave.show();
}
class Die
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
class Button
{
	int myX;
	int myY;
	int sizeX;
	int sizeY;
	int textS;
	int halfX;
	int halfY;
	String text;
	//variable declarations here
	Button(int x,int y,int xSize,int ySize,int sText,String inputText)
	{
		myX = x;
		myY = y;
		sizeX = xSize;
		sizeY = ySize;
		textS = sText;
		text = inputText;
		halfX = (int)(x+(0.5*xSize));
		halfY = (int)(y+(0.5*ySize));
	}
	void show()
	{
		if((mouseX>myX)&&(mouseX<myX+sizeX)&&(mouseY>myY)&&(mouseY<myY+sizeY))
		{
			stroke(255);
			fill(0);
			rect(myX-10,myY-10,sizeX+20,sizeY+20);
			fill(255);
			textSize(textS+5);
			textAlign(CENTER,CENTER);
			text(text,halfX,halfY);
		}else
		{
			stroke(255);
			fill(0);
			rect(myX,myY,sizeX,sizeY);
			fill(255);
			textSize(textS);
			textAlign(CENTER,CENTER);
			text(text,halfX,halfY);
		}
	}
	boolean hover()
	{
		if((mouseX>myX)&&(mouseX<myX+sizeX)&&(mouseY>myY)&&(mouseY<myY+sizeY))
		{
			return true;
		}else
		{
			return false;
		}
	}
}