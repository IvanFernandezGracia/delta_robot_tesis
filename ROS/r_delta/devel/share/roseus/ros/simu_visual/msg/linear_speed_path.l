;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::linear_speed_path)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'linear_speed_path (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::LINEAR_SPEED_PATH")
  (make-package "SIMU_VISUAL::LINEAR_SPEED_PATH"))

(in-package "ROS")
;;//! \htmlinclude linear_speed_path.msg.html


(defclass simu_visual::linear_speed_path
  :super ros::object
  :slots (_qo _qi _vmax_1 _amax_1 _paso1 _paso2 _ls_run _idcall ))

(defmethod simu_visual::linear_speed_path
  (:init
   (&key
    ((:qo __qo) 0.0)
    ((:qi __qi) 0.0)
    ((:vmax_1 __vmax_1) 0.0)
    ((:amax_1 __amax_1) 0.0)
    ((:paso1 __paso1) 0)
    ((:paso2 __paso2) 0)
    ((:ls_run __ls_run) nil)
    ((:idcall __idcall) 0)
    )
   (send-super :init)
   (setq _qo (float __qo))
   (setq _qi (float __qi))
   (setq _vmax_1 (float __vmax_1))
   (setq _amax_1 (float __amax_1))
   (setq _paso1 (round __paso1))
   (setq _paso2 (round __paso2))
   (setq _ls_run __ls_run)
   (setq _idcall (round __idcall))
   self)
  (:qo
   (&optional __qo)
   (if __qo (setq _qo __qo)) _qo)
  (:qi
   (&optional __qi)
   (if __qi (setq _qi __qi)) _qi)
  (:vmax_1
   (&optional __vmax_1)
   (if __vmax_1 (setq _vmax_1 __vmax_1)) _vmax_1)
  (:amax_1
   (&optional __amax_1)
   (if __amax_1 (setq _amax_1 __amax_1)) _amax_1)
  (:paso1
   (&optional __paso1)
   (if __paso1 (setq _paso1 __paso1)) _paso1)
  (:paso2
   (&optional __paso2)
   (if __paso2 (setq _paso2 __paso2)) _paso2)
  (:ls_run
   (&optional __ls_run)
   (if __ls_run (setq _ls_run __ls_run)) _ls_run)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:serialization-length
   ()
   (+
    ;; float32 _qo
    4
    ;; float32 _qi
    4
    ;; float32 _vmax_1
    4
    ;; float32 _amax_1
    4
    ;; int64 _paso1
    8
    ;; int64 _paso2
    8
    ;; bool _ls_run
    1
    ;; int64 _idcall
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _qo
       (sys::poke _qo (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _qi
       (sys::poke _qi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vmax_1
       (sys::poke _vmax_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _amax_1
       (sys::poke _amax_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int64 _paso1
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _paso1 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _paso1) (= (length (_paso1 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_paso1 . bv) 0) 0) s)
              (write-long (ash (elt (_paso1 . bv) 1) -1) s))
             ((and (class _paso1) (= (length (_paso1 . bv)) 1)) ;; big1
              (write-long (elt (_paso1 . bv) 0) s)
              (write-long (if (>= _paso1 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _paso1 s)(write-long (if (>= _paso1 0) 0 #xffffffff) s)))
     ;; int64 _paso2
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _paso2 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _paso2) (= (length (_paso2 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_paso2 . bv) 0) 0) s)
              (write-long (ash (elt (_paso2 . bv) 1) -1) s))
             ((and (class _paso2) (= (length (_paso2 . bv)) 1)) ;; big1
              (write-long (elt (_paso2 . bv) 0) s)
              (write-long (if (>= _paso2 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _paso2 s)(write-long (if (>= _paso2 0) 0 #xffffffff) s)))
     ;; bool _ls_run
       (if _ls_run (write-byte -1 s) (write-byte 0 s))
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
   ;; float32 _qo
     (setq _qo (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _qi
     (setq _qi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vmax_1
     (setq _vmax_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _amax_1
     (setq _amax_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int64 _paso1
#+(or :alpha :irix6 :x86_64)
      (setf _paso1 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _paso1 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _paso2
#+(or :alpha :irix6 :x86_64)
      (setf _paso2 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _paso2 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _ls_run
     (setq _ls_run (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(setf (get simu_visual::linear_speed_path :md5sum-) "c2b4e4cd669bdd0695c7cea0625007b4")
(setf (get simu_visual::linear_speed_path :datatype-) "simu_visual/linear_speed_path")
(setf (get simu_visual::linear_speed_path :definition-)
      "float32 qo
float32 qi
float32 vmax_1
float32 amax_1
int64 paso1
int64 paso2
bool ls_run
int64 idcall

")



(provide :simu_visual/linear_speed_path "c2b4e4cd669bdd0695c7cea0625007b4")


