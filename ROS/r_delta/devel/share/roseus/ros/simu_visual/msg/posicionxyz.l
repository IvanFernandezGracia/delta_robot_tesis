;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::posicionxyz)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'posicionxyz (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::POSICIONXYZ")
  (make-package "SIMU_VISUAL::POSICIONXYZ"))

(in-package "ROS")
;;//! \htmlinclude posicionxyz.msg.html


(defclass simu_visual::posicionxyz
  :super ros::object
  :slots (_x0 _y0 _z0 ))

(defmethod simu_visual::posicionxyz
  (:init
   (&key
    ((:x0 __x0) 0.0)
    ((:y0 __y0) 0.0)
    ((:z0 __z0) 0.0)
    )
   (send-super :init)
   (setq _x0 (float __x0))
   (setq _y0 (float __y0))
   (setq _z0 (float __z0))
   self)
  (:x0
   (&optional __x0)
   (if __x0 (setq _x0 __x0)) _x0)
  (:y0
   (&optional __y0)
   (if __y0 (setq _y0 __y0)) _y0)
  (:z0
   (&optional __z0)
   (if __z0 (setq _z0 __z0)) _z0)
  (:serialization-length
   ()
   (+
    ;; float32 _x0
    4
    ;; float32 _y0
    4
    ;; float32 _z0
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x0
       (sys::poke _x0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y0
       (sys::poke _y0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z0
       (sys::poke _z0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x0
     (setq _x0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y0
     (setq _y0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z0
     (setq _z0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get simu_visual::posicionxyz :md5sum-) "aebe032251e0df98b17590e678288e57")
(setf (get simu_visual::posicionxyz :datatype-) "simu_visual/posicionxyz")
(setf (get simu_visual::posicionxyz :definition-)
      "float32 x0
float32 y0
float32 z0

")



(provide :simu_visual/posicionxyz "aebe032251e0df98b17590e678288e57")


