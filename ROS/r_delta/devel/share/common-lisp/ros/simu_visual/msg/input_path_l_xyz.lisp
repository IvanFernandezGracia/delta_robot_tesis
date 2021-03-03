; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude input_path_l_xyz.msg.html

(cl:defclass <input_path_l_xyz> (roslisp-msg-protocol:ros-message)
  ((x0
    :reader x0
    :initarg :x0
    :type cl:float
    :initform 0.0)
   (y0
    :reader y0
    :initarg :y0
    :type cl:float
    :initform 0.0)
   (z0
    :reader z0
    :initarg :z0
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
   (zf
    :reader zf
    :initarg :zf
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

(cl:defclass input_path_l_xyz (<input_path_l_xyz>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <input_path_l_xyz>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'input_path_l_xyz)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<input_path_l_xyz> is deprecated: use simu_visual-msg:input_path_l_xyz instead.")))

(cl:ensure-generic-function 'x0-val :lambda-list '(m))
(cl:defmethod x0-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:x0-val is deprecated.  Use simu_visual-msg:x0 instead.")
  (x0 m))

(cl:ensure-generic-function 'y0-val :lambda-list '(m))
(cl:defmethod y0-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:y0-val is deprecated.  Use simu_visual-msg:y0 instead.")
  (y0 m))

(cl:ensure-generic-function 'z0-val :lambda-list '(m))
(cl:defmethod z0-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:z0-val is deprecated.  Use simu_visual-msg:z0 instead.")
  (z0 m))

(cl:ensure-generic-function 'xf-val :lambda-list '(m))
(cl:defmethod xf-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:xf-val is deprecated.  Use simu_visual-msg:xf instead.")
  (xf m))

(cl:ensure-generic-function 'yf-val :lambda-list '(m))
(cl:defmethod yf-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:yf-val is deprecated.  Use simu_visual-msg:yf instead.")
  (yf m))

(cl:ensure-generic-function 'zf-val :lambda-list '(m))
(cl:defmethod zf-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:zf-val is deprecated.  Use simu_visual-msg:zf instead.")
  (zf m))

(cl:ensure-generic-function 'graficar_realtime-val :lambda-list '(m))
(cl:defmethod graficar_realtime-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:graficar_realtime-val is deprecated.  Use simu_visual-msg:graficar_realtime instead.")
  (graficar_realtime m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <input_path_l_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <input_path_l_xyz>) ostream)
  "Serializes a message object of type '<input_path_l_xyz>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z0))))
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zf))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <input_path_l_xyz>) istream)
  "Deserializes a message object of type '<input_path_l_xyz>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z0) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'zf) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<input_path_l_xyz>)))
  "Returns string type for a message object of type '<input_path_l_xyz>"
  "simu_visual/input_path_l_xyz")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'input_path_l_xyz)))
  "Returns string type for a message object of type 'input_path_l_xyz"
  "simu_visual/input_path_l_xyz")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<input_path_l_xyz>)))
  "Returns md5sum for a message object of type '<input_path_l_xyz>"
  "2d2c1d1e38cec0b4387b2da564ea4c71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'input_path_l_xyz)))
  "Returns md5sum for a message object of type 'input_path_l_xyz"
  "2d2c1d1e38cec0b4387b2da564ea4c71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<input_path_l_xyz>)))
  "Returns full string definition for message of type '<input_path_l_xyz>"
  (cl:format cl:nil "float32 x0~%float32 y0~%float32 z0~%float32 xf~%float32 yf~%float32 zf~%bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'input_path_l_xyz)))
  "Returns full string definition for message of type 'input_path_l_xyz"
  (cl:format cl:nil "float32 x0~%float32 y0~%float32 z0~%float32 xf~%float32 yf~%float32 zf~%bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <input_path_l_xyz>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <input_path_l_xyz>))
  "Converts a ROS message object to a list"
  (cl:list 'input_path_l_xyz
    (cl:cons ':x0 (x0 msg))
    (cl:cons ':y0 (y0 msg))
    (cl:cons ':z0 (z0 msg))
    (cl:cons ':xf (xf msg))
    (cl:cons ':yf (yf msg))
    (cl:cons ':zf (zf msg))
    (cl:cons ':graficar_realtime (graficar_realtime msg))
    (cl:cons ':idcall (idcall msg))
))
