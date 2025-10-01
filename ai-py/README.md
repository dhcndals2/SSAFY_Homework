# PJT4. 대화형 Remote Controller 제작

## 1. 프로젝트 개요

[cite_start]본 프로젝트는 Vue.js로 구성된 웹 컨트롤러 화면을 통해 사용자와의 대화를 기반으로 Raspberry Pi 5의 LED를 제어하는 시스템을 구축합니다. [cite: 4, 5] [cite_start]Node.js와 Express를 사용하여 백엔드 서버를 구성하고, OpenAI API를 연동하여 자연어 처리 챗봇 기능을 구현합니다. [cite: 3, 20] [cite_start]서버는 사용자의 명령어에 따라 Python `gpiozero` 라이브러리를 호출하여 실제 하드웨어를 조작합니다. [cite: 5, 21, 55]

<br>

## 2. 주요 기능 명세서

### 필수 기능

| 번호 | 분류 | 요구사항명 | 상세 내용 |
| :---: | :---: | :---: | :--- |
| 01 | 챗봇 | 챗봇 화면 | 사용자와의 채팅을 위한 웹 UI를 구현합니다. |
| 02 | 챗봇 | 답변 요청 | 사용자의 질문을 서버로 전송하는 기능을 구현합니다. |
| 03 | API | 답변 API | OpenAI API를 연동하여 사용자의 질문에 대한 답변을 생성합니다. |
| 04 | API | 프롬프트 엔지니어링 | 챗봇이 LED 제어 등 정해진 답변만 하도록 시스템 프롬프트를 구성합니다. |
| 05 | 라즈베리파이 | 라즈베리파이 LED 조작 | `gpiozero` 라이브러리를 활용하여 LED를 ON/OFF하는 Python 스크립트를 작성합니다. |
| 06 | 통합 | 챗봇으로 LED 조작 | 사용자의 채팅 입력을 해석하여 ("green on", "yellow off" 등) LED를 제어합니다. |

### 선택 기능

| 번호 | 분류 | 요구사항명 | 상세 내용 |
| :---: | :---: | :---: | :--- |
| 07 | 챗봇 | 챗봇 화면 개선 | "LED를 켰습니다" 와 같이 딱딱한 답변이 아닌, 자연스러운 언어로 답변하도록 구현합니다. |
| 08 | API | 기타 부품 조작 | LED 외에 다른 부품(모터, 센서 등)을 챗봇으로 원격 조작하도록 기능을 확장합니다. |

<br>

## 3. 기술 스택

-   [cite_start]**Frontend**: `Vue.js` [cite: 8]
-   [cite_start]**Backend**: `Node.js`, `Express` [cite: 8, 20]
-   [cite_start]**Hardware Control**: `Python` [cite: 5]
-   [cite_start]**Libraries**: `OpenAI API`, `gpiozero` [cite: 10]
-   [cite_start]**Hardware**: `Raspberry Pi 5` [cite: 8]
-   [cite_start]**Development Tools**: `VSCode`, `Google Chrome` [cite: 8]

<br>

## 4. 시스템 아키텍처

1.  **Frontend (Vue.js)**
    -   사용자 인터페이스(채팅창) 제공
    -   사용자 입력(질문)을 Backend API 서버로 전송

2.  **Backend (Node.js)**
    -   Frontend로부터 API 요청 수신
    -   OpenAI API를 호출하여 사용자 질문에 대한 응답 생성
    -   명령어가 LED 제어 관련일 경우, Python 스크립트를 실행하여 하드웨어 조작

3.  **Hardware Control (Python)**
    -   Node.js 서버의 호출을 받아 `gpiozero` 라이브러리로 라즈베리파이의 GPIO 핀을 제어

<br>

## 5. 하드웨어 구성

라즈베리파이의 GPIO 핀을 사용하여 아래와 같이 두 개의 LED를 브레드보드에 연결합니다.

-   [cite_start]**초록색 LED**: `GPIO 21` --- 저항 --- LED --- `GND` [cite: 54]
-   [cite_start]**노란색 LED**: `GPIO 3` --- 저항 --- LED --- `GND` [cite: 55]


<br>

## 6. 설치 및 실행 방법

1.  **Git 저장소 복제**
    ```bash
    git clone [저장소 URL]
    cd [프로젝트 폴더]
    ```

2.  **백엔드 서버 설정 (Node.js)**
    ```bash
    # 의존성 패키지 설치
    npm install

    # 서버 실행
    node server.js
    ```
    * `.env` 파일에 OpenAI API 키를 설정해야 합니다.

3.  **프론트엔드 설정 (Vue.js)**
    ```bash
    # 의존성 패키지 설치
    npm install

    # 개발 서버 실행
    npm run serve
    ```

4.  **Python 스크립트 설정**
    -   라즈베리파이에 `gpiozero` 라이브러리가 설치되어 있는지 확인합니다.
    ```bash
    pip install gpiozero
    ```

<br>

## 7. 팀원 정보

| 학번 | 이름 | 역할 |
| :-----: | :---: | :---------: |
| 1414578 | 오충민 | Frontend, API 연동 |
| 1413693 | 김보경 | Backend, 하드웨어 제어 |