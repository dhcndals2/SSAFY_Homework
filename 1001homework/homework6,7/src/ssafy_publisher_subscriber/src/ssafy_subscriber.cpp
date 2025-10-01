#include <memory>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
// std::bind를 사용하기 위해 placeholders include
using std::placeholders::_1;

class SsafySubscriber : public rclcpp::Node
{
public:
  SsafySubscriber()
  : Node("ssafy_subscriber")
  {
    // 'ssafy_topic' 토픽을 구독하고, 메시지를 받으면 topic_callback 함수를 실행
    subscription_ = this->create_subscription<std_msgs::msg::String>(
      "ssafy_topic", 10, std::bind(&SsafySubscriber::topic_callback, this, _1));
  }

private:
  void topic_callback(const std_msgs::msg::String & msg) const
  {
    RCLCPP_INFO(this->get_logger(), "I heard: '%s'", msg.data.c_str());
  }
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<SsafySubscriber>());
  rclcpp::shutdown();
  return 0;
}