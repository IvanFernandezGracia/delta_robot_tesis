; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude linear_speed_path.msg.html

(cl:defclass <linear_speed_path> (roslisp-msg-protocol:ros-message)
  ((qo
    :reader qo
    :initarg :qo
    :type cl:float
    :initform 0.0)
   (qi
    :reader qi
    :initarg :qi
    :type cl:float
    :initform 0.0)
   (vmax_1
    :reader vmax_1
    :initarg :vmax_1
    :type cl:float
    :initform 0.0)
   (amax_1
    :reader amax_1
    :initarg :amax_1
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
   (ls_run
    :reader ls_run
    :initarg :ls_run
    :type cl:boolean
    :initform cl:nil)
   (idcall
    :reader idcall
    :initarg :idcall
    :type cl:integer
    :initform 0))
)

(cl:defclass linear_speed_path (<linear_speed_path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <linear_speed_path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'linear_speed_path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<linear_speed_path> is deprecated: use simu_visual-msg:linear_speed_path instead.")))

(cl:ensure-generic-function 'qo-val :lambda-list '(m))
(cl:defmethod qo-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:qo-val is deprecated.  Use simu_visual-msg:qo instead.")
  (qo m))

(cl:ensure-generic-function 'qi-val :lambda-list '(m))
(cl:defmethod qi-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:qi-val is deprecated.  Use simu_visual-msg:qi instead.")
  (qi m))

(cl:ensure-generic-function 'vmax_1-val :lambda-list '(m))
(cl:defmethod vmax_1-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:vmax_1-val is deprecated.  Use simu_visual-msg:vmax_1 instead.")
  (vmax_1 m))

(cl:ensure-generic-function 'amax_1-val :lambda-list '(m))
(cl:defmethod amax_1-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:amax_1-val is deprecated.  Use simu_visual-msg:amax_1 instead.")
  (amax_1 m))

(cl:ensure-generic-function 'paso1-val :lambda-list '(m))
(cl:defmethod paso1-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:paso1-val is deprecated.  Use simu_visual-msg:paso1 instead.")
  (paso1 m))

(cl:ensure-generic-function 'paso2-val :lambda-list '(m))
(cl:defmethod paso2-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:paso2-val is deprecated.  Use simu_visual-msg:paso2 instead.")
  (paso2 m))

(cl:ensure-generic-function 'ls_run-val :lambda-list '(m))
(cl:defmethod ls_run-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:ls_run-val is deprecated.  Use simu_visual-msg:ls_run instead.")
  (ls_run m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <linear_speed_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <linear_speed_path>) ostream)
  "Serializes a message object of type '<linear_speed_path>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'qi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vmax_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'amax_1))))
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ls_run) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <linear_speed_path>) istream)
  "Deserializes a message object of type '<linear_speed_path>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qo) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'qi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vmax_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'amax_1) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'ls_run) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<linear_speed_path>)))
  "Returns string type for a message object of type '<linear_speed_path>"
  "simu_visual/linear_speed_path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'linear_speed_path)))
  "Returns string type for a message object of type 'linear_speed_path"
  "simu_visual/linear_speed_path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<linear_speed_path>)))
  "Returns md5sum for a message object of type '<linear_speed_path>"
  "c2b4e4cd669bdd0695c7cea0625007b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'linear_speed_path)))
  "Returns md5sum for a message object of type 'linear_speed_path"
  "c2b4e4cd669bdd0695c7cea0625007b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<linear_speed_path>)))
  "Returns full string definition for message of type '<linear_speed_path>"
  (cl:format cl:nil "float32 qo~%float32 qi~%float32 vmax_1~%float32 amax_1~%int64 paso1~%int64 paso2~%bool ls_run~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'linear_speed_path)))
  "Returns full string definition for message of type 'linear_speed_path"
  (cl:format cl:nil "float32 qo~%float32 qi~%float32 vmax_1~%float32 amax_1~%int64 paso1~%int64 paso2~%bool ls_run~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <linear_speed_path>))
  (cl:+ 0
     4
     4
     4
     4
     8
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <linear_speed_path>))
  "Converts a ROS message object to a list"
  (cl:list 'linear_speed_path
    (cl:cons ':qo (qo msg))
    (cl:cons ':qi (qi msg))
    (cl:cons ':vmax_1 (vmax_1 msg))
    (cl:cons ':amax_1 (amax_1 msg))
    (cl:cons ':paso1 (paso1 msg))
    (cl:cons ':paso2 (paso2 msg))
    (cl:cons ':ls_run (ls_run msg))
    (cl:cons ':idcall (idcall msg))
))
