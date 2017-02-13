import processing.serial.*;

Serial myPort;  // Create object from Serial class
byte[] buff;     // Data received from the serial port
char c;

void setup(){
  size(128, 300);
  background(0);
  stroke(128);
  colorMode(HSB);
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 115200);
  
  buff = new byte[512];
}

void draw(){
  background(0);
  int b = 0;
  
  if ( myPort.available() > 0) {  // If data is available,
    myPort.readBytesUntil(10, buff);
  }
  
  int x = 0;
  
  for (int i = 0; i<128; i++) {
    b = buff[i];
    b = (b < 0) ? b + 255 : b;
    line(x , height, x, height - b);
    x++;
    buff[i] = 0;
  }
   
  //stroke(c, 256, 128);
  //if (c++ > 255) c = 0;
}