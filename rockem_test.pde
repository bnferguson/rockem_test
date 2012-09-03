import processing.serial.*; 

RockemProtocol rockem;
boolean[] keys = new boolean[526];

Serial port; 

void setup() {
  size(100,100);

  // This sadly has to be changed on each machine. For mine, it's the 5th port, on another it may be different. Check and update
  println(Serial.list()); 
  port = new Serial(this, Serial.list()[4], 9600); 
}

void draw() {
  rockem = new RockemProtocol(1);
  
  if(checkKey('a')) {
    rockem.moveLeft();
  }

  if (checkKey('s')){
    rockem.moveBackward();  
  }

  if (checkKey('d')){
    rockem.moveRight();
  }

  if (checkKey('w')){
    rockem.moveForward();
  }

  if (checkKey('j')){
    rockem.punchLeft();
  }

  if (checkKey('k')){
    rockem.punchRight();
  }
  
  String output = rockem.toString();
  port.write(output.getBytes());     
  println(output);
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