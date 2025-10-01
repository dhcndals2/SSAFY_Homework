import rclpy
from rclpy.node import Node
from turtlesim.srv import Spawn
from geometry_msgs.msg import Twist
import math

# 상수 정의
LINEAR_SPEED = 2.0 
ANGULAR_SPEED = 1.5 

class DrawGa(Node):
    def __init__(self):
        super().__init__('draw_ga_node')
        self.get_logger().info("한글 '가' 그리기 노드를 시작합니다.")

        self.turtle1_publisher = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)
        self.turtle1_path = [
            ('move', 2.0),
            ('turn', -math.pi / 2), 
            ('move', 4.0)
        ]
        self.turtle1_action_index = 0
        self.turtle1_is_moving = False
        self.turtle1_timer = None

        self.turtle2_publisher = None
        self.turtle2_path = [
            ('move', 3.0),
            ('turn', math.pi / 2),  
            ('move', 1.5),
            ('turn', math.pi / 2), 
            ('turn', math.pi / 2),  
            ('move', 1.5),
            ('turn', math.pi / 2),  
            ('move', 3.0)
        ]
        self.turtle2_action_index = 0
        self.turtle2_is_moving = False
        self.turtle2_timer = None

        self.spawn_client = self.create_client(Spawn, 'spawn')
        while not self.spawn_client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('spawn 서비스를 기다리는 중...')
        self._spawn_turtle2()

        self.timer = self.create_timer(0.1, self._control_loop)

    def _spawn_turtle2(self):
        """'ㅏ'를 그릴 turtle2를 적절한 위치에 생성합니다."""
        req = Spawn.Request()
        req.x = 9.0
        req.y = 6.0
        req.theta = -math.pi / 2
        req.name = 'turtle2'
        
        future = self.spawn_client.call_async(req)
        future.add_done_callback(self._spawn_done_callback)

    def _spawn_done_callback(self, future):
        """turtle2 생성이 완료되면 호출되는 콜백 함수입니다."""
        try:
            response = future.result()
            self.get_logger().info(f"'{response.name}' 거북이가 성공적으로 생성되었습니다.")
            self.turtle2_publisher = self.create_publisher(Twist, f'/{response.name}/cmd_vel', 10)
        except Exception as e:
            self.get_logger().error(f"거북이 생성 실패: {e}")

    def _control_loop(self):
        """0.1초마다 실행되며, 각 거북이가 놀고 있으면 다음 동작을 지시합니다."""
        if not self.turtle1_is_moving and self.turtle1_action_index < len(self.turtle1_path):
            self._execute_path(1, self.turtle1_path[self.turtle1_action_index])
        
        if self.turtle2_publisher and not self.turtle2_is_moving and self.turtle2_action_index < len(self.turtle2_path):
            self._execute_path(2, self.turtle2_path[self.turtle2_action_index])

    def _execute_path(self, turtle_num, action):
        """주어진 동작(action)을 수행합니다."""
        action_type, value = action
        twist_msg = Twist()
        duration = 0.0

        if action_type == 'move':
            twist_msg.linear.x = LINEAR_SPEED
            duration = value / LINEAR_SPEED
        elif action_type == 'turn':
            twist_msg.angular.z = ANGULAR_SPEED if value > 0 else -ANGULAR_SPEED
            duration = abs(value / ANGULAR_SPEED)

        if turtle_num == 1:
            self.turtle1_is_moving = True
            self.turtle1_publisher.publish(twist_msg)
            self.turtle1_timer = self.create_timer(duration, lambda: self._stop_turtle(1))
        elif turtle_num == 2:
            self.turtle2_is_moving = True
            self.turtle2_publisher.publish(twist_msg)
            self.turtle2_timer = self.create_timer(duration, lambda: self._stop_turtle(2))

        self.get_logger().info(f"Turtle{turtle_num}: '{action_type}' 동작 시작 ({duration:.2f}초)")
        
    def _stop_turtle(self, turtle_num):
        """거북이의 현재 동작을 멈추고 타이머를 취소합니다."""
        twist_msg = Twist()
        
        if turtle_num == 1:
            self.turtle1_publisher.publish(twist_msg)
            self.turtle1_is_moving = False
            self.turtle1_action_index += 1
            if self.turtle1_timer and not self.turtle1_timer.is_canceled():
                self.turtle1_timer.cancel()
            if self.turtle1_action_index >= len(self.turtle1_path):
                 self.get_logger().info("Turtle1의 동작이 완료되었습니다!")
        elif turtle_num == 2:
            self.turtle2_publisher.publish(twist_msg)
            self.turtle2_is_moving = False
            self.turtle2_action_index += 1
            if self.turtle2_timer and not self.turtle2_timer.is_canceled():
                self.turtle2_timer.cancel()
            if self.turtle2_action_index >= len(self.turtle2_path):
                 self.get_logger().info("Turtle2의 동작이 완료되었습니다!")

def main(args=None):
    rclpy.init(args=args)
    node = DrawGa()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

