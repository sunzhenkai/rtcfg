include(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)
include(ExternalProject)

set(target spdlog)
set(CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX}
        -DCMAKE_INSTALL_LIBDIR=lib
        -DBUILD_STATIC_LIB=ON
        -DBUILD_SHARED_LIB=OFF)
ExternalProject_Add(
        ${target}_ext
        GIT_REPOSITORY https://github.com/gabime/spdlog.git
        GIT_TAG v1.9.2
        CMAKE_ARGS ${CMAKE_ARGS}
        BUILD_ALWAYS 0
)

AddLibrary(${target} PREFIX ${DEPS_PREFIX} DEP ${target}_ext SUBMODULES ${target})