;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::msg_tm1)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'msg_tm1 (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::MSG_TM1")
  (make-package "SIMU_VISUAL::MSG_TM1"))

(in-package "ROS")
;;//! \htmlinclude msg_tm1.msg.html


(defclass simu_visual::msg_tm1
  :super ros::object
  :slots (_graficar_realtime _idcall ))

(defmethod simu_visual::msg_tm1
  (:init
   (&key
    ((:graficar_realtime __graficar_realtime) nil)
    ((:idcall __idcall) 0)
    )
   (send-super :init)
   (setq _graficar_realtime __graficar_realtime)
   (setq _idcall (round __idcall))
   self)
  (:graficar_realtime
   (&optional __graficar_realtime)
   (if __graficar_realtime (setq _graficar_realtime __graficar_realtime)) _graficar_realtime)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:serialization-length
   ()
   (+
    ;; bool _graficar_realtime
    1
    ;; int64 _idcall
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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

(setf (get simu_visual::msg_tm1 :md5sum-) "3ecf0f7d8bacd9f1e9e670a95987c060")
(setf (get simu_visual::msg_tm1 :datatype-) "simu_visual/msg_tm1")
(setf (get simu_visual::msg_tm1 :definition-)
      "bool graficar_realtime
int64 idcall

")



(provide :simu_visual/msg_tm1 "3ecf0f7d8bacd9f1e9e670a95987c060")


