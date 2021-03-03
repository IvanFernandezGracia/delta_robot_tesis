; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude msg_tm1.msg.html

(cl:defclass <msg_tm1> (roslisp-msg-protocol:ros-message)
  ((graficar_realtime
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

(cl:defclass msg_tm1 (<msg_tm1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <msg_tm1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'msg_tm1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<msg_tm1> is deprecated: use simu_visual-msg:msg_tm1 instead.")))

(cl:ensure-generic-function 'graficar_realtime-val :lambda-list '(m))
(cl:defmethod graficar_realtime-val ((m <msg_tm1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:graficar_realtime-val is deprecated.  Use simu_visual-msg:graficar_realtime instead.")
  (graficar_realtime m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <msg_tm1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <msg_tm1>) ostream)
  "Serializes a message object of type '<msg_tm1>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <msg_tm1>) istream)
  "Deserializes a message object of type '<msg_tm1>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<msg_tm1>)))
  "Returns string type for a message object of type '<msg_tm1>"
  "simu_visual/msg_tm1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'msg_tm1)))
  "Returns string type for a message object of type 'msg_tm1"
  "simu_visual/msg_tm1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<msg_tm1>)))
  "Returns md5sum for a message object of type '<msg_tm1>"
  "3ecf0f7d8bacd9f1e9e670a95987c060")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'msg_tm1)))
  "Returns md5sum for a message object of type 'msg_tm1"
  "3ecf0f7d8bacd9f1e9e670a95987c060")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<msg_tm1>)))
  "Returns full string definition for message of type '<msg_tm1>"
  (cl:format cl:nil "bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'msg_tm1)))
  "Returns full string definition for message of type 'msg_tm1"
  (cl:format cl:nil "bool graficar_realtime~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <msg_tm1>))
  (cl:+ 0
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <msg_tm1>))
  "Converts a ROS message object to a list"
  (cl:list 'msg_tm1
    (cl:cons ':graficar_realtime (graficar_realtime msg))
    (cl:cons ':idcall (idcall msg))
))
