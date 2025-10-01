#include <chrono>
#include <memory>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

using namespace std::chrono_literals;

class SsafyPublisher : public rclcpp::Node
{
public:
  SsafyPublisher()
  : Node("ssafy_publisher"), count_(0)
  {
    // 'ssafy_topic'이라는 이름의 토픽에 String 메시지를 발행하는 퍼블리셔 생성
    publisher_ = this->create_publisher<std_msgs::msg::String>("ssafy_topic", 10);
    // 1초마다 timer_callback 함수를 실행하는 타이머 생성
    timer_ = this->create_wall_timer(
      1s, std::bind(&SsafyPublisher::timer_callback, this));
  }

private:
  void timer_callback()
  {
    auto message = std_msgs::msg::String();
    message.data = "Hello SSAFY " + std::to_string(count_++);
    RCLCPP_INFO(this->get_logger(), "Publishing: '%s'", message.data.c_str());
    publisher_->publish(message);
  }
  rclcpp::TimerBase::SharedPtr timer_;
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
  size_t count_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<SsafyPublisher>());
  rclcpp::shutdown();
  return 0;
}