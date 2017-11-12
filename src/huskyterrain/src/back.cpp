#include <ros/ros.h>
// PCL specific includes
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/ros/conversions.h>
#include <pcl/point_types.h>
#include <pcl/io/io.h>
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
ros::Publisher pub;
ros::Publisher vis_pub;
size_t count = 154879;

void
transformAsMatrix (const tf::Transform& bt, Eigen::Matrix4f &out_mat)
{
  double mv[12];
  bt.getBasis ().getOpenGLSubMatrix (mv);

  tf::Vector3 origin = bt.getOrigin ();

  out_mat (0, 0) = mv[0]; out_mat (0, 1) = mv[4]; out_mat (0, 2) = mv[8];
  out_mat (1, 0) = mv[1]; out_mat (1, 1) = mv[5]; out_mat (1, 2) = mv[9];
  out_mat (2, 0) = mv[2]; out_mat (2, 1) = mv[6]; out_mat (2, 2) = mv[10];
                                                                     
  out_mat (3, 0) = out_mat (3, 1) = out_mat (3, 2) = 0; out_mat (3, 3) = 1;
  out_mat (0, 3) = origin.x ();
  out_mat (1, 3) = origin.y ();
  out_mat (2, 3) = origin.z ();
}
bool
transformPointCloud (const std::string &target_frame, const sensor_msgs::PointCloud2 &in, sensor_msgs::PointCloud2 &out, const tf::TransformListener &tf_listener)
{
  if (in.header.frame_id == target_frame)
  {
    out = in;
    return (true);
  }

  // Get the TF transform
  tf::StampedTransform transform;
  try
  {
    tf_listener.lookupTransform (target_frame, in.header.frame_id, ros::Time(0), transform);
  }
  catch (tf::LookupException &e)
  {
    ROS_ERROR ("%s", e.what ());
    return (false);
  }
  catch (tf::ExtrapolationException &e)
  {
    ROS_ERROR ("%s", e.what ());
    return (false);
  }

  // Convert the TF transform to Eigen format
  Eigen::Matrix4f eigen_transform;
  transformAsMatrix (transform, eigen_transform);

  transformPointCloud (eigen_transform, in, out);

  out.header.frame_id = target_frame;
  return (true);
}

