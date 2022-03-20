include(ExternalProject)
include(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)

set(CMAKE_INSTALL_LIBDIR lib)
set(target openssl)
ProcessorCount(cpus)
ExternalProject_Add(
        ${target}_ext
        GIT_REPOSITORY https://github.com/openssl/openssl.git
        GIT_TAG openssl-3.0.1
        CONFIGURE_COMMAND <SOURCE_DIR>/Configure --prefix=${DEPS_PREFIX} --openssldir=${DEPS_PREFIX} --libdir=${DEPS_PREFIX}/lib -static
        BUILD_ALWAYS 0
)

AddLibrary(${target} PREFIX ${DEPS_PREFIX} DEP ${target}_ext SUBMODULES ssl crypto)
