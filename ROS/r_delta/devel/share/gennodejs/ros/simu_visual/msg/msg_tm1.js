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

class msg_tm1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.graficar_realtime = null;
      this.idcall = null;
    }
    else {
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
    // Serializes a message object of type msg_tm1
    // Serialize message field [graficar_realtime]
    bufferOffset = _serializer.bool(obj.graficar_realtime, buffer, bufferOffset);
    // Serialize message field [idcall]
    bufferOffset = _serializer.int64(obj.idcall, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type msg_tm1
    let len;
    let data = new msg_tm1(null);
    // Deserialize message field [graficar_realtime]
    data.graficar_realtime = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [idcall]
    data.idcall = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/msg_tm1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3ecf0f7d8bacd9f1e9e670a95987c060';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool graficar_realtime
    int64 idcall
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new msg_tm1(null);
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

module.exports = msg_tm1;
