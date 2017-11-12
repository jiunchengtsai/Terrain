#!/usr/bin/env python  
import roslib
roslib.load_manifest('rviz_visual')
import rospy
import tf
import turtlesim.msg
import math
from time import time, sleep
from sensor_msgs.msg import Imu
import tf
from std_msgs.msg import String
from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry
global coun 
coun = 0
def handle_turtle_pose(msg, turtlename):
	global coun 
        br = tf.TransformBroadcaster()
        br.sendTransform((msg.x, msg.y, 0),
                       tf.transformations.quaternion_from_euler(0, 0, msg.theta),
                        rospy.Time.now(),
                       turtlename,
                       "world")
	imuMsg = Imu()
	grad2rad = 3.141592/180.0
	imuMsg.orientation_covariance = [0, 0 , 0,
	0, 0, 0,
	0, 0, 0]
	imuMsg.angular_velocity_covariance = [0, 0 , 0,
	0 , 0, 0,
	0 , 0 , 0]
	imuMsg.linear_acceleration_covariance = [0 , 0 , 0,
	0 , 0, 0,
	0 , 0 , 0]
        q = tf.transformations.quaternion_from_euler(0.0,0.0,msg.theta)
        imuMsg.orientation.x = q[0] 
        imuMsg.orientation.y = q[1]
        imuMsg.orientation.z = q[2]
        imuMsg.orientation.w = q[3]

        imuMsg.angular_velocity.x = 0.0
        imuMsg.angular_velocity.y = 0.0 
        imuMsg.angular_velocity.z = msg.angular_velocity
        imuMsg.linear_acceleration.x = msg.angular_velocity
        imuMsg.linear_acceleration.y = msg.angular_velocity
        imuMsg.linear_acceleration.z = msg.angular_velocity
        imuMsg.header.stamp= rospy.Time.now()
        imuMsg.header.frame_id = 'turtle1'
	coun += 1
	trans = Point()
 	trans.x = msg.x
	trans.y = msg.y
	trans.z = msg.angular_velocity
        #odom.header.stamp = current_time;
  	#trans.header.frame_id = "odom";
        #trans.child_frame_id = "turtle1";
        #trans.pose.pose.position.x = msg.x;
        #trans.pose.pose.position.y = msg.y;
        #trans.pose.pose.position.z = imuMsg.linear_acceleration.z;
        #trans.pose.pose.orientation = q;
	#trans.pose.pose = msg.x, msg.y, imuMsg.linear_acceleration.z, q
	pub.publish(imuMsg)
	pub1.publish(trans)
	#rospy.sleep(1)



if __name__ == '__main__':
     rospy.init_node('turtle_tf_broadcaster')
     turtlename = rospy.get_param('~turtle')
     pub = rospy.Publisher('raw_imu', Imu, queue_size = 1)
     pub1 = rospy.Publisher('world_position', Point, queue_size = 1)
     rospy.Subscriber('/%s/pose' % turtlename,
                      turtlesim.msg.Pose,
                      handle_turtle_pose,
                      turtlename)
     rospy.spin()

