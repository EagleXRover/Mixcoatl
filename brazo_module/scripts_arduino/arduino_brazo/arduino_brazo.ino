/* Programa de prueba servos ROS
 * 
 */
#include <ros.h>
#include <sensor_msgs/Joy.h>
#include <Servo.h>

ros::NodeHandle  nh;
sensor_msgs::Joy msg;


Servo myservo;  // crea el objeto servo
float gripper;
float gripper2;
int pos = 90;

void servos_cb(const sensor_msgs::Joy& data)
  {
  gripper= data.axes[2];                //LT
  gripper2 = data.axes[5];              //RT
  }

ros::Subscriber <sensor_msgs::Joy> joy("joy", &servos_cb);     //declaro el subscriptor 

void setup() {
  myservo.attach(9);
  myservo.write(90);
  nh.initNode();
  nh.subscribe(joy);          // me sucribo al nodo
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
}

void loop() {  
  if  ( (gripper2 < -0.8) && (gripper > -0.8 )) {
    digitalWrite(LED_BUILTIN, HIGH);
    if(pos<181){
      pos++;
      delay(2.5);
    }
    delay(1);
  }
  if  ( (gripper < -0.8 ) && (gripper2 > -0.8) )    {
      digitalWrite(LED_BUILTIN, LOW);
    if(pos>0){
      pos--;
      delay(2.5);
    }
    delay(1);
  }
  myservo.write(pos);
  nh.spinOnce();
  delay(1);
}