; Auto-generated. Do not edit!


(cl:in-package huskyterrain-msg)


;//! \htmlinclude view_poly.msg.html

(cl:defclass <view_poly> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pointcloud
    :reader pointcloud
    :initarg :pointcloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (coorx
    :reader coorx
    :initarg :coorx
    :type (cl:vector cl:float)
   :initform (cl:make-array 30 :element-type 'cl:float :initial-element 0.0))
   (coory
    :reader coory
    :initarg :coory
    :type (cl:vector cl:float)
   :initform (cl:make-array 30 :element-type 'cl:float :initial-element 0.0))
   (id
    :reader id
    :initarg :id
    :type (cl:vector cl:integer)
   :initform (cl:make-array 30 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass view_poly (<view_poly>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <view_poly>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'view_poly)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name huskyterrain-msg:<view_poly> is deprecated: use huskyterrain-msg:view_poly instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <view_poly>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader huskyterrain-msg:header-val is deprecated.  Use huskyterrain-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pointcloud-val :lambda-list '(m))
(cl:defmethod pointcloud-val ((m <view_poly>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader huskyterrain-msg:pointcloud-val is deprecated.  Use huskyterrain-msg:pointcloud instead.")
  (pointcloud m))

(cl:ensure-generic-function 'coorx-val :lambda-list '(m))
(cl:defmethod coorx-val ((m <view_poly>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader huskyterrain-msg:coorx-val is deprecated.  Use huskyterrain-msg:coorx instead.")
  (coorx m))

(cl:ensure-generic-function 'coory-val :lambda-list '(m))
(cl:defmethod coory-val ((m <view_poly>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader huskyterrain-msg:coory-val is deprecated.  Use huskyterrain-msg:coory instead.")
  (coory m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <view_poly>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader huskyterrain-msg:id-val is deprecated.  Use huskyterrain-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <view_poly>) ostream)
  "Serializes a message object of type '<view_poly>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointcloud) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'coorx))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'coory))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <view_poly>) istream)
  "Deserializes a message object of type '<view_poly>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointcloud) istream)
  (cl:setf (cl:slot-value msg 'coorx) (cl:make-array 30))
  (cl:let ((vals (cl:slot-value msg 'coorx)))
    (cl:dotimes (i 30)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'coory) (cl:make-array 30))
  (cl:let ((vals (cl:slot-value msg 'coory)))
    (cl:dotimes (i 30)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'id) (cl:make-array 30))
  (cl:let ((vals (cl:slot-value msg 'id)))
    (cl:dotimes (i 30)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<view_poly>)))
  "Returns string type for a message object of type '<view_poly>"
  "huskyterrain/view_poly")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'view_poly)))
  "Returns string type for a message object of type 'view_poly"
  "huskyterrain/view_poly")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<view_poly>)))
  "Returns md5sum for a message object of type '<view_poly>"
  "3e5e6be4258eabd9727fb48bf28593dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'view_poly)))
  "Returns md5sum for a message object of type 'view_poly"
  "3e5e6be4258eabd9727fb48bf28593dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<view_poly>)))
  "Returns full string definition for message of type '<view_poly>"
  (cl:format cl:nil "Header header~%sensor_msgs/PointCloud2 pointcloud~%float32[30] coorx~%float32[30] coory~%int32[30] id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'view_poly)))
  "Returns full string definition for message of type 'view_poly"
  (cl:format cl:nil "Header header~%sensor_msgs/PointCloud2 pointcloud~%float32[30] coorx~%float32[30] coory~%int32[30] id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <view_poly>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointcloud))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'coorx) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'coory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <view_poly>))
  "Converts a ROS message object to a list"
  (cl:list 'view_poly
    (cl:cons ':header (header msg))
    (cl:cons ':pointcloud (pointcloud msg))
    (cl:cons ':coorx (coorx msg))
    (cl:cons ':coory (coory msg))
    (cl:cons ':id (id msg))
))
