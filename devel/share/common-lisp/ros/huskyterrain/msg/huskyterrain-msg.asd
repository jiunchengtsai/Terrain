
(cl:in-package :asdf)

(defsystem "huskyterrain-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "imutrans" :depends-on ("_package_imutrans"))
    (:file "_package_imutrans" :depends-on ("_package"))
    (:file "view_poly" :depends-on ("_package_view_poly"))
    (:file "_package_view_poly" :depends-on ("_package"))
    (:file "pcl_polygon" :depends-on ("_package_pcl_polygon"))
    (:file "_package_pcl_polygon" :depends-on ("_package"))
  ))