;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::input_dp1)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'input_dp1 (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::INPUT_DP1")
  (make-package "SIMU_VISUAL::INPUT_DP1"))

(in-package "ROS")
;;//! \htmlinclude input_dp1.msg.html


(defclass simu_visual::input_dp1
  :super ros::object
  :slots (_xo _yo _zo _xf _yf _zy _step _graficar_realtime _idcall ))

(defmethod simu_visual::input_dp1
  (:init
   (&key
    ((:xo __xo) 0.0)
    ((:yo __yo) 0.0)
    ((:zo __zo) 0.0)
    ((:xf __xf) 0.0)
    ((:yf __yf) 0.0)
    ((:zy __zy) 0.0)
    ((:step __step) 0.0)
    ((:graficar_realtime __graficar_realtime) nil)
    ((:idcall __idcall) 0)
    )
   (send-super :init)
   (setq _xo (float __xo))
   (setq _yo (float __yo))
   (setq _zo (float __zo))
   (setq _xf (float __xf))
   (setq _yf (float __yf))
   (setq _zy (float __zy))
   (setq _step (float __step))
   (setq _graficar_realtime __graficar_realtime)
   (setq _idcall (round __idcall))
   self)
  (:xo
   (&optional __xo)
   (if __xo (setq _xo __xo)) _xo)
  (:yo
   (&optional __yo)
   (if __yo (setq _yo __yo)) _yo)
  (:zo
   (&optional __zo)
   (if __zo (setq _zo __zo)) _zo)
  (:xf
   (&optional __xf)
   (if __xf (setq _xf __xf)) _xf)
  (:yf
   (&optional __yf)
   (if __yf (setq _yf __yf)) _yf)
  (:zy
   (&optional __zy)
   (if __zy (setq _zy __zy)) _zy)
  (:step
   (&optional __step)
   (if __step (setq _step __step)) _step)
  (:graficar_realtime
   (&optional __graficar_realtime)
   (if __graficar_realtime (setq _graficar_realtime __graficar_realtime)) _graficar_realtime)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:serialization-length
   ()
   (+
    ;; float32 _xo
    4
    ;; float32 _yo
    4
    ;; float32 _zo
    4
    ;; float32 _xf
    4
    ;; float32 _yf
    4
    ;; float32 _zy
    4
    ;; float32 _step
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
     ;; float32 _xo
       (sys::poke _xo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yo
       (sys::poke _yo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zo
       (sys::poke _zo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xf
       (sys::poke _xf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yf
       (sys::poke _yf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zy
       (sys::poke _zy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _step
       (sys::poke _step (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _xo
     (setq _xo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yo
     (setq _yo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zo
     (setq _zo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xf
     (setq _xf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yf
     (setq _yf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zy
     (setq _zy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _step
     (setq _step (sys::peek buf ptr- :float)) (incf ptr- 4)
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

(setf (get simu_visual::input_dp1 :md5sum-) "d94a0ecc240e2dbc7926bd823ff8f394")
(setf (get simu_visual::input_dp1 :datatype-) "simu_visual/input_dp1")
(setf (get simu_visual::input_dp1 :definition-)
      "float32 xo
float32 yo
float32 zo
float32 xf
float32 yf
float32 zy
float32 step
bool graficar_realtime
int64 idcall

")



(provide :simu_visual/input_dp1 "d94a0ecc240e2dbc7926bd823ff8f394")


