//nessasary variables
int dialouge;
boolean decider = false;
//saveable variables
int day = 1;
String location = "San Francisco";
//scenes
boolean titleScreen = true;
boolean prolouge = false;
boolean story1 = false;
boolean dayToDay = false;
boolean tournaments = false;
boolean tourneyGame = false;
boolean workInProgress = false;
boolean clubs = false;
boolean diceGameClub = false;
//buttons
Button titleScreenPlay;
Button prolougeCont;
Button story1Cont;
Button gameTournaments;
Button gameClubs;
Button gameFinances;
Button gameSave;
Button returnToMenu;
//Club Buttons
Button clubSFCityPub;
//dice
Die diceP1D1;
Die diceP1D2;
Die diceP1D3;
Die diceP1D4;
Die diceP1D5;
Die diceP1D6;
Die diceP2D1;
Die diceP2D2;
Die diceP2D3;
Die diceP2D4;
Die diceP2D5;
Die diceP2D6;
Die diceP3D1;
Die diceP3D2;
Die diceP3D3;
Die diceP3D4;
Die diceP3D5;
Die diceP3D6;
Die diceP4D1;
Die diceP4D2;
Die diceP4D3;
Die diceP4D4;
Die diceP4D5;
Die diceP4D6;
//Clubs
Club currentClub;
Club cityPubSF= new Club("City Pub",1,1);
void setup()
{
	size(1000,600);
}
void mouseReleased()
{
	if(workInProgress==true)
	{
		decider = returnToMenu.hover();
		if(decider == true)
		{
			workInProgress = false;
			dayToDay = true;
		}
	}else if(dayToDay==true)
	{
		decider = gameTournaments.hover();
		if(decider == true)
		{
			workInProgress = true;
			dayToDay = false;
		}
		decider = gameClubs.hover();
		if(decider == true)
		{
			clubs=true;
			dayToDay=false;
		}
		decider = gameFinances.hover();
		if(decider == true)
		{
			workInProgress=true;
			dayToDay=false;
		}
		decider = gameSave.hover();
		if(decider == true)
		{
			workInProgress=true;
			dayToDay=false;
		}
	}else if(story1==true)
	{
		dialouge++;
		if(dialouge>2)
		{
			decider = story1Cont.hover();
			if (decider == true)
			{
				dayToDay = true;
				story1 = false;
				dialouge = 1;
			}
		}
	}else if(prolouge==true)
	{
		dialouge++;
		if (dialouge>5)
		{
			decider = prolougeCont.hover();
			if(decider==true)
			{
				story1 = true;
				prolouge = false;
				dialouge = 1;		
			}
		}
	}else if(titleScreen==true)
	{
		decider = titleScreenPlay.hover();
		if(decider==true)
		{
			titleScreen = false;
			prolouge = true;
			dialouge = 1;
		}
	}else if(clubs == true)
	{
		decider = clubSFCityPub.hover();
		if(decider==true)
		{
			currentClub=cityPubSF;
		}
	}
}
void promptClick()
{
	textSize(10);
	text("Click",500,550);
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
	if(workInProgress == true)
	{
		workInProgress();
	}
	if(diceGameClub == true)
	{
		diceGameClubs();
	}
	if(game)
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
		prolougeCont = new Button(400,525,200,50,30,"Continue");
		prolougeCont.show();
	}else
	{
		promptClick();
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
		story1Cont = new Button(400,525,200,50,30,"Continue");
		story1Cont.show();
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
	gameFinances = new Button(190,310,300,200,30,"Finances");
	gameFinances.show();
	gameSave = new Button(510,310,300,200,30,"Save");
	gameSave.show();
}
void workInProgress()
{
	textSize(50);
	textAlign(CENTER,CENTER);
	fill(255);
	text("WORK IN PROGRESS",500,300);
	returnToMenu = new Button(400,500,200,75,30,"Return");
	returnToMenu.show();
}
void clubs()
{
	fill(255);
	textSize(25);
	text("Day "+day,500,25);
	textSize(30);
	text(location,500,75);
	for(int loopY = 0; loopY<5;loopY++)
	{
		for(int loopX=0;loopX<5;loopX++)
		{
			stroke(192,192,192);
			fill(0);
			rect((loopX*200)+25,25+((loopY+1)*100),150,50);
		}
	}
	if (location == "San Francisco")
	{
		clubSFCityPub = new Button(25,125,150,50,25,"City Pub");
		clubSFCityPub.show();
	}
}
void diceGameClub()
{
	boolean gamesetup = true;
	fill(255);
	textSize(25);
	text(location,800,30);
	text(currentClub.name,800,70);
	textAlign(CENTER,CENTER)
	stroke(255);
	line(600,0,600,600);
	line(0,50,600,50);
	line(300,0,300,600);
	line(0,350,600,350);
	line(0,300,600,300);
	textSize(10);
	textAlign(LEFT,CENTER);
	text("Player 1",)
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
class Club
{
	String name;
	int difficulty;
	int rich;
	Club(String nameofClub, int inputDifficulty,int inputCash)
	{
		name = nameofClub;
		difficulty = inputDifficulty;
		rich = inputCash;
	}
}