
add_subdirectory(btfi)
if (BTPR_PENN OR BTPR_MUX2)
    add_subdirectory(btpr)
endif()
add_subdirectory(src)
