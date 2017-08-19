cmake_minimum_required ( VERSION 3.4.3 )

project(btmux)

#include some helping modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules")

#include(FindUnixCommands)
#include(FindAWK)
#include(FindInstall)
#include(FindGeoIP)
#include(FindZLIB)
#include(FindIconv)
include(GenConfigH)

#check libraries
find_package(LibEvent REQUIRED)


#define current version
set(VERSION_MAJOR 0)
set(VERSION_MINOR 8)
set(VERSION_REVISION 0)
set(VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_REVISION})

set(ARBITRARY_LOGFILES ON CACHE BOOL "Should Enhanced Logging be enabled")
set(BT_ADVANCED_ECON ON CACHE BOOL "Should the advanced econ system be enabled")
set(BT_COMPLEXREPAIRS OFF CACHE BOOL "Should complex repairs be enabled")
set(BT_FREETECHTIME OFF CACHE BOOL "Should the freetechtime code be enabled")
set(HUDINFO_SUPPORT ON CACHE BOOL "Should the HUDINFO code be enabled")
set(SQL_SUPPORT OFF CACHE BOOL "Should SQL Support be enabled")
set(MOVE_HELP OFF CACHE BOOL "Should we rename the 'help' command to 'muxhelp'")
set(BT_ADVANCED_ECON ON CACHE BOOL "Should the advanced econ system be enabled")
set(BT_CARGO_COMMANDS ON CACHE BOOL "Should the cargo commands be enabled")
set(BT_EXILE_MW3STATS ON CACHE BOOL "Should MW3-like stats and skills be enabled")
set(BT_MOVEMENT_MODES ON CACHE BOOL "Should enhanced movment modes be enabled")
set(BT_SCALED_INFRARED ON CACHE BOOL "Should heat-scaled infrared be enabled")
set(WEIGHT_OVERSPEEDING OFF CACHE BOOL "Should mech overspeeding be enabled")
set(BTPR_MUX1 ON)
set(PACKAGE_STRING "BattleTech MUX")

#generate config.h
gen_config_h()

add_subdirectory(src)
add_subdirectory(btech)
