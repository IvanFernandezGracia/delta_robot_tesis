;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::input_path_l_xyz)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'input_path_l_xyz (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::INPUT_PATH_L_XYZ")
  (make-package "SIMU_VISUAL::INPUT_PATH_L_XYZ"))

(in-package "ROS")
;;//! \htmlinclude input_path_l_xyz.msg.html


(defclass simu_visual::input_path_l_xyz
  :super ros::object
  :slots (_x0 _y0 _z0 _xf _yf _zf _graficar_realtime _idcall ))

(defmethod simu_visual::input_path_l_xyz
  (:init
   (&key
    ((:x0 __x0) 0.0)
    ((:y0 __y0) 0.0)
    ((:z0 __z0) 0.0)
    ((:xf __xf) 0.0)
    ((:yf __yf) 0.0)
    ((:zf __zf) 0.0)
    ((:graficar_realtime __graficar_realtime) nil)
    ((:idcall __idcall) 0)
    )
   (send-super :init)
   (setq _x0 (float __x0))
   (setq _y0 (float __y0))
   (setq _z0 (float __z0))
   (setq _xf (float __xf))
   (setq _yf (float __yf))
   (setq _zf (float __zf))
   (setq _graficar_realtime __graficar_realtime)
   (setq _idcall (round __idcall))
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
  (:xf
   (&optional __xf)
   (if __xf (setq _xf __xf)) _xf)
  (:yf
   (&optional __yf)
   (if __yf (setq _yf __yf)) _yf)
  (:zf
   (&optional __zf)
   (if __zf (setq _zf __zf)) _zf)
  (:graficar_realtime
   (&optional __graficar_realtime)
   (if __graficar_realtime (setq _graficar_realtime __graficar_realtime)) _graficar_realtime)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:serialization-length
   ()
   (+
    ;; float32 _x0
    4
    ;; float32 _y0
    4
    ;; float32 _z0
    4
    ;; float32 _xf
    4
    ;; float32 _yf
    4
    ;; float32 _zf
    4
    ;; bool _graficar_realtime
    1
    ;; int64 _idcall
    8
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
     ;; float32 _xf
       (sys::poke _xf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yf
       (sys::poke _yf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zf
       (sys::poke _zf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _graficar_realtime
       (if _graficar_realtime (write-byte -1 s) (write-byte 0 s))
     ;; int64 _idcall
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _idcall (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _idcall) (= (length (_idcall . bv)) 2)) ;; bignum
              (write-long (ash (elt (_idcall . bv) 0) 0) s)
              (write-long (ash (elt (_idcall . bv) 1) -1) s))
             ((and (class _idcall) (= (length (_idcall . bv)) 1)) ;; big1
              (write-long (elt (_idcall . bv) 0) s)
              (write-long (if (>= _idcall 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _idcall s)(write-long (if (>= _idcall 0) 0 #xffffffff) s)))
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
   ;; float32 _xf
     (setq _xf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yf
     (setq _yf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zf
     (setq _zf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _graficar_realtime
     (setq _graficar_realtime (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _idcall
#+(or :alpha :irix6 :x86_64)
      (setf _idcall (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _idcall (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get simu_visual::input_path_l_xyz :md5sum-) "2d2c1d1e38cec0b4387b2da564ea4c71")
(setf (get simu_visual::input_path_l_xyz :datatype-) "simu_visual/input_path_l_xyz")
(setf (get simu_visual::input_path_l_xyz :definition-)
      "float32 x0
float32 y0
float32 z0
float32 xf
float32 yf
float32 zf
bool graficar_realtime
int64 idcall

")



(provide :simu_visual/input_path_l_xyz "2d2c1d1e38cec0b4387b2da564ea4c71")


