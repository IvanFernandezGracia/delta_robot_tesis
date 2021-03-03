; Auto-generated. Do not edit!


(cl:in-package simu_visual-msg)


;//! \htmlinclude angulo.msg.html

(cl:defclass <angulo> (roslisp-msg-protocol:ros-message)
  ((theta1
    :reader theta1
    :initarg :theta1
    :type cl:float
    :initform 0.0)
   (theta2
    :reader theta2
    :initarg :theta2
    :type cl:float
    :initform 0.0)
   (theta3
    :reader theta3
    :initarg :theta3
    :type cl:float
    :initform 0.0))
)

(cl:defclass angulo (<angulo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <angulo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'angulo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simu_visual-msg:<angulo> is deprecated: use simu_visual-msg:angulo instead.")))

(cl:ensure-generic-function 'theta1-val :lambda-list '(m))
(cl:defmethod theta1-val ((m <angulo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:theta1-val is deprecated.  Use simu_visual-msg:theta1 instead.")
  (theta1 m))

(cl:ensure-generic-function 'theta2-val :lambda-list '(m))
(cl:defmethod theta2-val ((m <angulo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:theta2-val is deprecated.  Use simu_visual-msg:theta2 instead.")
  (theta2 m))

(cl:ensure-generic-function 'theta3-val :lambda-list '(m))
(cl:defmethod theta3-val ((m <angulo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simu_visual-msg:theta3-val is deprecated.  Use simu_visual-msg:theta3 instead.")
  (theta3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <angulo>) ostream)
  "Serializes a message object of type '<angulo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <angulo>) istream)
  "Deserializes a message object of type '<angulo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<angulo>)))
  "Returns string type for a message object of type '<angulo>"
  "simu_visual/angulo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'angulo)))
  "Returns string type for a message object of type 'angulo"
  "simu_visual/angulo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<angulo>)))
  "Returns md5sum for a message object of type '<angulo>"
  "f6b72178218fbe6abc22ec5b1c7a40d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'angulo)))
  "Returns md5sum for a message object of type 'angulo"
  "f6b72178218fbe6abc22ec5b1c7a40d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<angulo>)))
  "Returns full string definition for message of type '<angulo>"
  (cl:format cl:nil "float32 theta1~%float32 theta2~%float32 theta3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'angulo)))
  "Returns full string definition for message of type 'angulo"
  (cl:format cl:nil "float32 theta1~%float32 theta2~%float32 theta3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <angulo>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <angulo>))
  "Converts a ROS message object to a list"
  (cl:list 'angulo
    (cl:cons ':theta1 (theta1 msg))
    (cl:cons ':theta2 (theta2 msg))
    (cl:cons ':theta3 (theta3 msg))
))
