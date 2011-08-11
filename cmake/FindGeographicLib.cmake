# $Id$
#
# Look for GeographicLib
#
# Set
#  GEOGRAPHICLIB_FOUND = TRUE
#  GEOGRAPHICLIB_INCLUDE_DIRS = /usr/local/include
#  GEOGRAPHICLIB_LIBRARIES = /usr/local/lib/libGeographic.so
#  GEOGRAPHICLIB_LIBRARY_DIRS = /usr/local/lib

find_library (GEOGRAPHICLIB_LIBRARIES Geographic
  PATHS "${CMAKE_INSTALL_PREFIX}/../GeographicLib/lib")

if (GEOGRAPHICLIB_LIBRARIES)
  get_filename_component (GEOGRAPHICLIB_LIBRARY_DIRS
    "${GEOGRAPHICLIB_LIBRARIES}" PATH)
  get_filename_component (GEOGRAPHICLIB_ROOT_DIR
    "${GEOGRAPHICLIB_LIBRARY_DIRS}" PATH)
  set (GEOGRAPHICLIB_INCLUDE_DIRS "${GEOGRAPHICLIB_ROOT_DIR}/include")
  unset (GEOGRAPHICLIB_ROOT_DIR)
  if (NOT EXISTS "${GEOGRAPHICLIB_INCLUDE_DIRS}/GeographicLib/Config.h")
    unset (GEOGRAPHICLIB_INCLUDE_DIRS)
    unset (GEOGRAPHICLIB_LIBRARIES)
    unset (GEOGRAPHICLIB_LIBRARY_DIRS)
  endif (NOT EXISTS "${GEOGRAPHICLIB_INCLUDE_DIRS}/GeographicLib/Config.h")
endif (GEOGRAPHICLIB_LIBRARIES)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (GeographicLib DEFAULT_MSG
  GEOGRAPHICLIB_INCLUDE_DIRS
  GEOGRAPHICLIB_LIBRARIES
  GEOGRAPHICLIB_LIBRARY_DIRS)
mark_as_advanced (GEOGRAPHICLIB_INCLUDE_DIRS
  GEOGRAPHICLIB_LIBRARIES GEOGRAPHICLIB_LIBRARY_DIRS)