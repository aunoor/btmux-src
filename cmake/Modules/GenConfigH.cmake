include(TestBigEndian)
include(CheckFunctionExists)
include(CheckCSourceCompiles)
include(CheckIncludeFile)
include(CheckStructHasMember)
include(CheckSymbolExists)

function(CHECK_LIBRARY LIBRARY_NAME CL_RESULT)
    set(OLD_QUIET $CMAKE_REQUIRED_QUIET)
    set(CMAKE_REQUIRED_QUIET 1)
    set(OLD_REQ_LIBS ${CMAKE_REQUIRED_LIBRARIES})
    set(CMAKE_REQUIRED_LIBRARIES ${LIBRARY_NAME})
    CHECK_C_SOURCE_COMPILES (
            "void main() {
                    return;
                }"
            TMP_RESULT)
    set(${CL_RESULT} ${TMP_RESULT} PARENT_SCOPE)
    set(CMAKE_REQUIRED_LIBRARIES ${OLD_REQ_LIBS})
    set(CMAKE_REQUIRED_QUIET ${OLD_QUIET})
    unset(OLD_QUIET)
    unset(OLD_REQ_LIBS)
    unset(TMP_RESULT CACHE)
endfunction()

function(CHECK_TYPE_DEF TYPE_NAME TT_RESULT)
    set(OLD_QUIET $CMAKE_REQUIRED_QUIET)
    set(CMAKE_REQUIRED_QUIET 1)
    CHECK_C_SOURCE_COMPILES (
            "#include <sys/types.h>
            int main() {
                    ${TYPE_NAME} tmp_var;
                    return 0;
                }"
            TMPT_RESULT)
    set(${TT_RESULT} ${TMPT_RESULT} PARENT_SCOPE)
    set(CMAKE_REQUIRED_QUIET ${OLD_QUIET})
    unset(OLD_QUIET)
    unset(TMPT_RESULT CACHE)
endfunction()


function(gen_config_h)

    if (ARBITRARY_LOGFILES)
        set(ARBITRARY_LOGFILES 1)
    endif()
    if (BT_ADVANCED_ECON)
        set (BT_ADVANCED_ECON 1)
    endif()
    if (BT_COMPLEXREPAIRS)
        set (BT_COMPLEXREPAIRS 1)
    endif()
    if (BT_FREETECHTIME)
        set (BT_FREETECHTIME 1)
    endif()
    if (HUDINFO_SUPPORT)
        set (HUDINFO_SUPPORT 1)
    endif()
    if (SQL_SUPPORT)
        set (SQL_SUPPORT 1)
    endif()
    if (MOVE_HELP)
        set (MOVE_HELP 1)
    endif()
    if (BT_ADVANCED_ECON)
        set (BT_ADVANCED_ECON 1)
    endif()
    if (BT_CARGO_COMMANDS)
        set (BT_CARGO_COMMANDS 1)
    endif()
    if (BT_EXILE_MW3STATS)
        set (BT_EXILE_MW3STATS 1)
    endif()
    if (BT_MOVEMENT_MODES)
        set (BT_MOVEMENT_MODES 1)
    endif()
    if (BT_SCALED_INFRARED)
        set (BT_SCALED_INFRARED 1)
    endif()
    if (WEIGHT_OVERSPEEDING)
        set (WEIGHT_OVERSPEEDING 1)
    endif()
    if (BTPR_MUX1)
        set (BTPR_MUX1 1)
    endif()



#check for getdtablesize
    CHECK_FUNCTION_EXISTS(getdtablesize HAVE_GETDTABLESIZE)

#check for getrusage
    CHECK_FUNCTION_EXISTS(getrusage HAVE_GETRUSAGE)

#check for posix_memalign
    CHECK_FUNCTION_EXISTS(posix_memalign HAVE_POSIX_MEMALIGN)

#check for srandom
    CHECK_FUNCTION_EXISTS(srandom HAVE_SRANDOM)

#check for strlcat
    CHECK_FUNCTION_EXISTS(strlcat HAVE_STRLCAT)

#check for strlcpy
    CHECK_FUNCTION_EXISTS(strlcpy HAVE_STRLCPY)

#check for strndup
    CHECK_FUNCTION_EXISTS(strndup HAVE_STRNDUP)

#check for strnlen
    CHECK_FUNCTION_EXISTS(strnlen HAVE_STRNLEN)


    CHECK_C_SOURCE_COMPILES (
            "#include <signal.h>
                int main() {
                    struct siginfo_t tmp_siginfo_t;
                    (void)tmp_siginfo_t.si_fd;
                    return 0;
                }"
        HAVE_SIGINFO_T_SI_FD)

    CHECK_INCLUDE_FILE("sys/select.h" HAVE_SYS_SELECT_H)

    CHECK_C_SOURCE_COMPILES (
            "#include <stdlib.h>
            #include <stdarg.h>
            #include <string.h>
            #include <float.h>
            int main () {
                ;
                return 0;
            }"
        STDC_HEADERS)

    CHECK_C_SOURCE_COMPILES (
            "#include <sys/types.h>
            int main () {
                pid_t tmp_pid_t;
                (void)tmp_pid_t;
                return 0;
            }"
    HAVE_PID_T)

    if (NOT HAVE_PID_T)
        set (pid_t int)
    endif()


    CHECK_C_SOURCE_COMPILES (
            "#include <sys/types.h>
            int main () {
                size_t tmp_size_t;
                (void)tmp_size_t;
                return 0;
            }"
    HAVE_SIZE_T)

    if (NOT HAVE_SIZE_T)
        set (size_t int)
    endif()


    configure_file(${CMAKE_SOURCE_DIR}/autoconfig.h.in ${CMAKE_BINARY_DIR}/autoconf.h
            @ONLY
            NEWLINE_STYLE UNIX)
endfunction()