;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::parameter_ws)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'parameter_ws (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::PARAMETER_WS")
  (make-package "SIMU_VISUAL::PARAMETER_WS"))

(in-package "ROS")
;;//! \htmlinclude parameter_ws.msg.html


(defclass simu_visual::parameter_ws
  :super ros::object
  :slots (_graficar_realtime _step _idcall ))

(defmethod simu_visual::parameter_ws
  (:init
   (&key
    ((:graficar_realtime __graficar_realtime) nil)
    ((:step __step) 0)
    ((:idcall __idcall) 0)
    )
   (send-super :init)
   (setq _graficar_realtime __graficar_realtime)
   (setq _step (round __step))
   (setq _idcall (round __idcall))
   self)
  (:graficar_realtime
   (&optional __graficar_realtime)
   (if __graficar_realtime (setq _graficar_realtime __graficar_realtime)) _graficar_realtime)
  (:step
   (&optional __step)
   (if __step (setq _step __step)) _step)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:serialization-length
   ()
   (+
    ;; bool _graficar_realtime
    1
    ;; int64 _step
    8
    ;; int64 _idcall
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _graficar_realtime
       (if _graficar_realtime (write-byte -1 s) (write-byte 0 s))
     ;; int64 _step
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _step (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _step) (= (length (_step . bv)) 2)) ;; bignum
              (write-long (ash (elt (_step . bv) 0) 0) s)
              (write-long (ash (elt (_step . bv) 1) -1) s))
             ((and (class _step) (= (length (_step . bv)) 1)) ;; big1
              (write-long (elt (_step . bv) 0) s)
              (write-long (if (>= _step 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _step s)(write-long (if (>= _step 0) 0 #xffffffff) s)))
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
   ;; bool _graficar_realtime
     (setq _graficar_realtime (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _step
#+(or :alpha :irix6 :x86_64)
      (setf _step (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _step (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
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

(setf (get simu_visual::parameter_ws :md5sum-) "13fef40ddffb08d40623ab9ab34babdd")
(setf (get simu_visual::parameter_ws :datatype-) "simu_visual/parameter_ws")
(setf (get simu_visual::parameter_ws :definition-)
      "bool graficar_realtime
int64 step
int64 idcall

")



(provide :simu_visual/parameter_ws "13fef40ddffb08d40623ab9ab34babdd")


