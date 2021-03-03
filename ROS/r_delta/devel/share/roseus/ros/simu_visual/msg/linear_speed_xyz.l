;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::linear_speed_xyz)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'linear_speed_xyz (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::LINEAR_SPEED_XYZ")
  (make-package "SIMU_VISUAL::LINEAR_SPEED_XYZ"))

(in-package "ROS")
;;//! \htmlinclude linear_speed_xyz.msg.html


(defclass simu_visual::linear_speed_xyz
  :super ros::object
  :slots (_xo _yo _zo _xf _yf _zf _vmax _amax _paso1 _paso2 _ls_fin _idcall _num_tray ))

(defmethod simu_visual::linear_speed_xyz
  (:init
   (&key
    ((:xo __xo) 0.0)
    ((:yo __yo) 0.0)
    ((:zo __zo) 0.0)
    ((:xf __xf) 0.0)
    ((:yf __yf) 0.0)
    ((:zf __zf) 0.0)
    ((:vmax __vmax) 0.0)
    ((:amax __amax) 0.0)
    ((:paso1 __paso1) 0)
    ((:paso2 __paso2) 0)
    ((:ls_fin __ls_fin) nil)
    ((:idcall __idcall) 0)
    ((:num_tray __num_tray) 0)
    )
   (send-super :init)
   (setq _xo (float __xo))
   (setq _yo (float __yo))
   (setq _zo (float __zo))
   (setq _xf (float __xf))
   (setq _yf (float __yf))
   (setq _zf (float __zf))
   (setq _vmax (float __vmax))
   (setq _amax (float __amax))
   (setq _paso1 (round __paso1))
   (setq _paso2 (round __paso2))
   (setq _ls_fin __ls_fin)
   (setq _idcall (round __idcall))
   (setq _num_tray (round __num_tray))
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
  (:zf
   (&optional __zf)
   (if __zf (setq _zf __zf)) _zf)
  (:vmax
   (&optional __vmax)
   (if __vmax (setq _vmax __vmax)) _vmax)
  (:amax
   (&optional __amax)
   (if __amax (setq _amax __amax)) _amax)
  (:paso1
   (&optional __paso1)
   (if __paso1 (setq _paso1 __paso1)) _paso1)
  (:paso2
   (&optional __paso2)
   (if __paso2 (setq _paso2 __paso2)) _paso2)
  (:ls_fin
   (&optional __ls_fin)
   (if __ls_fin (setq _ls_fin __ls_fin)) _ls_fin)
  (:idcall
   (&optional __idcall)
   (if __idcall (setq _idcall __idcall)) _idcall)
  (:num_tray
   (&optional __num_tray)
   (if __num_tray (setq _num_tray __num_tray)) _num_tray)
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
    ;; float32 _zf
    4
    ;; float32 _vmax
    4
    ;; float32 _amax
    4
    ;; int64 _paso1
    8
    ;; int64 _paso2
    8
    ;; bool _ls_fin
    1
    ;; int64 _idcall
    8
    ;; int64 _num_tray
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
     ;; float32 _zf
       (sys::poke _zf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vmax
       (sys::poke _vmax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _amax
       (sys::poke _amax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
     ;; bool _ls_fin
       (if _ls_fin (write-byte -1 s) (write-byte 0 s))
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
     ;; int64 _num_tray
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _num_tray (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _num_tray) (= (length (_num_tray . bv)) 2)) ;; bignum
              (write-long (ash (elt (_num_tray . bv) 0) 0) s)
              (write-long (ash (elt (_num_tray . bv) 1) -1) s))
             ((and (class _num_tray) (= (length (_num_tray . bv)) 1)) ;; big1
              (write-long (elt (_num_tray . bv) 0) s)
              (write-long (if (>= _num_tray 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _num_tray s)(write-long (if (>= _num_tray 0) 0 #xffffffff) s)))
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
   ;; float32 _zf
     (setq _zf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vmax
     (setq _vmax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _amax
     (setq _amax (sys::peek buf ptr- :float)) (incf ptr- 4)
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
   ;; bool _ls_fin
     (setq _ls_fin (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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
   ;; int64 _num_tray
#+(or :alpha :irix6 :x86_64)
      (setf _num_tray (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _num_tray (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get simu_visual::linear_speed_xyz :md5sum-) "344d7938d14800189a9f18e5a9b1865b")
(setf (get simu_visual::linear_speed_xyz :datatype-) "simu_visual/linear_speed_xyz")
(setf (get simu_visual::linear_speed_xyz :definition-)
      "float32 xo
float32 yo
float32 zo
float32 xf
float32 yf
float32 zf
float32 vmax
float32 amax
int64 paso1
int64 paso2
bool ls_fin
int64 idcall
int64 num_tray

")



(provide :simu_visual/linear_speed_xyz "344d7938d14800189a9f18e5a9b1865b")


