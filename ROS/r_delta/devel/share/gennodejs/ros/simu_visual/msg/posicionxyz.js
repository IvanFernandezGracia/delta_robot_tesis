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

class posicionxyz {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x0 = null;
      this.y0 = null;
      this.z0 = null;
    }
    else {
      if (initObj.hasOwnProperty('x0')) {
        this.x0 = initObj.x0
      }
      else {
        this.x0 = 0.0;
      }
      if (initObj.hasOwnProperty('y0')) {
        this.y0 = initObj.y0
      }
      else {
        this.y0 = 0.0;
      }
      if (initObj.hasOwnProperty('z0')) {
        this.z0 = initObj.z0
      }
      else {
        this.z0 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type posicionxyz
    // Serialize message field [x0]
    bufferOffset = _serializer.float32(obj.x0, buffer, bufferOffset);
    // Serialize message field [y0]
    bufferOffset = _serializer.float32(obj.y0, buffer, bufferOffset);
    // Serialize message field [z0]
    bufferOffset = _serializer.float32(obj.z0, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type posicionxyz
    let len;
    let data = new posicionxyz(null);
    // Deserialize message field [x0]
    data.x0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y0]
    data.y0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z0]
    data.z0 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/posicionxyz';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aebe032251e0df98b17590e678288e57';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x0
    float32 y0
    float32 z0
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new posicionxyz(null);
    if (msg.x0 !== undefined) {
      resolved.x0 = msg.x0;
    }
    else {
      resolved.x0 = 0.0
    }

    if (msg.y0 !== undefined) {
      resolved.y0 = msg.y0;
    }
    else {
      resolved.y0 = 0.0
    }

    if (msg.z0 !== undefined) {
      resolved.z0 = msg.z0;
    }
    else {
      resolved.z0 = 0.0
    }

    return resolved;
    }
};

module.exports = posicionxyz;
