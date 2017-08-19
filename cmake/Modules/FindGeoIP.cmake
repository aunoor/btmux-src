# - Try to find LibGeoIP
# Once done this will define
#  LIBGEOIP_FOUND - System has LibGeoIP
#  LIBGEOIP_INCLUDE_DIRS - The LibGeoIP include directories
#  LIBGEOIP_LIBRARIES - The libraries needed to use LibGeoIP
#  LIBGEOIP_DEFINITIONS - Compiler switches required for using LibGeoIP

find_package(PkgConfig)
pkg_check_modules(PC_LIBGEOIP QUIET GeoIP)
set(LIBGEOIP_DEFINITIONS ${PC_LIBGEOIP_CFLAGS_OTHER})

find_path(LIBGEOIP_INCLUDE_DIR GeoIP.h
          HINTS ${PC_LIBGEOIP_INCLUDEDIR} ${PC_LIBGEOIP_INCLUDE_DIRS}
          PATH_SUFFIXES libGeoIP )

find_library(LIBGEOIP_LIBRARY NAMES GeoIP libGeoIP
             HINTS ${PC_LIBGEOIP_LIBDIR} ${PC_LIBGEOIP_LIBRARY_DIRS} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LibGeoIP  DEFAULT_MSG
                                  LIBGEOIP_LIBRARY LIBGEOIP_INCLUDE_DIR)

mark_as_advanced(LIBGEOIP_INCLUDE_DIR LIBGEOIP_LIBRARY )

set(LIBGEOIP_LIBRARIES ${LIBGEOIP_LIBRARY} )
set(LIBGEOIP_INCLUDE_DIRS ${LIBGEOIP_INCLUDE_DIR} )
