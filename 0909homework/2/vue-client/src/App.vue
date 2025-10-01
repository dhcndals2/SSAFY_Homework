<script setup>
import { ref } from "vue";

const SOCKET_URL = import.meta.env.VITE_SOCKET_URL;

const message = ref("");
const receivedMessage = ref("");

const socket = new WebSocket(SOCKET_URL);

socket.onopen = () => {
  console.log("Connected to the server");
};

// 서버에서 메시지를 받으면 출력
socket.onmessage = async (event) => {
  const text = await event.data.text();
  console.log(text);
  receivedMessage.value = text;
};

socket.onclose = () => {
  console.log("Disconnected from the server");
};

socket.onerror = (event) => {
  console.error("WebSocket error:", event);
};

function sendMessage(msg) {
  try {
    socket.send(msg);
  } catch (error) {
    console.error(error);
  }
}

function handleInput(event){
  const nxtText = event.target.value;
  message.value = nxtText;
  sendMessage(nxtText);
}
</script>

<template>
  <input type="text" :value="message" @input="handleInput"/>
  <!-- <button @click="sendMessage">보내기</button> -->
  <h4>{{ receivedMessage }}</h4>
</template>