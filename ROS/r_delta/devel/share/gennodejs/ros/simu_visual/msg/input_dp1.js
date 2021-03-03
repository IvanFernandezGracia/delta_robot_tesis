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

class input_dp1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xo = null;
      this.yo = null;
      this.zo = null;
      this.xf = null;
      this.yf = null;
      this.zy = null;
      this.step = null;
      this.graficar_realtime = null;
      this.idcall = null;
    }
    else {
      if (initObj.hasOwnProperty('xo')) {
        this.xo = initObj.xo
      }
      else {
        this.xo = 0.0;
      }
      if (initObj.hasOwnProperty('yo')) {
        this.yo = initObj.yo
      }
      else {
        this.yo = 0.0;
      }
      if (initObj.hasOwnProperty('zo')) {
        this.zo = initObj.zo
      }
      else {
        this.zo = 0.0;
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
      if (initObj.hasOwnProperty('zy')) {
        this.zy = initObj.zy
      }
      else {
        this.zy = 0.0;
      }
      if (initObj.hasOwnProperty('step')) {
        this.step = initObj.step
      }
      else {
        this.step = 0.0;
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
    // Serializes a message object of type input_dp1
    // Serialize message field [xo]
    bufferOffset = _serializer.float32(obj.xo, buffer, bufferOffset);
    // Serialize message field [yo]
    bufferOffset = _serializer.float32(obj.yo, buffer, bufferOffset);
    // Serialize message field [zo]
    bufferOffset = _serializer.float32(obj.zo, buffer, bufferOffset);
    // Serialize message field [xf]
    bufferOffset = _serializer.float32(obj.xf, buffer, bufferOffset);
    // Serialize message field [yf]
    bufferOffset = _serializer.float32(obj.yf, buffer, bufferOffset);
    // Serialize message field [zy]
    bufferOffset = _serializer.float32(obj.zy, buffer, bufferOffset);
    // Serialize message field [step]
    bufferOffset = _serializer.float32(obj.step, buffer, bufferOffset);
    // Serialize message field [graficar_realtime]
    bufferOffset = _serializer.bool(obj.graficar_realtime, buffer, bufferOffset);
    // Serialize message field [idcall]
    bufferOffset = _serializer.int64(obj.idcall, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type input_dp1
    let len;
    let data = new input_dp1(null);
    // Deserialize message field [xo]
    data.xo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yo]
    data.yo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zo]
    data.zo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xf]
    data.xf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yf]
    data.yf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zy]
    data.zy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [step]
    data.step = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [graficar_realtime]
    data.graficar_realtime = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [idcall]
    data.idcall = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/input_dp1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd94a0ecc240e2dbc7926bd823ff8f394';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 xo
    float32 yo
    float32 zo
    float32 xf
    float32 yf
    float32 zy
    float32 step
    bool graficar_realtime
    int64 idcall
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new input_dp1(null);
    if (msg.xo !== undefined) {
      resolved.xo = msg.xo;
    }
    else {
      resolved.xo = 0.0
    }

    if (msg.yo !== undefined) {
      resolved.yo = msg.yo;
    }
    else {
      resolved.yo = 0.0
    }

    if (msg.zo !== undefined) {
      resolved.zo = msg.zo;
    }
    else {
      resolved.zo = 0.0
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

    if (msg.zy !== undefined) {
      resolved.zy = msg.zy;
    }
    else {
      resolved.zy = 0.0
    }

    if (msg.step !== undefined) {
      resolved.step = msg.step;
    }
    else {
      resolved.step = 0.0
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

module.exports = input_dp1;
