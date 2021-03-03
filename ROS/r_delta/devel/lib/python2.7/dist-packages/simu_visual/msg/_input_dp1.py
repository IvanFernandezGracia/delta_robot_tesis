# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from simu_visual/input_dp1.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class input_dp1(genpy.Message):
  _md5sum = "d94a0ecc240e2dbc7926bd823ff8f394"
  _type = "simu_visual/input_dp1"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 xo
float32 yo
float32 zo
float32 xf
float32 yf
float32 zy
float32 step
bool graficar_realtime
int64 idcall
"""
  __slots__ = ['xo','yo','zo','xf','yf','zy','step','graficar_realtime','idcall']
  _slot_types = ['float32','float32','float32','float32','float32','float32','float32','bool','int64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       xo,yo,zo,xf,yf,zy,step,graficar_realtime,idcall

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(input_dp1, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.xo is None:
        self.xo = 0.
      if self.yo is None:
        self.yo = 0.
      if self.zo is None:
        self.zo = 0.
      if self.xf is None:
        self.xf = 0.
      if self.yf is None:
        self.yf = 0.
      if self.zy is None:
        self.zy = 0.
      if self.step is None:
        self.step = 0.
      if self.graficar_realtime is None:
        self.graficar_realtime = False
      if self.idcall is None:
        self.idcall = 0
    else:
      self.xo = 0.
      self.yo = 0.
      self.zo = 0.
      self.xf = 0.
      self.yf = 0.
      self.zy = 0.
      self.step = 0.
      self.graficar_realtime = False
      self.idcall = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_7fBq().pack(_x.xo, _x.yo, _x.zo, _x.xf, _x.yf, _x.zy, _x.step, _x.graficar_realtime, _x.idcall))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 37
      (_x.xo, _x.yo, _x.zo, _x.xf, _x.yf, _x.zy, _x.step, _x.graficar_realtime, _x.idcall,) = _get_struct_7fBq().unpack(str[start:end])
      self.graficar_realtime = bool(self.graficar_realtime)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_7fBq().pack(_x.xo, _x.yo, _x.zo, _x.xf, _x.yf, _x.zy, _x.step, _x.graficar_realtime, _x.idcall))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 37
      (_x.xo, _x.yo, _x.zo, _x.xf, _x.yf, _x.zy, _x.step, _x.graficar_realtime, _x.idcall,) = _get_struct_7fBq().unpack(str[start:end])
      self.graficar_realtime = bool(self.graficar_realtime)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_7fBq = None
def _get_struct_7fBq():
    global _struct_7fBq
    if _struct_7fBq is None:
        _struct_7fBq = struct.Struct("<7fBq")
    return _struct_7fBq
