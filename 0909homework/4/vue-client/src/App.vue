<script setup>
import { ref } from "vue";

// --- 상태 관리 (State) ---
const nickname = ref("");
const currentMessage = ref("");
const chatHistory = ref([]);
const isNicknameLocked = ref(false); // 닉네임 입력창의 잠금 상태

// --- WebSocket 연결 ---
const SOCKET_URL = import.meta.env.VITE_SOCKET_URL;
const socket = new WebSocket(SOCKET_URL);

socket.onopen = () => {
  console.log("서버에 성공적으로 연결되었습니다.");
};

socket.onmessage = async (event) => {
  const messageString = await event.data.text();
  const receivedObject = JSON.parse(messageString);

  if (receivedObject.nickname === nickname.value) {
    return;
  }

  const messageWithId = {
    ...receivedObject,
    id: crypto.randomUUID(),
  };
  chatHistory.value.push(messageWithId);
};

socket.onclose = () => {
  console.log("서버와의 연결이 종료되었습니다.");
};

socket.onerror = (error) => {
  console.error("WebSocket 오류 발생:", error);
};

/**
 * 닉네임을 확정하고 입력창을 잠그는 함수
 */
function confirmNickname() {
  const trimmedNickname = nickname.value.trim();
  if (!trimmedNickname) {
    alert("닉네임을 한 글자 이상 입력해주세요.");
    return;
  }
  isNicknameLocked.value = true;
}

/**
 * 채팅 메시지를 전송하는 함수
 */
function sendChatMessage() {
  if (!isNicknameLocked.value) {
    alert("먼저 닉네임을 확정해주세요.");
    return;
  }

  const trimmedMessage = currentMessage.value.trim();
  if (!trimmedMessage) {
    return;
  }

  const payload = {
    nickname: nickname.value,
    text: trimmedMessage,
  };

  socket.send(JSON.stringify(payload));

  const messageForHistory = {
    id: crypto.randomUUID(),
    nickname: nickname.value,
    text: trimmedMessage,
  };
  chatHistory.value.push(messageForHistory);

  currentMessage.value = "";
}
</script>

<template>
  <div>
    <div>
      <input 
        type="text" 
        v-model="nickname" 
        placeholder="닉네임을 입력하세요"
        :disabled="isNicknameLocked" 
      />
      <button @click="confirmNickname" :disabled="isNicknameLocked">확정</button>
    </div>

    <hr>

    <div>
      <input 
        type="text" 
        v-model="currentMessage" 
        placeholder="메시지를 입력하세요..."
        @keydown.enter="sendChatMessage"
      />
      <button @click="sendChatMessage">보내기</button>
    </div>

    <hr>

    <div style="height: 400px; border: 1px solid black; overflow-y: auto; padding: 10px;">
      <div v-for="chat in chatHistory" :key="chat.id">
        <span>{{ chat.nickname }}: </span>
        <span>{{ chat.text }}</span>
      </div>
    </div>
  </div>
</template>