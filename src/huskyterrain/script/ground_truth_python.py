#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
import math
import threading
import tf
import numpy as np
from huskyterrain.msg import imutrans

def callback(data):
  rospy.loginfo("angularz"+str(data.angular_acceleration.z))
  rospy.loginfo("angulary"+str(data.angular_acceleration.y))
  rospy.loginfo("angularx"+str(data.angular_acceleration.x))
  rospy.loginfo("orientationz"+str(data.pose.orientation.z ))
  rospy.loginfo("orientationy"+str(data.pose.orientation.y ))
  rospy.loginfo("orientationx"+str(data.pose.orientation.x ))
  rospy.loginfo("coory"+str(data.coory.data ))
  rospy.loginfo("coorx"+str(data.coorx.data ))
 

def listener():
  rospy.init_node('listener', anonymous=True)  
  rospy.Subscriber('/duckiemap_ground_truth', imutrans, callback)


if __name__ == '__main__':
  listener()
  rospy.spin();
