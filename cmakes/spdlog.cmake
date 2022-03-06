#message(STATUS "hello ${PROJECT_SOURCE_DIR} ${CMAKE_CURRENT_LIST_DIR}")
include(ExternalProject)

set(target spdlog)
set(CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX}
        -DBUILD_STATIC_LIB=ON
        -DBUILD_SHARED_LIB=OFF)
ExternalProject_Add(
        spdlog_build
        GIT_REPOSITORY https://github.com/gabime/spdlog.git
        GIT_TAG v1.9.2
        CMAKE_ARGS ${CMAKE_ARGS}
)

add_library(${target}::${target} STATIC IMPORTED GLOBAL)
set_target_properties(${target}::${target} PROPERTIES
        IMPORTED_LOCATION "${DEPS_LIB_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}${target}${CMAKE_STATIC_LIBRARY_SUFFIX}"
        INCLUDE_DIRECTORIES ${DEPS_INCLUDE_DIR})
add_dependencies(${target}::${target} ${target}_build)
include_directories(${DEPS_INCLUDE_DIR})
