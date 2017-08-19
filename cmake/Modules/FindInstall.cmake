# - Find INSTALL binary
# Find the native INSTALL executable
#
#  INSTALL_BIN     - INSTALL executable
#  INSTALL_FOUND       - TRUE if INSTALL binary was found.

INCLUDE(FindPackageHandleStandardArgs)

IF    (INSTALL_BIN)
    # Already in cache, be silent
    SET(INSTALL_FIND_QUIETLY TRUE)
ENDIF (INSTALL_BIN)

SET(INSTALL_NAMES install)

if    (CMAKE_HOST_WIN32)
    set(AWK_BIN "${MINGWLIBS}/bin/install.exe")
    if    (NOT EXISTS INSTALL_BIN)
        find_program(INSTALL_BIN NAMES ${INSTALL_NAMES})
    endif (NOT EXISTS INSTALL_BIN)
else  (CMAKE_HOST_WIN32)
    find_program(INSTALL_BIN NAMES ${INSTALL_NAMES})
endif (CMAKE_HOST_WIN32)

# Handle the QUIETLY and REQUIRED arguments and set INSTALL_FOUND to TRUE
# if INSTALL_BIN is valid
FIND_PACKAGE_HANDLE_STANDARD_ARGS(INSTALL DEFAULT_MSG INSTALL_BIN)

# Show these variables only in the advanced view in the GUI, and make them global
MARK_AS_ADVANCED(
        INSTALL_FOUND
        INSTALL_BIN
)