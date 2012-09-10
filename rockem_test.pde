import processing.serial.*; 

RockemProtocol rockemPlayerOne;
RockemProtocol rockemPlayerTwo;
boolean[] keys = new boolean[65536];

Serial playerOnePort; 
Serial playerTwoPort; 

void setup() {
  size(100,100);
  // This sadly has to be changed on each machine. For mine, it's the 5th port, on another it may be different. Check and update
  println(Serial.list()); 
  playerOnePort = new Serial(this, Serial.list()[4], 9600); 
  //playerTwoPort = new Serial(this, Serial.list()[6], 9600); 
}

void draw() {
  rockemPlayerOne = new RockemProtocol(0);
  rockemPlayerTwo = new RockemProtocol(1);
  
  if(checkKey('a')) {
    rockemPlayerOne.moveLeft();
  }

  if (checkKey('s')){
    rockemPlayerOne.moveBackward();  
  }

  if (checkKey('d')){
    rockemPlayerOne.moveRight();
  }

  if (checkKey('w')){
    rockemPlayerOne.moveForward();
  }

  if (checkKey('q')){
    rockemPlayerOne.punchLeft();
  }

  if (checkKey('e')){
    rockemPlayerOne.punchRight();
  }
  
  if (checkKey('j')) {
    rockemPlayerTwo.moveLeft();
  }

  if (checkKey('k')){
    rockemPlayerTwo.moveBackward();  
  }

  if (checkKey('l')){
    rockemPlayerTwo.moveRight();
  }

  if (checkKey('i')){
    rockemPlayerTwo.moveForward();
  }

  if (checkKey('u')){
    rockemPlayerTwo.punchLeft();
  }

  if (checkKey('p')){
    rockemPlayerTwo.punchRight();
  }
  
 
  playerOnePort.write(rockemPlayerOne.toString());
  //playerTwoPort.write(rockemPlayerTwo.toString());    
  println(rockemPlayerOne.toString());
  //println(rockemPlayerTwo.toString());
}

boolean checkKey(int k) {
  if (keys.length >= k) {
    return keys[k];  
  }
  return false;
}

void keyPressed() {
  keys[key] = true;
}

void keyReleased() { 
  keys[key] = false; 
}