class block {

public:
  block() {



    // Create a ROS subscriber for the input point cloud
     sub = nh.subscribe ("/camera/depth/points", 1, &block::cloud_cb, this);

     vis_pub = nh.advertise<visualization_msgs::Marker>( "visualization_marker", 1);

     // Create a ROS publisher for the output model coefficients
    //pub = nh.advertise<pcl_msgs::ModelCoefficients> ("output", 1);
    pub = nh.advertise<sensor_msgs::PointCloud2> ("cluster", 1);
    
  }

//void  cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
void  cloud_cb (const sensor_msgs::PointCloud2& input)
{
   ros::Time t = ros::Time(0);
  // Convert the sensor_msgs/PointCloud2 data to pcl/PointCloud
  //pcl::PointCloud<pcl::PointXYZ> cloud;
  //pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
  //pcl::fromROSMsg (*input, *cloud);
  //pcl_conversions::toPCL(*input, *cloud);

  sensor_msgs::PointCloud2 temp;
  transformPointCloud("odom",input,temp,tf_listener);


  pcl::PCLPointCloud2 pcl_pc2;
  //pcl_conversions::toPCL(*input,pcl_pc2);  
  pcl_conversions::toPCL(temp,pcl_pc2); 
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromPCLPointCloud2(pcl_pc2,*cloud);  
  //pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
  //tf_listener_.waitForTransform("odom", cloudtf.header.frame_id,
  //cloudtf.header.stamp, ros::Duration(1.0));
  //pcl_ros::transformPointCloud("odom",*cloudtf,*cloud,tf_listener); 	
/*
  pcl::KdTreeFLANN<pcl::PointXYZ> kdtree;

  kdtree.setInputCloud (cloud);
  //std::cout << cloud->points[count].x << cloud->points[count].y << cloud->points[count].z << std::endl;
	//count++;
 // std::cout << "size is " << cloud->size() << std::endl;
  pcl::PointXYZ searchPoint;
  searchPoint.x = 1.0;
  searchPoint.y = 1.0;
  searchPoint.z = -1.0;
  //1024.0f * rand () / (RAND_MAX + 1.0f);

  int K = 10;

  std::vector<int> pointIdxNKNSearch(K);      
  std::vector<float> pointNKNSquaredDistance(K); 

  //std::cout << "K nearest neighbor search at (" << searchPoint.x 
    //        << " " << searchPoint.y 
      //      << " " << searchPoint.z
        //    << ") with K=" << K << std::endl;

 // if ( kdtree.nearestKSearch (searchPoint, K, pointIdxNKNSearch, pointNKNSquaredDistance) > 0 ) 
 // {
 //   
    //for (size_t i = 0; i < pointIdxNKNSearch.size (); ++i)
      //std::cout << "    "  <<   cloud->points[ pointIdxNKNSearch[i] ].x 
          //      << " " << cloud->points[ pointIdxNKNSearch[i] ].y 
          //   << " " << cloud->points[ pointIdxNKNSearch[i] ].z 
         //      << " (squared distance: " << pointNKNSquaredDistance[i] << ")" << std::endl;
//  }
//

  std::vector<int> pointIdxRadiusSearch;           
  std::vector<float> pointRadiusSquaredDistance;   

  float radius = 1;
  
  //td::cout << "Neighbors within radius search at (" << searchPoint.x 
        //   << " " << searchPoint.y 
       //   << " " << searchPoint.z
        //  << ") with radius=" << radius << std::endl;

visualization_msgs::Marker marker;
  if ( kdtree.radiusSearch (searchPoint, radius, pointIdxRadiusSearch, pointRadiusSquaredDistance) > 0 ) 
  {
	for (size_t i = 0; i < pointIdxRadiusSearch.size (); ++i) {
                  std::cout << "    "  <<   cloud->points[ pointIdxRadiusSearch[i] ].x 
               << " " << cloud->points[ pointIdxRadiusSearch[i] ].y 
              << " " << cloud->points[ pointIdxRadiusSearch[i] ].z 
              << " (squared distance: " << pointRadiusSquaredDistance[i] << ")" << std::endl;
	}
  }
*/
/*
marker.header.frame_id = "odom";
marker.header.stamp = ros::Time();
marker.ns = "my_namespace";
marker.id = 0;
marker.type = visualization_msgs::Marker::SPHERE;
marker.action = visualization_msgs::Marker::ADD;

marker.pose.orientation.x = 0.0;
marker.pose.orientation.y = 0.0;
marker.pose.orientation.z = 0.0;
marker.pose.orientation.w = 1.0;
		marker.pose.position.x =2.0 ;
		marker.pose.position.y = 0.0 ;
		marker.pose.position.z =0.0 ;
marker.scale.x = 1;
marker.scale.y = 0.1;
marker.scale.z = 0.1;
marker.color.a = 1.0; // Don't forget to set the alpha!
marker.color.r = 0.0;
marker.color.g = 1.0;
marker.color.b = 0.0;
//only if using a MESH_RESOURCE marker type:
//marker.mesh_resource = "package://pr2_description/meshes/base_v0/base.dae";
vis_pub.publish( marker );
*/
/*
  pcl::ModelCoefficients coefficients;
  pcl::PointIndices inliers;
  // Create the segmentation object
  pcl::SACSegmentation<pcl::PointXYZ> seg;
  // Optional
  seg.setOptimizeCoefficients (true);
  // Mandatory
  seg.setModelType (pcl::SACMODEL_PLANE);
  seg.setMethodType (pcl::SAC_RANSAC);
  seg.setDistanceThreshold (0.01);

  seg.setInputCloud (cloud.makeShared ());
  seg.segment (inliers, coefficients); 
  
  // Publish the model coefficients
  pcl_msgs::ModelCoefficients ros_coefficients;
  pcl_conversions::fromPCL(coefficients, ros_coefficients);
  pub.publish (ros_coefficients);
*/

}

private :
    ros::NodeHandle nh;

    
    ros::Subscriber sub;

    ros::Publisher vis_pub ;

// Create a ROS publisher for the output model coefficients
    //pub = nh.advertise<pcl_msgs::ModelCoefficients> ("output", 1);
    ros::Publisher pub ;
    // Spin
    tf::TransformListener tf_listener; 
};
 int main (int argc, char** argv)
  {
// Initialize ROS
    ros::init (argc, argv, "cluster");

    //ros::Rate rate(0.01);
    block cc;
    ros::spin ();
}


