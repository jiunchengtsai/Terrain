#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <iostream>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Point.h>
// %EndTag(INCLUDES)%

int count = 0;
class SubscribeAndPublish
{
public:
  SubscribeAndPublish()
  {
    //Topic you want to publish
    marker_pub = marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
    //Topic you want to subscribe
    sub = n.subscribe("world_position", 1, &SubscribeAndPublish::callback, this);
   // ros::Rate r(1);

  }

  void callback(const geometry_msgs::Point& msg)
  {

 
    visualization_msgs::Marker marker;
    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "/world";
    marker.header.stamp = ros::Time::now();


    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
// %Tag(NS_ID)%
    marker.ns = "basic_shapes";
    marker.id = count;
// %EndTag(NS_ID)%

    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
// %Tag(TYPE)%
    marker.type = visualization_msgs::Marker::ARROW;
// %EndTag(TYPE)%

    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
// %Tag(ACTION)%
    marker.action = visualization_msgs::Marker::ADD;
// %EndTag(ACTION)%

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
// %Tag(POSE)%
    marker.pose.position.x = msg.x;
    marker.pose.position.y = msg.y;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0;
    marker.pose.orientation.y = -1.0;
    marker.pose.orientation.z = 0;
    marker.pose.orientation.w = 1;
// %EndTag(POSE)%

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
// %Tag(SCALE)%
    marker.scale.x = 1.0;
    marker.scale.y = 0.1;
    marker.scale.z = 0.1;
// %EndTag(SCALE)%

    // Set the color -- be sure to set alpha to something non-zero!
// %Tag(COLOR)%
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;
// %EndTag(COLOR)%
    //count++;

    //marker.lifetime = ros::Duration(60);


/*
    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return ;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }
*/
    if (time == 150) {

	std::cout << SubscribeAndPublish::time;
    	marker_pub.publish(marker);
    	count++;
	time = 0;
        //ros::Duration(0.5).sleep(); // sleep for half a second
    }
    //r.sleep();
     time ++;
     
  }
 

private:
  ros::NodeHandle n;
  ros::Publisher marker_pub ;
  ros::Subscriber sub ;
  static int time;

};//End of class SubscribeAndPublish
int SubscribeAndPublish::time = 0;
// %Tag(INIT)%

int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  SubscribeAndPublish SAPObject;
 // uint32_t shape = visualization_msgs::Marker::CUBE;
  ros::spin();
  return 0;

}

