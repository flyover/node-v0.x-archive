APP_PLATFORM := android-10

NDK_TOOLCHAIN_VERSION := 4.9

# Uncomment this if you're using STL in your project
# See CPLUSPLUS-SUPPORT.html in the NDK documentation for more information
#APP_STL := system		# -> Use the default minimal system C++ runtime library.
#APP_STL := gabi++_static	# -> Use the GAbi++ runtime as a static library.
#APP_STL := gabi++_shared	# -> Use the GAbi++ runtime as a shared library.
#APP_STL := stlport_static	# -> Use the STLport runtime as a static library.
#APP_STL := stlport_shared	# -> Use the STLport runtime as a shared library.
APP_STL := gnustl_static	# -> Use the GNU STL as a static library.
#APP_STL := gnustl_shared	# -> Use the GNU STL as a shared library.

#APP_ABI := all
#APP_ABI := armeabi
#APP_ABI := armeabi-v7a
#APP_ABI := arm64-v8a
#APP_ABI := mips
#APP_ABI := mips64
#APP_ABI := x86
#APP_ABI := x86_64

APP_ABI := armeabi armeabi-v7a arm64-v8a mips x86 x86_64

