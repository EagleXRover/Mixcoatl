#!/usr/bin/env python

PACKAGE = 'ball_tracker'
import roslib;roslib.load_manifest(PACKAGE)
import rospy
import numpy as np
import cv2
from visualization_msgs.msg import Marker
from sensor_msgs.msg import Image
from geometry_msgs.msg import Vector3
from cv_bridge import CvBridge, CvBridgeError

import dynamic_reconfigure.client

lg = [0, 0, 0]
ug = [0, 0, 0]


def callback(config):

	global lg
	global ug

	hL = config['h_lower']
	sL = config['s_lower']
	vL = config['v_lower']

	hU = config['h_upper']
	sU = config['s_upper']
	vU = config['v_upper']

	lg = [int(hL), int(sL), int(vL)]
	ug = [int(hU), int(sU), int(vU)]

def publisher():

	global lg
	global ug

	rospy.init_node("ball_tracker_node")
	rospy.wait_for_service("/ball_tracker_server/set_parameters")
	
	client = dynamic_reconfigure.client.Client("ball_tracker_server", timeout=30, config_callback=callback)


	imgPub = rospy.Publisher('ballImg', Image, queue_size = 1)
	posPub = rospy.Publisher('ballPosition', Vector3, queue_size = 1)
	markerPub=rospy.Publisher('visualization_maker', Marker, queue_size = 1)     

	bridge = CvBridge()

	cap = cv2.VideoCapture(1)
	cap.set(3, 660)
	cap.set(4, 480)

	msg = Vector3()

	rate = rospy.Rate(60)
	
	marker=Marker()

	while not rospy.is_shutdown():
		
		msg.x = 0
		msg.y = 0
		msg.z = 0		

		ret, frame = cap.read()
		h, w = frame.shape[:2]
		blurred = cv2.GaussianBlur(frame, (11,11), 0)
		hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)

		lower_green = np.array(lg)
		upper_green = np.array(ug)

		mask = cv2.inRange(hsv, lower_green, upper_green)

		mask = cv2.erode(mask, None, iterations = 2)
		mask = cv2.dilate(mask, None, iterations = 2)

		(_, cnts, _) = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

		#cv2.drawContours(frame, cnts, -1, (0, 255, 0), 3)
		cv2.line(frame, (0, 160), (660, 160), (255, 0, 0), 3)
		cv2.line(frame, (0, 320), (660, 320), (255, 0, 0), 3)
		cv2.line(frame, (220, 0), (220, 480), (255, 0, 0), 3)
		cv2.line(frame, (440, 0), (440, 480), (255, 0, 0), 3)

		if len(cnts) > 0:
		
			c = max(cnts, key = cv2.contourArea)
			((x, y), radius) = cv2.minEnclosingCircle(c)
			
			if (radius > 15):
				#cv2.circle(frame, (int(x), int(y)), int(radius), (0, 255, 255), 2)
				#cv2.circle(frame, (int(x), int(y)), 5, (0, 0, 255), -1)

				offset = 20
			
				cv2.rectangle(frame,(int(x - radius - offset), int(y - radius - offset)),(int(x + radius + offset), int(y + radius + offset)),(0,255,0),3)
				cv2.rectangle(frame,(int(x - radius - offset - 2), int(y - radius - 15 - offset)),(int(x + 70), int(y - radius - offset)),(0,255,0),-1)

				#
				diameter = radius * 2
				dist = round(56 / (diameter), 2)

				font = cv2.FONT_HERSHEY_PLAIN
				text = 'Ball! ' + str(dist) + 'm'
    				cv2.putText(frame, text, (int(x - radius - offset), int(y - radius - offset)), font, 1,(255,255,255),2,cv2.LINE_AA)

				

				if (diameter < 100):
					msg.x = 1
			
				if (x < 220):
					msg.y = -1
				elif (x > 440):
					msg.y = 1

				if (y < 160):
					msg.z = 1
				elif (y > 360):
					msg.z = -1

				marker.header.frame_id="/zed_center"
				marker.type = marker.SPHERE
				marker.action=marker.ADD
				marker.scale.x=0.062
				marker.scale.y=0.062
				marker.scale.z=0.062
				marker.color.a=1.0
				marker.color.g=1.0
				marker.pose.orientation.w=1.0
				marker.pose.position.x=dist
				marker.pose.position.y=((w/4)-x)*(6.2/radius*2)
				marker.pose.position.z=((h/2)-y)*(6.2/radius*2)
				marker.lifetime.secs=0.01

			else:
				marker.action=marker.DELETE

		posPub.publish(msg)

		
		try:
			imgPub.publish(bridge.cv2_to_imgmsg(frame, "bgr8"))
		except CvBridgeError as e:
			print(e)

		rate.sleep()

	cap.release()
	cv2.destroyAllWindows()


if __name__ == '__main__':
	
	try:
		publisher()
	except rospy.ROSInterruptException:
		pass

