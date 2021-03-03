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

class input_path_l_xyz {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x0 = null;
      this.y0 = null;
      this.z0 = null;
      this.xf = null;
      this.yf = null;
      this.zf = null;
      this.graficar_realtime = null;
      this.idcall = null;
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
      if (initObj.hasOwnProperty('xf')) {
        this.xf = initObj.xf
      }
      else {
        this.xf = 0.0;
      }
      if (initObj.hasOwnProperty('yf')) {
        this.yf = initObj.yf
      }
      else {
        this.yf = 0.0;
      }
      if (initObj.hasOwnProperty('zf')) {
        this.zf = initObj.zf
      }
      else {
        this.zf = 0.0;
      }
      if (initObj.hasOwnProperty('graficar_realtime')) {
        this.graficar_realtime = initObj.graficar_realtime
      }
      else {
        this.graficar_realtime = false;
      }
      if (initObj.hasOwnProperty('idcall')) {
        this.idcall = initObj.idcall
      }
      else {
        this.idcall = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type input_path_l_xyz
    // Serialize message field [x0]
    bufferOffset = _serializer.float32(obj.x0, buffer, bufferOffset);
    // Serialize message field [y0]
    bufferOffset = _serializer.float32(obj.y0, buffer, bufferOffset);
    // Serialize message field [z0]
    bufferOffset = _serializer.float32(obj.z0, buffer, bufferOffset);
    // Serialize message field [xf]
    bufferOffset = _serializer.float32(obj.xf, buffer, bufferOffset);
    // Serialize message field [yf]
    bufferOffset = _serializer.float32(obj.yf, buffer, bufferOffset);
    // Serialize message field [zf]
    bufferOffset = _serializer.float32(obj.zf, buffer, bufferOffset);
    // Serialize message field [graficar_realtime]
    bufferOffset = _serializer.bool(obj.graficar_realtime, buffer, bufferOffset);
    // Serialize message field [idcall]
    bufferOffset = _serializer.int64(obj.idcall, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type input_path_l_xyz
    let len;
    let data = new input_path_l_xyz(null);
    // Deserialize message field [x0]
    data.x0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y0]
    data.y0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z0]
    data.z0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xf]
    data.xf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yf]
    data.yf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zf]
    data.zf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [graficar_realtime]
    data.graficar_realtime = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [idcall]
    data.idcall = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/input_path_l_xyz';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d2c1d1e38cec0b4387b2da564ea4c71';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x0
    float32 y0
    float32 z0
    float32 xf
    float32 yf
    float32 zf
    bool graficar_realtime
    int64 idcall
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new input_path_l_xyz(null);
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

    if (msg.xf !== undefined) {
      resolved.xf = msg.xf;
    }
    else {
      resolved.xf = 0.0
    }

    if (msg.yf !== undefined) {
      resolved.yf = msg.yf;
    }
    else {
      resolved.yf = 0.0
    }

    if (msg.zf !== undefined) {
      resolved.zf = msg.zf;
    }
    else {
      resolved.zf = 0.0
    }

    if (msg.graficar_realtime !== undefined) {
      resolved.graficar_realtime = msg.graficar_realtime;
    }
    else {
      resolved.graficar_realtime = false
    }

    if (msg.idcall !== undefined) {
      resolved.idcall = msg.idcall;
    }
    else {
      resolved.idcall = 0
    }

    return resolved;
    }
};

module.exports = input_path_l_xyz;
