import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist  

class TurtleController(Node):
    def __init__(self):
        super().__init__('turtle_controller_node')
        self.publisher_ = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)
        
        timer_period = 0.5  
        self.timer = self.create_timer(timer_period, self.publish_velocity_command)
        self.get_logger().info('Turtle controller node has been started and is publishing commands.')

    def publish_velocity_command(self):
        msg = Twist()
        
        msg.linear.x = 2.0 
        msg.angular.z = 1.0  
        
        self.publisher_.publish(msg)
        self.get_logger().info(f'Homework4: linear.x={msg.linear.x}, angular.z={msg.angular.z}')

def main(args=None):
    rclpy.init(args=args)
    turtle_controller = TurtleController()
    rclpy.spin(turtle_controller)
    turtle_controller.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()