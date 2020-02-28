
(cl:in-package :asdf)

(defsystem "gps_ros_test-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GpsMyMsg" :depends-on ("_package_GpsMyMsg"))
    (:file "_package_GpsMyMsg" :depends-on ("_package"))
  ))