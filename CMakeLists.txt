cmake_minimum_required(VERSION 3.16)

# project name
project(SavvyCAN)

# Qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

option(BUILD_WITH_QT6 "build with qt6 when set on (default: qt5 when off)" OFF)

# deps

if(BUILD_WITH_QT6)
  find_package(Qt6  REQUIRED COMPONENTS Widgets Qml SerialBus SerialPort PrintSupport Help Network OpenGL)
  list(APPEND LINK_LIBS Qt6::Widgets Qt6::Qml Qt6::SerialBus Qt6::SerialPort Qt6::PrintSupport Qt6::Help Qt6::Network Qt6::OpenGL)
else()
  find_package(Qt5  REQUIRED COMPONENTS Widgets Qml SerialBus SerialPort PrintSupport Help Network OpenGL)
  list(APPEND LINK_LIBS Qt5::Widgets Qt5::Qml Qt5::SerialBus Qt5::SerialPort Qt5::PrintSupport Qt5::Help Qt5::Network Qt5::OpenGL)
endif()

# include directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
list(APPEND INCLUDE_DIRS
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/src
	${CMAKE_CURRENT_SOURCE_DIR}/src/ui
	${CMAKE_CURRENT_SOURCE_DIR}/resources)

# src
FILE(GLOB_RECURSE SOURCES src/*.cpp src/*.h)

# resource
FILE(GLOB_RECURSE RESOURCES resources/*.qrc)

# target
add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCES})
target_link_libraries(${PROJECT_NAME} ${LINK_LIBS})
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIRS})

message("build with qt 6: " ${BUILD_WITH_QT6})
