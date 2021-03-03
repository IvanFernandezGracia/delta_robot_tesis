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

class linear_speed_path {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.qo = null;
      this.qi = null;
      this.vmax_1 = null;
      this.amax_1 = null;
      this.paso1 = null;
      this.paso2 = null;
      this.ls_run = null;
      this.idcall = null;
    }
    else {
      if (initObj.hasOwnProperty('qo')) {
        this.qo = initObj.qo
      }
      else {
        this.qo = 0.0;
      }
      if (initObj.hasOwnProperty('qi')) {
        this.qi = initObj.qi
      }
      else {
        this.qi = 0.0;
      }
      if (initObj.hasOwnProperty('vmax_1')) {
        this.vmax_1 = initObj.vmax_1
      }
      else {
        this.vmax_1 = 0.0;
      }
      if (initObj.hasOwnProperty('amax_1')) {
        this.amax_1 = initObj.amax_1
      }
      else {
        this.amax_1 = 0.0;
      }
      if (initObj.hasOwnProperty('paso1')) {
        this.paso1 = initObj.paso1
      }
      else {
        this.paso1 = 0;
      }
      if (initObj.hasOwnProperty('paso2')) {
        this.paso2 = initObj.paso2
      }
      else {
        this.paso2 = 0;
      }
      if (initObj.hasOwnProperty('ls_run')) {
        this.ls_run = initObj.ls_run
      }
      else {
        this.ls_run = false;
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
    // Serializes a message object of type linear_speed_path
    // Serialize message field [qo]
    bufferOffset = _serializer.float32(obj.qo, buffer, bufferOffset);
    // Serialize message field [qi]
    bufferOffset = _serializer.float32(obj.qi, buffer, bufferOffset);
    // Serialize message field [vmax_1]
    bufferOffset = _serializer.float32(obj.vmax_1, buffer, bufferOffset);
    // Serialize message field [amax_1]
    bufferOffset = _serializer.float32(obj.amax_1, buffer, bufferOffset);
    // Serialize message field [paso1]
    bufferOffset = _serializer.int64(obj.paso1, buffer, bufferOffset);
    // Serialize message field [paso2]
    bufferOffset = _serializer.int64(obj.paso2, buffer, bufferOffset);
    // Serialize message field [ls_run]
    bufferOffset = _serializer.bool(obj.ls_run, buffer, bufferOffset);
    // Serialize message field [idcall]
    bufferOffset = _serializer.int64(obj.idcall, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type linear_speed_path
    let len;
    let data = new linear_speed_path(null);
    // Deserialize message field [qo]
    data.qo = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [qi]
    data.qi = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vmax_1]
    data.vmax_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [amax_1]
    data.amax_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [paso1]
    data.paso1 = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [paso2]
    data.paso2 = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ls_run]
    data.ls_run = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [idcall]
    data.idcall = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/linear_speed_path';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c2b4e4cd669bdd0695c7cea0625007b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 qo
    float32 qi
    float32 vmax_1
    float32 amax_1
    int64 paso1
    int64 paso2
    bool ls_run
    int64 idcall
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new linear_speed_path(null);
    if (msg.qo !== undefined) {
      resolved.qo = msg.qo;
    }
    else {
      resolved.qo = 0.0
    }

    if (msg.qi !== undefined) {
      resolved.qi = msg.qi;
    }
    else {
      resolved.qi = 0.0
    }

    if (msg.vmax_1 !== undefined) {
      resolved.vmax_1 = msg.vmax_1;
    }
    else {
      resolved.vmax_1 = 0.0
    }

    if (msg.amax_1 !== undefined) {
      resolved.amax_1 = msg.amax_1;
    }
    else {
      resolved.amax_1 = 0.0
    }

    if (msg.paso1 !== undefined) {
      resolved.paso1 = msg.paso1;
    }
    else {
      resolved.paso1 = 0
    }

    if (msg.paso2 !== undefined) {
      resolved.paso2 = msg.paso2;
    }
    else {
      resolved.paso2 = 0
    }

    if (msg.ls_run !== undefined) {
      resolved.ls_run = msg.ls_run;
    }
    else {
      resolved.ls_run = false
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

module.exports = linear_speed_path;
