add_executable(test tests/unit/test.cpp ${SRCS_DIRS})
target_link_libraries(test ${EXTRA})

add_executable(test_service tests/unit/test_service.cpp ${SRCS_DIRS})
target_link_libraries(test_service ${EXTRA})