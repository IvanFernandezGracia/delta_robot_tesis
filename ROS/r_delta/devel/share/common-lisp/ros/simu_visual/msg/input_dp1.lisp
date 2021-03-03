; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude input_dp1.msg.html

(cl:defclass <input_dp1> (roslisp-msg-protocol:ros-message)
  ((xo
    :reader xo
    :initarg :xo
    :type cl:float
    :initform 0.0)
   (yo
    :reader yo
    :initarg :yo
    :type cl:float
    :initform 0.0)
   (zo
    :reader zo
    :initarg :zo
    :type cl:float
    :initform 0.0)
   (xf
    :reader xf
    :initarg :xf
    :type cl:float
    :initform 0.0)
   (yf
    :reader yf
    :initarg :yf
    :type cl:float
    :initform 0.0)
   (zy
    :reader zy
    :initarg :zy
    :type cl:float
    :initform 0.0)
   (step
    :reader step
    :initarg :step
    :type cl:float
    :initform 0.0)
   (graficar_realtime
    :reader graficar_realtime
    :initarg :graficar_realtime
    :type cl:boolean
    :initform cl:nil)
   (idcall
    :reader idcall
    :initarg :idcall
    :type cl:integer
    :initform 0))
)

(cl:defclass input_dp1 (<input_dp1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <input_dp1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'input_dp1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<input_dp1> is deprecated: use simu_visual-msg:input_dp1 instead.")))

(cl:ensure-generic-function 'xo-val :lambda-list '(m))
(cl:defmethod xo-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:xo-val is deprecated.  Use simu_visual-msg:xo instead.")
  (xo m))

(cl:ensure-generic-function 'yo-val :lambda-list '(m))
(cl:defmethod yo-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:yo-val is deprecated.  Use simu_visual-msg:yo instead.")
  (yo m))

(cl:ensure-generic-function 'zo-val :lambda-list '(m))
(cl:defmethod zo-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:zo-val is deprecated.  Use simu_visual-msg:zo instead.")
  (zo m))

(cl:ensure-generic-function 'xf-val :lambda-list '(m))
(cl:defmethod xf-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:xf-val is deprecated.  Use simu_visual-msg:xf instead.")
  (xf m))

(cl:ensure-generic-function 'yf-val :lambda-list '(m))
(cl:defmethod yf-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:yf-val is deprecated.  Use simu_visual-msg:yf instead.")
  (yf m))

(cl:ensure-generic-function 'zy-val :lambda-list '(m))
(cl:defmethod zy-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:zy-val is deprecated.  Use simu_visual-msg:zy instead.")
  (zy m))

(cl:ensure-generic-function 'step-val :lambda-list '(m))
(cl:defmethod step-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:step-val is deprecated.  Use simu_visual-msg:step instead.")
  (step m))

(cl:ensure-generic-function 'graficar_realtime-val :lambda-list '(m))
(cl:defmethod graficar_realtime-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:graficar_realtime-val is deprecated.  Use simu_visual-msg:graficar_realtime instead.")
  (graficar_realtime m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <input_dp1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <input_dp1>) ostream)
  "Serializes a message object of type '<input_dp1>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'step))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'graficar_realtime) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'idcall)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <input_dp1>) istream)
  "Deserializes a message object of type '<input_dp1>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'step) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'graficar_realtime) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idcall) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<input_dp1>)))
  "Returns string type for a message object of type '<input_dp1>"
  "simu_visual/input_dp1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'input_dp1)))
  "Returns string type for a message object of type 'input_dp1"
  "simu_visual/input_dp1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<input_dp1>)))
  "Returns md5sum for a message object of type '<input_dp1>"
  "d94a0ecc240e2dbc7926bd823ff8f394")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'input_dp1)))
  "Returns md5sum for a message object of type 'input_dp1"
  "d94a0ecc240e2dbc7926bd823ff8f394")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<input_dp1>)))
  "Returns full string definition for message of type '<input_dp1>"
  (cl:format cl:nil "float32 xo~%float32 yo~%float32 zo~%float32 xf~%float32 yf~%float32 zy~%float32 step~%bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'input_dp1)))
  "Returns full string definition for message of type 'input_dp1"
  (cl:format cl:nil "float32 xo~%float32 yo~%float32 zo~%float32 xf~%float32 yf~%float32 zy~%float32 step~%bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <input_dp1>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <input_dp1>))
  "Converts a ROS message object to a list"
  (cl:list 'input_dp1
    (cl:cons ':xo (xo msg))
    (cl:cons ':yo (yo msg))
    (cl:cons ':zo (zo msg))
    (cl:cons ':xf (xf msg))
    (cl:cons ':yf (yf msg))
    (cl:cons ':zy (zy msg))
    (cl:cons ':step (step msg))
    (cl:cons ':graficar_realtime (graficar_realtime msg))
    (cl:cons ':idcall (idcall msg))
))
