#include <ros/ros.h>
// PCL specific includes
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/ros/conversions.h>
#include <pcl/point_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/point_cloud.h>   
#include <pcl/kdtree/kdtree_flann.h> 
#include <pcl/PCLPointCloud2.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <iostream>
#include <vector>
#include <ctime>
#include <visualization_msgs/Marker.h>
#include <tf/transform_listener.h>
#include "pcl_ros/impl/transforms.hpp"
#include	<pcl/visualization/cloud_viewer.h>
ros::Publisher pub;
ros::Publisher vis_pub;
size_t count = 154879;




class block {

public:
  block() //: viewer("Cloud	Viewer") 
  {



    // Create a ROS subscriber for the input point cloud
     sub = nh.subscribe ("/camera/depth/points", 1, &block::cloud_cb, this);

    
    pub = nh.advertise<sensor_msgs::PointCloud2> ("cluster", 1);
    
    //viewer_timer=nh.createTimer(ros::Duration(0.1),&block::timerCB,this);
    
  }


void  cloud_cb (const sensor_msgs::PointCloud2& input)
{


  tf_listener.waitForTransform("/odom", "/camera_frame_optical", ros::Time(0), ros::Duration(10.0));
  sensor_msgs::PointCloud2 temp;
  pcl_ros::transformPointCloud("/odom", input, temp, tf_listener);
  pcl::PointCloud<pcl::PointXYZ>cloud;
  pcl::fromROSMsg(temp,cloud);
  //viewer.showCloud(cloud.makeShared());
  pub.publish(temp);


}
/*
	void	timerCB(const	ros::TimerEvent&)
	{
		if	(viewer.wasStopped())
		{
									ros::shutdown();
		}
	}
*/
private :
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher pub ;
    // pcl::visualization::CloudViewer	viewer;
   // ros::Timer	viewer_timer;
    // Spin
    tf::TransformListener tf_listener; 
};
 int main (int argc, char** argv)
  {
// Initialize ROS
    ros::init (argc, argv, "catcher");

    //ros::Rate rate(0.01);
    block cc;
    ros::spin ();
}
