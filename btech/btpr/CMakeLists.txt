file (GLOB BTPR_SRCS event.c comsys.c conf.c db.c dllist.c eval.c game.c flags.c
             functions.c log.c move.c netcommon.c player.c powers.c pqueue.c
             predicates.c rbtab.c rbtree.c stringutil.c wild.c)

file (GLOB BTPR_HDRS pqueue.h include/alloc.h include/ansi.h include/attrs.h 
	include/copyright.h include/db.h include/config.h include/create.h 
	include/dllist.h include/externs.h include/flags.h include/htab.h 
	include/debug.h include/mudconf.h 
	include/muxevent.h include/powers.h 
	include/p.event.h include/p.functions.h include/rbtree.h 
	include/interface.h)

if (BTPR_PEN)
    file (GLOB BTPR_PENN_HDRS penn/btpr_alloc.h penn/btpr_db.h penn/btpr_interface.h 
            penn/btpr_mudconf.h)
endif()

if (BTPR_MUX2)
    file (GLOB BTPR_MUX_HDRS mux2/btpr_alloc.h mux2/btpr_db.h mux2/btpr_interface.h 
            mux2/btpr_mudconf.h)
    include_directories(mux2/include)
endif()

include_directories(./include)
include_directories(${CMAKE_BINARY_DIR})

add_library(btpr STATIC ${BTPR_SRCS} ${BTPR_HDRS} ${BTPR_MUX_HDRS} ${BTPR_PENN_HDRS} ${CMAKE_BINARY_DIR}/autoconf.h)
add_library(libbtpr ALIAS btpr)