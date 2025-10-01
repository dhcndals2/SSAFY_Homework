### turtlesim 파일 시스템 구조 분석

* **turtlesim 폴더 구성**
    * `CMakeLists.txt`: 빌드 설정 파일
    * `images`: 거북이, 배경 이미지 파일들이 있는 폴더
    * `include/turtlesim`: 헤더 파일(.hpp)들이 있는 폴더
    * `launch`: 실행 관련 설정(.launch.py) 파일들이 있는 폴더
    * `msg`: 사용자 정의 메시지(.msg) 파일들이 있는 폴더 (Color, Pose)
    * `package.xml`: 패키지 정보 파일
    * `srv`: 서비스(.srv) 파일들이 있는 폴더
    * `src`: 소스 코드(.cpp) 파일들이 있는 폴더

* **images, launch, msg 폴더 안의 파일**
    * `images`: box-turtle.png, turt1le.svg 등 거북이 모양과 배경 관련 이미지 파일
    * `launch`: multisim.launch.py, turtlesim_joy.launch.py 등 여러 노드를 동시에 실행하기 위한 launch 파일
    * `msg`: Color.msg, Pose.msg

* **Color.msg에 포함된 데이터**
    * `uint8 r`
    * `uint8 g`
    * `uint8 b`
    * (0-255 범위의 RGB 색상 값을 담기 위한 데이터 타입)

* **Pose.msg에 포함된 데이터**
    * `float32 x`
    * `float32 y`
    * `float32 theta`
    * `float32 linear_velocity`
    * `float32 angular_velocity`
    * (거북이의 2D 평면상 위치(x, y), 방향(theta), 선속도, 각속도 정보를 담는 데이터 타입)

* **ROS2에서 지원하는 데이터 타입 종류 (기본 타입)**
    * `bool`
    * `byte`
    * `char`
    * `float32`, `float64`
    * `int8`, `uint8`
    * `int16`, `uint16`
    * `int32`, `uint32`
    * `int64`, `uint64`
    * `string`
    * 이 외에도 배열(array), 동적 배열(unbounded array) 등을 조합하여 사용 가능

### turtlesim 실행 및 키보드 조작

* **turtlesim 실행**
    1.  첫 번째 터미널: `ros2 run turtlesim turtlesim_node` (시뮬레이터 창 실행)
    2.  두 번째 터미널: `ros2 run turtlesim turtle_teleop_key` (키보드 입력 노드 실행)
    3.  두 번째 터미널에 포커스를 맞추고 화살표 키로 거북이를 조종

### 키보드 입력 관련 파일

* **파일 위치**: `turtlesim` 패키지 소스 코드의 `src/turtle_teleop_key.cpp` 파일
* (이 C++ 파일은 키보드 입력을 감지하여 거북이의 속도를 제어하는 `/turtle1/cmd_vel` 토픽으로 메시지를 발행하는 로직을 포함합니다.)

### 직선 이동 거리 2배로 늘리기 위해 변경해야 하는 변수

* **변수명**: `linear_` 
* **위치**: `src/turtle_teleop_key.cpp` 파일 내
* (현재는 1.0 또는 -1.0으로 2배 움직이고 싶다면 2.0 또는 -2.0으로 변경한다.)