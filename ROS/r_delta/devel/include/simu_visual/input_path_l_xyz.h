// Generated by gencpp from file simu_visual/input_path_l_xyz.msg
// DO NOT EDIT!


#ifndef SIMU_VISUAL_MESSAGE_INPUT_PATH_L_XYZ_H
#define SIMU_VISUAL_MESSAGE_INPUT_PATH_L_XYZ_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace simu_visual
{
template <class ContainerAllocator>
struct input_path_l_xyz_
{
  typedef input_path_l_xyz_<ContainerAllocator> Type;

  input_path_l_xyz_()
    : x0(0.0)
    , y0(0.0)
    , z0(0.0)
    , xf(0.0)
    , yf(0.0)
    , zf(0.0)
    , graficar_realtime(false)
    , idcall(0)  {
    }
  input_path_l_xyz_(const ContainerAllocator& _alloc)
    : x0(0.0)
    , y0(0.0)
    , z0(0.0)
    , xf(0.0)
    , yf(0.0)
    , zf(0.0)
    , graficar_realtime(false)
    , idcall(0)  {
  (void)_alloc;
    }



   typedef float _x0_type;
  _x0_type x0;

   typedef float _y0_type;
  _y0_type y0;

   typedef float _z0_type;
  _z0_type z0;

   typedef float _xf_type;
  _xf_type xf;

   typedef float _yf_type;
  _yf_type yf;

   typedef float _zf_type;
  _zf_type zf;

   typedef uint8_t _graficar_realtime_type;
  _graficar_realtime_type graficar_realtime;

   typedef int64_t _idcall_type;
  _idcall_type idcall;





  typedef boost::shared_ptr< ::simu_visual::input_path_l_xyz_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::simu_visual::input_path_l_xyz_<ContainerAllocator> const> ConstPtr;

}; // struct input_path_l_xyz_

typedef ::simu_visual::input_path_l_xyz_<std::allocator<void> > input_path_l_xyz;

typedef boost::shared_ptr< ::simu_visual::input_path_l_xyz > input_path_l_xyzPtr;
typedef boost::shared_ptr< ::simu_visual::input_path_l_xyz const> input_path_l_xyzConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::simu_visual::input_path_l_xyz_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::simu_visual::input_path_l_xyz_<ContainerAllocator1> & lhs, const ::simu_visual::input_path_l_xyz_<ContainerAllocator2> & rhs)
{
  return lhs.x0 == rhs.x0 &&
    lhs.y0 == rhs.y0 &&
    lhs.z0 == rhs.z0 &&
    lhs.xf == rhs.xf &&
    lhs.yf == rhs.yf &&
    lhs.zf == rhs.zf &&
    lhs.graficar_realtime == rhs.graficar_realtime &&
    lhs.idcall == rhs.idcall;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::simu_visual::input_path_l_xyz_<ContainerAllocator1> & lhs, const ::simu_visual::input_path_l_xyz_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace simu_visual

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::simu_visual::input_path_l_xyz_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::simu_visual::input_path_l_xyz_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::simu_visual::input_path_l_xyz_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2d2c1d1e38cec0b4387b2da564ea4c71";
  }

  static const char* value(const ::simu_visual::input_path_l_xyz_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2d2c1d1e38cec0b4ULL;
  static const uint64_t static_value2 = 0x387b2da564ea4c71ULL;
};

template<class ContainerAllocator>
struct DataType< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
{
  static const char* value()
  {
    return "simu_visual/input_path_l_xyz";
  }

  static const char* value(const ::simu_visual::input_path_l_xyz_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x0\n"
"float32 y0\n"
"float32 z0\n"
"float32 xf\n"
"float32 yf\n"
"float32 zf\n"
"bool graficar_realtime\n"
"int64 idcall\n"
;
  }

  static const char* value(const ::simu_visual::input_path_l_xyz_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x0);
      stream.next(m.y0);
      stream.next(m.z0);
      stream.next(m.xf);
      stream.next(m.yf);
      stream.next(m.zf);
      stream.next(m.graficar_realtime);
      stream.next(m.idcall);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct input_path_l_xyz_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::simu_visual::input_path_l_xyz_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::simu_visual::input_path_l_xyz_<ContainerAllocator>& v)
  {
    s << indent << "x0: ";
    Printer<float>::stream(s, indent + "  ", v.x0);
    s << indent << "y0: ";
    Printer<float>::stream(s, indent + "  ", v.y0);
    s << indent << "z0: ";
    Printer<float>::stream(s, indent + "  ", v.z0);
    s << indent << "xf: ";
    Printer<float>::stream(s, indent + "  ", v.xf);
    s << indent << "yf: ";
    Printer<float>::stream(s, indent + "  ", v.yf);
    s << indent << "zf: ";
    Printer<float>::stream(s, indent + "  ", v.zf);
    s << indent << "graficar_realtime: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.graficar_realtime);
    s << indent << "idcall: ";
    Printer<int64_t>::stream(s, indent + "  ", v.idcall);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SIMU_VISUAL_MESSAGE_INPUT_PATH_L_XYZ_H