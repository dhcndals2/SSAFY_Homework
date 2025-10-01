cmake_minimum_required(VERSION 3.8)
project(ssafy_publisher_subscriber)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# --- 이 부분을 추가하세요 (START) ---
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
# --- 이 부분을 추가하세요 (END) ---

# --- 이 부분을 추가하세요 (START) ---
add_executable(ssafy_publisher src/ssafy_publisher.cpp)
ament_target_dependencies(ssafy_publisher rclcpp std_msgs)

add_executable(ssafy_subscriber src/ssafy_subscriber.cpp)
ament_target_dependencies(ssafy_subscriber rclcpp std_msgs)

install(TARGETS
  ssafy_publisher
  ssafy_subscriber
  DESTINATION lib/${PROJECT_NAME}
)
# --- 이 부분을 추가하세요 (END) ---


if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  set(ament_cmake_copyright_FOUND TRUE)
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()