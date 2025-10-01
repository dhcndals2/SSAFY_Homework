import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from turtlesim.srv import Spawn

class TurtleSpawner(Node):
    def __init__(self):
        super().__init__('turtle_spawner_node')

        # --- 첫 번째 거북이(turtle1) 설정 ---
        self.publisher1_ = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)
        self.timer1 = self.create_timer(0.5, self.publish_turtle1_vel)
        
        # turtle1의 속도 값을 멤버 변수로 미리 생성
        self.velocity1_ = Twist()
        self.velocity1_.linear.x = 2.0
        self.velocity1_.angular.z = 1.0
        self.get_logger().info('Controlling turtle1...')

        # --- 두 번째 거북이(turtle2) 생성 및 설정 ---
        self.spawn_turtle2()

    def publish_turtle1_vel(self):
        # 미리 만들어 둔 속도 메시지를 발행
        self.publisher1_.publish(self.velocity1_)

    def publish_turtle2_vel(self):
        # turtle2가 생성된 후 만들어진 속도 메시지를 발행
        self.publisher2_.publish(self.velocity2_)

    def spawn_turtle2(self):
        # '/spawn' 서비스 클라이언트 생성
        client = self.create_client(Spawn, '/spawn')
        
        # 서비스가 준비될 때까지 1초씩 대기
        while not client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Spawn service not available, waiting...')
        
        # 요청 메시지 생성 및 값 설정
        request = Spawn.Request()
        request.x = 5.0
        request.y = 5.0
        request.theta = 0.0
        request.name = 'turtle2'

        # 서비스 요청을 보내고, 응답이 올 때까지 여기서 대기 (BLOCKING)
        future = client.call_async(request)
        rclpy.spin_until_future_complete(self, future)

        if future.result() is not None:
            # 서비스 요청 성공 시
            spawned_name = future.result().name
            self.get_logger().info(f'Successfully spawned turtle: {spawned_name}')
            
            # turtle2 제어를 위한 퍼블리셔와 타이머 생성
            self.publisher2_ = self.create_publisher(Twist, f'/{spawned_name}/cmd_vel', 10)
            self.timer2 = self.create_timer(0.5, self.publish_turtle2_vel)

            # turtle2의 속도 값을 멤버 변수로 생성
            self.velocity2_ = Twist()
            self.velocity2_.linear.x = 1.5
            self.velocity2_.angular.z = -1.0
            self.get_logger().info(f'Controlling {spawned_name}...')
        else:
            # 서비스 요청 실패 시
            self.get_logger().error('Failed to spawn turtle2.')

def main(args=None):
    rclpy.init(args=args)
    node = TurtleSpawner()
    # __init__ 메서드에서 모든 설정이 끝날 때까지 기다린 후 spin 시작
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()