# - Find LibCrypt (a cross event library)
# This module defines
# LIBCRYPT_INCLUDE_DIR, where to find LibCrypt headers
# LIBCRYPT_LIB, LibEvent libraries
# LibCrypt_FOUND, If false, do not try to use libcrypt

set(LibCrypt_EXTRA_PREFIXES /usr/local /opt/local "$ENV{HOME}")
foreach(prefix ${LibCrypt_EXTRA_PREFIXES})
  list(APPEND LibCrypt_INCLUDE_PATHS "${prefix}/include")
  list(APPEND LibCrypt_LIB_PATHS "${prefix}/lib")
endforeach()

find_path(LIBCRYPT_INCLUDE_DIR crypt.h PATHS ${LibCrypt_INCLUDE_PATHS})
find_library(LIBCRYPT_LIB NAMES crypt PATHS ${LibCrypt_LIB_PATHS})

if (LIBCRYPT_LIB AND LIBCRYPT_INCLUDE_DIR)
  set(LibCrypt_FOUND TRUE)
  set(LIBCRYPT_LIB ${LIBCRYPT_LIB})
else ()
  set(LibCrypt_FOUND FALSE)
endif ()

if (LibCrypt_FOUND)
  if (NOT LibCrypt_FIND_QUIETLY)
    message(STATUS "Found libcrypt: ${LIBCRYPT_LIB}")
  endif ()
else ()
  if (LibCrypt_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find libcrypt.")
  endif ()
  message(STATUS "libcrypt NOT found.")
endif ()

mark_as_advanced(
    LIBCRYPT_LIB
    LIBCRYPT_INCLUDE_DIR
  )
