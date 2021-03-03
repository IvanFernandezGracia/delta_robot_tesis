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

class matriz_path_ls {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.permiso = null;
      this.id_call = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.th1 = null;
      this.th2 = null;
      this.th3 = null;
      this.tiempo = null;
    }
    else {
      if (initObj.hasOwnProperty('permiso')) {
        this.permiso = initObj.permiso
      }
      else {
        this.permiso = false;
      }
      if (initObj.hasOwnProperty('id_call')) {
        this.id_call = initObj.id_call
      }
      else {
        this.id_call = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = [];
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = [];
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = [];
      }
      if (initObj.hasOwnProperty('th1')) {
        this.th1 = initObj.th1
      }
      else {
        this.th1 = [];
      }
      if (initObj.hasOwnProperty('th2')) {
        this.th2 = initObj.th2
      }
      else {
        this.th2 = [];
      }
      if (initObj.hasOwnProperty('th3')) {
        this.th3 = initObj.th3
      }
      else {
        this.th3 = [];
      }
      if (initObj.hasOwnProperty('tiempo')) {
        this.tiempo = initObj.tiempo
      }
      else {
        this.tiempo = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type matriz_path_ls
    // Serialize message field [permiso]
    bufferOffset = _serializer.bool(obj.permiso, buffer, bufferOffset);
    // Serialize message field [id_call]
    bufferOffset = _serializer.int64(obj.id_call, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _arraySerializer.float32(obj.x, buffer, bufferOffset, null);
    // Serialize message field [y]
    bufferOffset = _arraySerializer.float32(obj.y, buffer, bufferOffset, null);
    // Serialize message field [z]
    bufferOffset = _arraySerializer.float32(obj.z, buffer, bufferOffset, null);
    // Serialize message field [th1]
    bufferOffset = _arraySerializer.float32(obj.th1, buffer, bufferOffset, null);
    // Serialize message field [th2]
    bufferOffset = _arraySerializer.float32(obj.th2, buffer, bufferOffset, null);
    // Serialize message field [th3]
    bufferOffset = _arraySerializer.float32(obj.th3, buffer, bufferOffset, null);
    // Serialize message field [tiempo]
    bufferOffset = _arraySerializer.float32(obj.tiempo, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type matriz_path_ls
    let len;
    let data = new matriz_path_ls(null);
    // Deserialize message field [permiso]
    data.permiso = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [id_call]
    data.id_call = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [y]
    data.y = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [z]
    data.z = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [th1]
    data.th1 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [th2]
    data.th2 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [th3]
    data.th3 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [tiempo]
    data.tiempo = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.x.length;
    length += 4 * object.y.length;
    length += 4 * object.z.length;
    length += 4 * object.th1.length;
    length += 4 * object.th2.length;
    length += 4 * object.th3.length;
    length += 4 * object.tiempo.length;
    return length + 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simu_visual/matriz_path_ls';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb8abae6b50409fef1dc6dbabd6fe786';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool permiso
    int64 id_call
    float32[] x
    float32[] y
    float32[] z
    float32[] th1
    float32[] th2
    float32[] th3
    float32[] tiempo
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new matriz_path_ls(null);
    if (msg.permiso !== undefined) {
      resolved.permiso = msg.permiso;
    }
    else {
      resolved.permiso = false
    }

    if (msg.id_call !== undefined) {
      resolved.id_call = msg.id_call;
    }
    else {
      resolved.id_call = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = []
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = []
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = []
    }

    if (msg.th1 !== undefined) {
      resolved.th1 = msg.th1;
    }
    else {
      resolved.th1 = []
    }

    if (msg.th2 !== undefined) {
      resolved.th2 = msg.th2;
    }
    else {
      resolved.th2 = []
    }

    if (msg.th3 !== undefined) {
      resolved.th3 = msg.th3;
    }
    else {
      resolved.th3 = []
    }

    if (msg.tiempo !== undefined) {
      resolved.tiempo = msg.tiempo;
    }
    else {
      resolved.tiempo = []
    }

    return resolved;
    }
};

module.exports = matriz_path_ls;
