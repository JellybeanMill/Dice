//nessasary variables
int dialouge;
boolean decider = false;
//saveable variables
int day = 1;
String location = "San Francisco";
int ownedMoney = 1000;
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
//Progressional Buttons
Button titleScreenPlay;
Button prolougeCont;
Button story1Cont;
Button gameTournaments;
Button gameClubs;
Button gameFinances;
Button gameSave;
Button returnToMenu;
//Club Functional Variables
Button clubSFCityPub;
Button betUp;
Button betDown;
Button clubRoll;
Button clubStop;
boolean clubGameSetup;
boolean clubPlay;
int betSizePlayer;
//Clubs
Club currentClub;
Club cityPubSF= new Club("City Pub",1,1);
//Dice
Die fillerDie;
Die p1d1 = new Die(19,75);
Die p1d2 = new Die(113,75);
Die p1d3 = new Die(207,75);
Die p1d4 = new Die(19,200);
Die p1d5 = new Die(113,200);
Die p1d6 = new Die(207,200);
Die p2d1 = new Die(318,75);
Die p2d2 = new Die(412,75);
Die p2d3 = new Die(506,75);
Die p2d4 = new Die(318,200);
Die p2d5 = new Die(412,200);
Die p2d6 = new Die(506,200);
Die p3d1 = new Die(19,375);
Die p3d2 = new Die(113,375);
Die p3d3 = new Die(207,375);
Die p3d4 = new Die(19,500);
Die p3d5 = new Die(113,500);
Die p3d6 = new Die(207,500);
Die pud1 = new Die(318,375);
Die pud2 = new Die(412,375);
Die pud3 = new Die(506,375);
Die pud4 = new Die(318,500);
Die pud5 = new Die(412,500);
Die pud6 = new Die(506,500);
//THE CODE
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
			diceGameClub=true;
			clubs=false;
			clubGameSetup = true;
			betSizePlayer= (int)(ownedMoney*(0.05));
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
		showTitleScreen();
	}
	if (prolouge == true)
	{
		showProlouge();
	}
	if (story1 == true)
	{
		showStory1();
	}
	if(dayToDay == true)
	{
		showDayToDay();
	}
	if(workInProgress == true)
	{
		showWorkInProgress();
	}
	if(clubs == true)
	{
		showClubs();
	}
	if(diceGameClub == true)
	{
		showDiceGameClub();
	}
}
void showTitleScreen()
{
	textAlign(CENTER,TOP);
	textSize(50);
	fill(255);
	text("The Dice Run",500,100);
	textAlign(CENTER,CENTER);
	titleScreenPlay = new Button(390,240,220,70,30,"Play");
	titleScreenPlay.show();
}
void showProlouge()
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
void showStory1()
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
void showDayToDay()
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
void showWorkInProgress()
{
	textSize(50);
	textAlign(CENTER,CENTER);
	fill(255);
	text("WORK IN PROGRESS",500,300);
	returnToMenu = new Button(400,500,200,75,30,"Return");
	returnToMenu.show();
}
void showClubs()
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
void showDiceGameClub()
{
	
	fill(255);
	textSize(25);
	textAlign(CENTER,CENTER);
	text(location,800,30);
	text(currentClub.name,800,70);
	text("Money: "+ownedMoney,800,150);
	stroke(255);
	line(600,0,600,600);
	line(0,50,600,50);
	line(300,0,300,600);
	line(0,350,600,350);
	line(0,300,600,300);
	textSize(20);
	textAlign(LEFT,CENTER);
	text("Player 1",10,25);
	text("Player 2",310,25);
	text("Player 3",10,325);
	text("You",310,325);
	textSize(15);
	textAlign(LEFT,BOTTOM);
	text("Cash: "+currentClub.player1cash,110,23);
	text("Cash: "+currentClub.player2cash,410,23);
	text("Cash: "+currentClub.player3cash,110,323);
	text("Bets: "+currentClub.player1bet,110,48);
	text("Bets: "+currentClub.player2bet,410,48);
	text("Bets: "+currentClub.player3bet,110,348);
	fill(0);
	stroke(255);
	rect(650,260,300,40);
	textSize(20);
	fill(255);
	text("Bet",650,200);
	text(betSizePlayer,655,295);
	p1d1.show();
	p1d2.show();
	p1d3.show();
	p1d4.show();
	p1d5.show();
	p1d6.show();
	p2d1.show();
	p2d2.show();
	p2d3.show();
	p2d4.show();
	p2d5.show();
	p2d6.show();
	p3d1.show();
	p3d2.show();
	p3d3.show();
	p3d4.show();
	p3d5.show();
	p3d6.show();
	pud1.show();
	pud2.show();
	pud3.show();
	pud4.show();
	pud5.show();
	pud6.show();
	if(clubGameSetup == true)
	{
		betUp = new Button(660,210,130,30,10,"Raise");
		betDown = new Button(810,210,130,30,10,"Lower");
		betUp.show();
		betDown.show();
		decider = betUp.hover();
		if ((decider==true)&&(mousePressed == true))
		{
			if (betSizePlayer<ownedMoney)
			{
				betSizePlayer = betSizePlayer + ((int)(ownedMoney*0.01));
			}
		}
		decider = betDown.hover();
		if ((decider==true)&&(mousePressed==true))
		{
			if (betSizePlayer>0)
			{
				betSizePlayer = betSizePlayer - ((int)(ownedMoney*0.01));
			}
		}
		clubRoll = new Button(650,325,300,100,35,"Roll");
		clubRoll.show();
		decider = clubRoll.hover();
		if ((decider == true)&&(mousePressed==true))
		{
			clubPlay = true;
			clubGameSetup = false;
		}
	}
	if (clubPlay == true)
	{
		int determiner;
		int cashpool;
		int totalportion;
		double portion1;
		double portion2;
		double portion3;
		int takeaway1;
		int takeaway2;
		int takeaway3;
		generateDice();
		clubStop = new Button(650,475,300,100,35,"Stop");
		clubStop.show();
		decider = clubStop.hover();
		if ((decider == true)&&(mousePressed==true))
		{
			setDice();
			clubGameSetup=true;
			clubPlay=false;
		}
		determiner = diceScore(true);
		if (determiner==1)
		{
			cashpool = currentClub.player1bet;
			totalportion = currentClub.player2bet+currentClub.player3bet+betSizePlayer;
			portion1 = (double)(currentClub.player2bet/totalportion);
			portion2 = (double)(currentClub.player3bet/totalportion);
			portion3 = (double)(betSizePlayer/totalportion);
			takeaway1=(int)(portion1*cashpool);
			takeaway2=(int)(portion2*cashpool);
			takeaway3=(int)(portion3*cashpool);
			currentClub.player1cash = currentClub.player1cash - takeaway1 - takeaway2 - takeaway3;
			;
		}
	}
}
void generateDice()
{
	for(int i=0;i<2;i++)
	{
		for(int j=0;j<3;j++)
		{
			fillerDie=new Die((j*94)+19,(i*125)+75);
			fillerDie.show();
		}
	}
	for(int i=0;i<2;i++)
	{
		for(int j=0;j<3;j++)
		{
			fillerDie=new Die((j*94)+318,(i*125)+75);
			fillerDie.show();
		}
	}
	for(int i=0;i<2;i++)
	{
		for(int j=0;j<3;j++)
		{
			fillerDie=new Die((j*94)+19,(i*125)+375);
			fillerDie.show();
		}
	}
	pud1 = new Die(318,375);
	pud2 = new Die(412,375);
	pud3 = new Die(506,375);
	pud4 = new Die(318,500);
	pud5 = new Die(412,500);
	pud6 = new Die(506,500);
	pud1.show();
	pud2.show();
	pud3.show();
	pud4.show();
	pud5.show();
	pud6.show();
}
void setDice()
{
	p1d1 = new Die(19,75);
	p1d2 = new Die(113,75);
	p1d3 = new Die(207,75);
	p1d4 = new Die(19,200);
	p1d5 = new Die(113,200);
	p1d6 = new Die(207,200);
	p2d1 = new Die(318,75);
	p2d2 = new Die(412,75);
	p2d3 = new Die(506,75);
	p2d4 = new Die(318,200);
	p2d5 = new Die(412,200);
	p2d6 = new Die(506,200);
	p3d1 = new Die(19,375);
	p3d2 = new Die(113,375);
	p3d3 = new Die(207,375);
	p3d4 = new Die(19,500);
	p3d5 = new Die(113,500);
	p3d6 = new Die(207,500);
}
int diceScore(boolean type)
{
	boolean notWinner=false;
	boolean notLoser=false;
	int loop1i;
	int loop1j;
	int loop2i;
	int loop2j;
	int finalScore=0;
	int[] playerScores = new int[4];
	playerScores[0] = p1d1.num()+p1d2.num()+p1d3.num()+p1d4.num()+p1d5.num()+p1d6.num();
	playerScores[1] = p2d1.num()+p2d2.num()+p2d3.num()+p2d4.num()+p2d5.num()+p2d6.num();
	playerScores[2] = p3d1.num()+p3d2.num()+p3d3.num()+p3d4.num()+p3d5.num()+p3d6.num();
	playerScores[3] = pud1.num()+pud2.num()+pud3.num()+pud4.num()+pud5.num()+pud6.num();
	if (type == false)
	{
		for(loop1i=0;loop1i<4;loop1i++)
		{
			for(loop1j=0;loop1j<4;loop1j++)
			{
				if (playerScores[loop1i]<=playerScores[loop1j])
				{
					notWinner=true;
				}
			}
			if (notWinner!=true)
			{
				finalScore+=(loop1i+1);
			}
			notWinner = false;
		}
	}
	if (type == true)
	{
		for(loop2i=0;loop2i<4;loop2i++)
		{
			for(loop2j=0;loop2j<4;loop2j++)
			{
				if (playerScores[loop2i]>=playerScores[loop2j])
				{
					notLoser=true;
				}
			}
			if (notLoser!=true)
			{
				finalScore+=(loop2i+1);
			}
			notLoser = false;
		}
	}
	return finalScore;
}
class Die
{
	int myX;
	int myY;
	int roll;
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
	int num()
	{
		return roll;
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
	int player1cash;
	int player2cash;
	int player3cash;
	int player1bet;
	int player2bet;
	int player3bet;
	Club(String nameofClub, int inputDifficulty,int inputCash)
	{
		name = nameofClub;
		difficulty = inputDifficulty;
		rich = inputCash;
		player1cash = (int)(((Math.random()*3001)+7000)*rich);
		player2cash = (int)(((Math.random()*3001)+4000)*rich);
		player3cash = (int)(((Math.random()*3001)+1000)*rich);
		player1bet = betReturn(player1cash);
		player2bet = betReturn(player2cash);
		player3bet = betReturn(player3cash);
	}
	int betReturn(int cash)
	{
		cash = (int)(cash * ((sq((int)((Math.random()*101)+1)))*0.0001));
		return cash;
	}
}