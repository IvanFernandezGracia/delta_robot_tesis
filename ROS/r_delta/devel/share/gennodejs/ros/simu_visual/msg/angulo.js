// Auto-generated. Do not edit!

// (in-package simu_visual.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class angulo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.theta1 = null;
      this.theta2 = null;
      this.theta3 = null;
    }
    else {
      if (initObj.hasOwnProperty('theta1')) {
        this.theta1 = initObj.theta1
      }
      else {
        this.theta1 = 0.0;
      }
      if (initObj.hasOwnProperty('theta2')) {
        this.theta2 = initObj.theta2
      }
      else {
        this.theta2 = 0.0;
      }
      if (initObj.hasOwnProperty('theta3')) {
        this.theta3 = initObj.theta3
      }
      else {
        this.theta3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type angulo
    // Serialize message field [theta1]
    bufferOffset = _serializer.float32(obj.theta1, buffer, bufferOffset);
    // Serialize message field [theta2]
    bufferOffset = _serializer.float32(obj.theta2, buffer, bufferOffset);
    // Serialize message field [theta3]
    bufferOffset = _serializer.float32(obj.theta3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type angulo
    let len;
    let data = new angulo(null);
    // Deserialize message field [theta1]
    data.theta1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta2]
    data.theta2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta3]
    data.theta3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/angulo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6b72178218fbe6abc22ec5b1c7a40d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 theta1
    float32 theta2
    float32 theta3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new angulo(null);
    if (msg.theta1 !== undefined) {
      resolved.theta1 = msg.theta1;
    }
    else {
      resolved.theta1 = 0.0
    }

    if (msg.theta2 !== undefined) {
      resolved.theta2 = msg.theta2;
    }
    else {
      resolved.theta2 = 0.0
    }

    if (msg.theta3 !== undefined) {
      resolved.theta3 = msg.theta3;
    }
    else {
      resolved.theta3 = 0.0
    }

    return resolved;
    }
};

module.exports = angulo;
