#!/usr/bin/env python
'''
	Sample number = 150 (for 3x3 polygon)
	Error threshold = 0.01
		Error threshold sample number = 10
	
	TODO:
		plt.show the 150 sample data 
		and find the angular accerlation (just use the radian)
'''
'''
	little worry
		global variable is not good 
'''
import rospy
from sensor_msgs.msg import Imu
import tf
import math
global sensor
sensor = []
global original  
global flag
flag = True
def callback(data):
  global flag
  global sensor
  rospy.loginfo(str(flag))
  Euler(data)
  if (flag):
	
  	rospy.loginfo("OK")
  	if (len(sensor) <= 10) :
		if (len(sensor) == 1):
			global original
			original = data.linear_acceleration.z
		sensor.append(data.linear_acceleration.z)
		print len(sensor)
  	else :
		global original
		global flag
		print "AVG~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		avg = float(sum(sensor))/len(sensor)
		error =  float(avg-original)/original
		if (error > 0.01):
			rospy.loginfo("--------------Terrain")
			flag = False	
  		del sensor[:]
  else :
	global flag
	global sensor
	sensor.append(data.linear_acceleration.z)
	rospy.loginfo("data come in")
	rospy.loginfo(str(len(sensor)))
	if (len(sensor) == 150):
		rospy.loginfo("sample complete!!!!")
		avg = float(sum(sensor))/len(sensor)
		print avg
		flag = True
		VotingAnalysis(sensor)
		del sensor[:]
					
	


def VotingAnalysis(sample):
	rospy.loginfo(str(len(sample)))

def Euler(msg): # compute the raw, pitch ,yaw from quanternion
	r,p,y = tf.transformations.euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w])
	

if __name__ == '__main__':
  rospy.init_node('trans', anonymous=True)  

  rospy.Subscriber('/imu/data', Imu, callback)
  rospy.spin()
