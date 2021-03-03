; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude linear_speed_xyz.msg.html

(cl:defclass <linear_speed_xyz> (roslisp-msg-protocol:ros-message)
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
   (zf
    :reader zf
    :initarg :zf
    :type cl:float
    :initform 0.0)
   (vmax
    :reader vmax
    :initarg :vmax
    :type cl:float
    :initform 0.0)
   (amax
    :reader amax
    :initarg :amax
    :type cl:float
    :initform 0.0)
   (paso1
    :reader paso1
    :initarg :paso1
    :type cl:integer
    :initform 0)
   (paso2
    :reader paso2
    :initarg :paso2
    :type cl:integer
    :initform 0)
   (ls_fin
    :reader ls_fin
    :initarg :ls_fin
    :type cl:boolean
    :initform cl:nil)
   (idcall
    :reader idcall
    :initarg :idcall
    :type cl:integer
    :initform 0)
   (num_tray
    :reader num_tray
    :initarg :num_tray
    :type cl:integer
    :initform 0))
)

(cl:defclass linear_speed_xyz (<linear_speed_xyz>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <linear_speed_xyz>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'linear_speed_xyz)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<linear_speed_xyz> is deprecated: use simu_visual-msg:linear_speed_xyz instead.")))

(cl:ensure-generic-function 'xo-val :lambda-list '(m))
(cl:defmethod xo-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:xo-val is deprecated.  Use simu_visual-msg:xo instead.")
  (xo m))

(cl:ensure-generic-function 'yo-val :lambda-list '(m))
(cl:defmethod yo-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:yo-val is deprecated.  Use simu_visual-msg:yo instead.")
  (yo m))

(cl:ensure-generic-function 'zo-val :lambda-list '(m))
(cl:defmethod zo-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:zo-val is deprecated.  Use simu_visual-msg:zo instead.")
  (zo m))

(cl:ensure-generic-function 'xf-val :lambda-list '(m))
(cl:defmethod xf-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:xf-val is deprecated.  Use simu_visual-msg:xf instead.")
  (xf m))

(cl:ensure-generic-function 'yf-val :lambda-list '(m))
(cl:defmethod yf-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:yf-val is deprecated.  Use simu_visual-msg:yf instead.")
  (yf m))

(cl:ensure-generic-function 'zf-val :lambda-list '(m))
(cl:defmethod zf-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:zf-val is deprecated.  Use simu_visual-msg:zf instead.")
  (zf m))

(cl:ensure-generic-function 'vmax-val :lambda-list '(m))
(cl:defmethod vmax-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:vmax-val is deprecated.  Use simu_visual-msg:vmax instead.")
  (vmax m))

(cl:ensure-generic-function 'amax-val :lambda-list '(m))
(cl:defmethod amax-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:amax-val is deprecated.  Use simu_visual-msg:amax instead.")
  (amax m))

(cl:ensure-generic-function 'paso1-val :lambda-list '(m))
(cl:defmethod paso1-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:paso1-val is deprecated.  Use simu_visual-msg:paso1 instead.")
  (paso1 m))

(cl:ensure-generic-function 'paso2-val :lambda-list '(m))
(cl:defmethod paso2-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:paso2-val is deprecated.  Use simu_visual-msg:paso2 instead.")
  (paso2 m))

(cl:ensure-generic-function 'ls_fin-val :lambda-list '(m))
(cl:defmethod ls_fin-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:ls_fin-val is deprecated.  Use simu_visual-msg:ls_fin instead.")
  (ls_fin m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))

(cl:ensure-generic-function 'num_tray-val :lambda-list '(m))
(cl:defmethod num_tray-val ((m <linear_speed_xyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:num_tray-val is deprecated.  Use simu_visual-msg:num_tray instead.")
  (num_tray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <linear_speed_xyz>) ostream)
  "Serializes a message object of type '<linear_speed_xyz>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vmax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'amax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'paso1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'paso2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ls_fin) 1 0)) ostream)
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
  (cl:let* ((signed (cl:slot-value msg 'num_tray)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <linear_speed_xyz>) istream)
  "Deserializes a message object of type '<linear_speed_xyz>"
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
    (cl:setf (cl:slot-value msg 'zf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vmax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'amax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'paso1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'paso2) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:slot-value msg 'ls_fin) (cl:not (cl:zerop (cl:read-byte istream))))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_tray) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<linear_speed_xyz>)))
  "Returns string type for a message object of type '<linear_speed_xyz>"
  "simu_visual/linear_speed_xyz")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'linear_speed_xyz)))
  "Returns string type for a message object of type 'linear_speed_xyz"
  "simu_visual/linear_speed_xyz")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<linear_speed_xyz>)))
  "Returns md5sum for a message object of type '<linear_speed_xyz>"
  "344d7938d14800189a9f18e5a9b1865b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'linear_speed_xyz)))
  "Returns md5sum for a message object of type 'linear_speed_xyz"
  "344d7938d14800189a9f18e5a9b1865b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<linear_speed_xyz>)))
  "Returns full string definition for message of type '<linear_speed_xyz>"
  (cl:format cl:nil "float32 xo~%float32 yo~%float32 zo~%float32 xf~%float32 yf~%float32 zf~%float32 vmax~%float32 amax~%int64 paso1~%int64 paso2~%bool ls_fin~%int64 idcall~%int64 num_tray~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'linear_speed_xyz)))
  "Returns full string definition for message of type 'linear_speed_xyz"
  (cl:format cl:nil "float32 xo~%float32 yo~%float32 zo~%float32 xf~%float32 yf~%float32 zf~%float32 vmax~%float32 amax~%int64 paso1~%int64 paso2~%bool ls_fin~%int64 idcall~%int64 num_tray~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <linear_speed_xyz>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     8
     8
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <linear_speed_xyz>))
  "Converts a ROS message object to a list"
  (cl:list 'linear_speed_xyz
    (cl:cons ':xo (xo msg))
    (cl:cons ':yo (yo msg))
    (cl:cons ':zo (zo msg))
    (cl:cons ':xf (xf msg))
    (cl:cons ':yf (yf msg))
    (cl:cons ':zf (zf msg))
    (cl:cons ':vmax (vmax msg))
    (cl:cons ':amax (amax msg))
    (cl:cons ':paso1 (paso1 msg))
    (cl:cons ':paso2 (paso2 msg))
    (cl:cons ':ls_fin (ls_fin msg))
    (cl:cons ':idcall (idcall msg))
    (cl:cons ':num_tray (num_tray msg))
))
