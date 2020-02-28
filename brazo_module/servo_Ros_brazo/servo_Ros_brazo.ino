/* Programa de prueba servos ROS
 * 
 */
#include <ros.h>
#include <sensor_msgs/Joy.h>
#include <Servo.h>

ros::NodeHandle  nh;
sensor_msgs::Joy msg;

Servo myservo;  // crea el primer servo
Servo myservo2; // crea el segundo servo

float gripper;
float muneca;
int gripperPos = 60;
int gripperPosMaximo = 65;
int gripperPosMinimo = 10;

int munecaPos = 65;
int munecaPosMaximo = 150;
int munecaPosMinimo = 5;

void servos_cb(const sensor_msgs::Joy& data)
  {
  gripper= data.axes[6];                //  L and R buttons
  muneca = data.axes[7];                //  Up and Down Buttons
  }

ros::Subscriber <sensor_msgs::Joy> joy("joy", &servos_cb);     //declaro el subscriptor 

void setup() {
  myservo.attach(9);
  myservo2.attach(10);
  myservo.write(gripperPos);
  myservo2.write(munecaPos);
  
  nh.initNode();
  nh.subscribe(joy);          // me sucribo al nodo
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
}

void loop() {  
  if  ( (gripper == 1 ) && (gripper !=-1  )) {       //servo gripper
    if(gripperPos<gripperPosMaximo){
      gripperPos++;
      delay(1.5);
    }
    delay(1.5);
  }
  if  ( (gripper == -1 ) && (gripper != 1)) {
    if(gripperPos>gripperPosMinimo){
      gripperPos--;
      delay(1.5);
    }
    delay(1.5);
  }


  ///////////////////////////////////////////////////////////

  if  ( (muneca  == 1 ) && (muneca  != -1  )) {       //servo muneca
    if(munecaPos<munecaPosMaximo){
      munecaPos++;
          delay(1.5);
    }
          delay(1.5);
  }
  if  ( (muneca  == -1 ) && (muneca  != 1 ) )    {
    if(munecaPos>munecaPosMinimo){
      munecaPos--;
          delay(1.5);
    }
          delay(1.5);
  }

 ////////////////////////////////////////////////////////////
  myservo2.write(munecaPos);
  myservo.write(gripperPos);
  nh.spinOnce();
  delay(1);
}
