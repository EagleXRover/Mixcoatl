;; Auto-generated. Do not edit!


(when (boundp 'roboclaw::GpsMyMsg)
  (if (not (find-package "ROBOCLAW"))
    (make-package "ROBOCLAW"))
  (shadow 'GpsMyMsg (find-package "ROBOCLAW")))
(unless (find-package "ROBOCLAW::GPSMYMSG")
  (make-package "ROBOCLAW::GPSMYMSG"))

(in-package "ROS")
;;//! \htmlinclude GpsMyMsg.msg.html


(defclass roboclaw::GpsMyMsg
  :super ros::object
  :slots (_lat _lon _speed _angle _quality _satellites ))

(defmethod roboclaw::GpsMyMsg
  (:init
   (&key
    ((:lat __lat) 0.0)
    ((:lon __lon) 0.0)
    ((:speed __speed) 0.0)
    ((:angle __angle) 0.0)
    ((:quality __quality) 0)
    ((:satellites __satellites) 0)
    )
   (send-super :init)
   (setq _lat (float __lat))
   (setq _lon (float __lon))
   (setq _speed (float __speed))
   (setq _angle (float __angle))
   (setq _quality (round __quality))
   (setq _satellites (round __satellites))
   self)
  (:lat
   (&optional __lat)
   (if __lat (setq _lat __lat)) _lat)
  (:lon
   (&optional __lon)
   (if __lon (setq _lon __lon)) _lon)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:satellites
   (&optional __satellites)
   (if __satellites (setq _satellites __satellites)) _satellites)
  (:serialization-length
   ()
   (+
    ;; float64 _lat
    8
    ;; float64 _lon
    8
    ;; float64 _speed
    8
    ;; float64 _angle
    8
    ;; int32 _quality
    4
    ;; int32 _satellites
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lat
       (sys::poke _lat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lon
       (sys::poke _lon (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _quality
       (write-long _quality s)
     ;; int32 _satellites
       (write-long _satellites s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lat
     (setq _lat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lon
     (setq _lon (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _quality
     (setq _quality (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _satellites
     (setq _satellites (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roboclaw::GpsMyMsg :md5sum-) "88a6598ae0961e760a0b9c9f6312cd3d")
(setf (get roboclaw::GpsMyMsg :datatype-) "roboclaw/GpsMyMsg")
(setf (get roboclaw::GpsMyMsg :definition-)
      "float64 lat
float64 lon
float64 speed
float64 angle
int32 quality
int32 satellites

")



(provide :roboclaw/GpsMyMsg "88a6598ae0961e760a0b9c9f6312cd3d")


