; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude posicionxyz.msg.html

(cl:defclass <posicionxyz> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0))
)

(cl:defclass posicionxyz (<posicionxyz>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <posicionxyz>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'posicionxyz)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<posicionxyz> is deprecated: use simu_visual-msg:posicionxyz instead.")))

(cl:ensure-generic-function 'x0-val :lambda-list '(m))
(cl:defmethod x0-val ((m <posicionxyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:x0-val is deprecated.  Use simu_visual-msg:x0 instead.")
  (x0 m))

(cl:ensure-generic-function 'y0-val :lambda-list '(m))
(cl:defmethod y0-val ((m <posicionxyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:y0-val is deprecated.  Use simu_visual-msg:y0 instead.")
  (y0 m))

(cl:ensure-generic-function 'z0-val :lambda-list '(m))
(cl:defmethod z0-val ((m <posicionxyz>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:z0-val is deprecated.  Use simu_visual-msg:z0 instead.")
  (z0 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <posicionxyz>) ostream)
  "Serializes a message object of type '<posicionxyz>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <posicionxyz>) istream)
  "Deserializes a message object of type '<posicionxyz>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<posicionxyz>)))
  "Returns string type for a message object of type '<posicionxyz>"
  "simu_visual/posicionxyz")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'posicionxyz)))
  "Returns string type for a message object of type 'posicionxyz"
  "simu_visual/posicionxyz")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<posicionxyz>)))
  "Returns md5sum for a message object of type '<posicionxyz>"
  "aebe032251e0df98b17590e678288e57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'posicionxyz)))
  "Returns md5sum for a message object of type 'posicionxyz"
  "aebe032251e0df98b17590e678288e57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<posicionxyz>)))
  "Returns full string definition for message of type '<posicionxyz>"
  (cl:format cl:nil "float32 x0~%float32 y0~%float32 z0~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'posicionxyz)))
  "Returns full string definition for message of type 'posicionxyz"
  (cl:format cl:nil "float32 x0~%float32 y0~%float32 z0~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <posicionxyz>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <posicionxyz>))
  "Converts a ROS message object to a list"
  (cl:list 'posicionxyz
    (cl:cons ':x0 (x0 msg))
    (cl:cons ':y0 (y0 msg))
    (cl:cons ':z0 (z0 msg))
))
