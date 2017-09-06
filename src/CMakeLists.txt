file (GLOB NETMUX_SRCS dummy.cc ../misc/myfifo.c ../event/event.c
        boolexp.c bsd.c commac.c command.c compat.c comsys.c conf.c
        cque.c create.c db.c db_xml.c db_xdr.c db_rw.c dllist.c
        dnschild.c eval.c file_c.c flags.c funceval.c functions.c
        game.c help.c log.c look.c macro.c mail.c match.c mguests.c
        move.c mmdb.c nametab.c netcommon.c nrbtab.c object.c player.c
        player_c.c powers.c predicates.c mx_python.c rbtree.c rbtab.c
        rob.c set.c signal.c speech.c stringutil.c timer.c unparse.c
        vattr.c walkdb.c wild.c wiz.c version.c )

file (GLOB NETMUX_HDRS ../misc/myfifo.h ../event/p.event.h
        alloc.h ansi.h attrs.h commac.h command.h comsys.h config.h
        cque.h db.h debug.h dlist.h dllist.h externs.h file_c.h flags.h
        functions.h help.h htab.h interface.h macro.h mail.h match.h
        mguests.h misc.h mmdb.h mudconf.h network.h p.comsys.h
        p.functions.h patchlevel.h pcache.h powers.h rbtab.h rbtree.h
        vattr.h version.h mx_python.h )

if (SQL_SUPPORT)
    file (GLOB NETMUX_SRCS_SQL sqlchild.c sqlchild.h)
endif()

if (ARBITRARY_LOGFILES)
    file (GLOB NETMUX_SRCS_LOG logcache.c logcache.h)
endif()


file (GLOB MKINDX_SRCS mkindx.c)

#add include directories
include_directories(${LIBEVENT_INCLUDE_DIR})
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/src)
include_directories(${CMAKE_SOURCE_DIR}/misc)
include_directories(${CMAKE_SOURCE_DIR}/event)
include_directories(${CMAKE_BINARY_DIR})

if (USE_PYTHON AND PYTHONLIBS_FOUND)
	include_directories(${PYTHON_INCLUDE_DIRS})
	add_definitions(-DUSE_PYTHON)
endif(USE_PYTHON AND PYTHONLIBS_FOUND)

add_executable(netmux ${NETMUX_SRCS} ${NETMUX_HDRS} ${NETMUX_SRCS_SQL} ${NETMUX_SRCS_LOG})
target_link_libraries(netmux libbtech ${LIBEVENT_LIB})

if (USE_PYTHON)
    if (APPLE)
        target_link_libraries(netmux util pthread ${PYTHON_LIBRARY})
    else (APPLE)
        target_link_libraries(netmux ${PYTHON_LIBRARY})
    endif (APPLE)
endif(USE_PYTHON)

add_executable(mkindx ${MKINDX_SRCS} ${MKINDX_HDRS})