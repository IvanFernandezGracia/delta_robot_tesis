; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude parameter_ws.msg.html

(cl:defclass <parameter_ws> (roslisp-msg-protocol:ros-message)
  ((graficar_realtime
    :reader graficar_realtime
    :initarg :graficar_realtime
    :type cl:boolean
    :initform cl:nil)
   (step
    :reader step
    :initarg :step
    :type cl:integer
    :initform 0)
   (idcall
    :reader idcall
    :initarg :idcall
    :type cl:integer
    :initform 0))
)

(cl:defclass parameter_ws (<parameter_ws>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parameter_ws>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parameter_ws)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<parameter_ws> is deprecated: use simu_visual-msg:parameter_ws instead.")))

(cl:ensure-generic-function 'graficar_realtime-val :lambda-list '(m))
(cl:defmethod graficar_realtime-val ((m <parameter_ws>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:graficar_realtime-val is deprecated.  Use simu_visual-msg:graficar_realtime instead.")
  (graficar_realtime m))

(cl:ensure-generic-function 'step-val :lambda-list '(m))
(cl:defmethod step-val ((m <parameter_ws>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:step-val is deprecated.  Use simu_visual-msg:step instead.")
  (step m))

(cl:ensure-generic-function 'idcall-val :lambda-list '(m))
(cl:defmethod idcall-val ((m <parameter_ws>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:idcall-val is deprecated.  Use simu_visual-msg:idcall instead.")
  (idcall m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parameter_ws>) ostream)
  "Serializes a message object of type '<parameter_ws>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'graficar_realtime) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'step)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parameter_ws>) istream)
  "Deserializes a message object of type '<parameter_ws>"
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
      (cl:setf (cl:slot-value msg 'step) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parameter_ws>)))
  "Returns string type for a message object of type '<parameter_ws>"
  "simu_visual/parameter_ws")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parameter_ws)))
  "Returns string type for a message object of type 'parameter_ws"
  "simu_visual/parameter_ws")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parameter_ws>)))
  "Returns md5sum for a message object of type '<parameter_ws>"
  "13fef40ddffb08d40623ab9ab34babdd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parameter_ws)))
  "Returns md5sum for a message object of type 'parameter_ws"
  "13fef40ddffb08d40623ab9ab34babdd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parameter_ws>)))
  "Returns full string definition for message of type '<parameter_ws>"
  (cl:format cl:nil "bool graficar_realtime~%int64 step~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parameter_ws)))
  "Returns full string definition for message of type 'parameter_ws"
  (cl:format cl:nil "bool graficar_realtime~%int64 step~%int64 idcall~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parameter_ws>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parameter_ws>))
  "Converts a ROS message object to a list"
  (cl:list 'parameter_ws
    (cl:cons ':graficar_realtime (graficar_realtime msg))
    (cl:cons ':step (step msg))
    (cl:cons ':idcall (idcall msg))
))
