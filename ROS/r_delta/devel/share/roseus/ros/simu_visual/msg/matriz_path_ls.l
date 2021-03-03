;; Auto-generated. Do not edit!


(when (boundp 'simu_visual::matriz_path_ls)
  (if (not (find-package "SIMU_VISUAL"))
    (make-package "SIMU_VISUAL"))
  (shadow 'matriz_path_ls (find-package "SIMU_VISUAL")))
(unless (find-package "SIMU_VISUAL::MATRIZ_PATH_LS")
  (make-package "SIMU_VISUAL::MATRIZ_PATH_LS"))

(in-package "ROS")
;;//! \htmlinclude matriz_path_ls.msg.html


(defclass simu_visual::matriz_path_ls
  :super ros::object
  :slots (_permiso _id_call _x _y _z _th1 _th2 _th3 _tiempo ))

(defmethod simu_visual::matriz_path_ls
  (:init
   (&key
    ((:permiso __permiso) nil)
    ((:id_call __id_call) 0)
    ((:x __x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y __y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:z __z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:th1 __th1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:th2 __th2) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:th3 __th3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:tiempo __tiempo) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _permiso __permiso)
   (setq _id_call (round __id_call))
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _th1 __th1)
   (setq _th2 __th2)
   (setq _th3 __th3)
   (setq _tiempo __tiempo)
   self)
  (:permiso
   (&optional __permiso)
   (if __permiso (setq _permiso __permiso)) _permiso)
  (:id_call
   (&optional __id_call)
   (if __id_call (setq _id_call __id_call)) _id_call)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:th1
   (&optional __th1)
   (if __th1 (setq _th1 __th1)) _th1)
  (:th2
   (&optional __th2)
   (if __th2 (setq _th2 __th2)) _th2)
  (:th3
   (&optional __th3)
   (if __th3 (setq _th3 __th3)) _th3)
  (:tiempo
   (&optional __tiempo)
   (if __tiempo (setq _tiempo __tiempo)) _tiempo)
  (:serialization-length
   ()
   (+
    ;; bool _permiso
    1
    ;; int64 _id_call
    8
    ;; float32[] _x
    (* 4    (length _x)) 4
    ;; float32[] _y
    (* 4    (length _y)) 4
    ;; float32[] _z
    (* 4    (length _z)) 4
    ;; float32[] _th1
    (* 4    (length _th1)) 4
    ;; float32[] _th2
    (* 4    (length _th2)) 4
    ;; float32[] _th3
    (* 4    (length _th3)) 4
    ;; float32[] _tiempo
    (* 4    (length _tiempo)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _permiso
       (if _permiso (write-byte -1 s) (write-byte 0 s))
     ;; int64 _id_call
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id_call (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id_call) (= (length (_id_call . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id_call . bv) 0) 0) s)
              (write-long (ash (elt (_id_call . bv) 1) -1) s))
             ((and (class _id_call) (= (length (_id_call . bv)) 1)) ;; big1
              (write-long (elt (_id_call . bv) 0) s)
              (write-long (if (>= _id_call 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id_call s)(write-long (if (>= _id_call 0) 0 #xffffffff) s)))
     ;; float32[] _x
     (write-long (length _x) s)
     (dotimes (i (length _x))
       (sys::poke (elt _x i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _y
     (write-long (length _y) s)
     (dotimes (i (length _y))
       (sys::poke (elt _y i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _z
     (write-long (length _z) s)
     (dotimes (i (length _z))
       (sys::poke (elt _z i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _th1
     (write-long (length _th1) s)
     (dotimes (i (length _th1))
       (sys::poke (elt _th1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _th2
     (write-long (length _th2) s)
     (dotimes (i (length _th2))
       (sys::poke (elt _th2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _th3
     (write-long (length _th3) s)
     (dotimes (i (length _th3))
       (sys::poke (elt _th3 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _tiempo
     (write-long (length _tiempo) s)
     (dotimes (i (length _tiempo))
       (sys::poke (elt _tiempo i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _permiso
     (setq _permiso (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _id_call
#+(or :alpha :irix6 :x86_64)
      (setf _id_call (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id_call (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _z i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _th1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _th1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _th1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _th2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _th2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _th2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _th3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _th3 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _th3 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _tiempo
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tiempo (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tiempo i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get simu_visual::matriz_path_ls :md5sum-) "cb8abae6b50409fef1dc6dbabd6fe786")
(setf (get simu_visual::matriz_path_ls :datatype-) "simu_visual/matriz_path_ls")
(setf (get simu_visual::matriz_path_ls :definition-)
      "bool permiso
int64 id_call
float32[] x
float32[] y
float32[] z
float32[] th1
float32[] th2
float32[] th3
float32[] tiempo

")



(provide :simu_visual/matriz_path_ls "cb8abae6b50409fef1dc6dbabd6fe786")


