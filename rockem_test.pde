RockemProtocol rockem;
boolean[] keys = new boolean[526];

void setup() {
  rockem = new RockemProtocol(1);
  size(100,100);
}

void draw() {
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

  println(rockem);
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