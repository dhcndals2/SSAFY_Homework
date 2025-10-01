<template>
  <div id="app-container">
    <h1>LED Remote Controller</h1>
    <div class="chat-window">
      <div class="messages-container">
        <div v-for="message in messages" :key="message.id" :class="['message', message.sender]">
          <p>{{ message.text }}</p>
        </div>
      </div>
      <form @submit.prevent="sendMessage" class="message-form">
        <input v-model="newMessage" type="text" placeholder="Type a message (e.g., 'turn green on')" />
        <button type="submit">Send</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';

const newMessage = ref('');
const messages = ref([
  {
    id: Date.now(),
    text: 'Hello! I can control a green and a yellow LED. How can I help you?',
    sender: 'bot'
  }
]);

const sendMessage = async () => {
  const userMessageText = newMessage.value.trim();
  if (!userMessageText) return;

  // Add user message to chat
  messages.value.push({
    id: Date.now(),
    text: userMessageText,
    sender: 'user'
  });

  // Clear input field
  newMessage.value = '';

  try {
    // Send message to backend
    const response = await axios.post('http://localhost:3000/chat', {
      message: userMessageText
    });

    // Add bot response to chat
    if (response.data && response.data.reply) {
      messages.value.push({
        id: Date.now() + 1, // Ensure unique key
        text: response.data.reply,
        sender: 'bot'
      });
    }

  } catch (error) {
    console.error('Error sending message:', error);
    // Add error message to chat
    messages.value.push({
      id: Date.now() + 1,
      text: 'Sorry, something went wrong. Please check the server connection.',
      sender: 'bot'
    });
  }
};
</script>

<style>
body {
  background-color: #f0f2f5;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

#app-container {
  width: 100%;
  max-width: 500px;
  height: 80vh;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

h1 {
  text-align: center;
  padding: 20px;
  margin: 0;
  font-size: 1.5em;
  border-bottom: 1px solid #eee;
  color: #333;
}

.chat-window {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  padding: 20px;
}

.messages-container {
  flex-grow: 1;
  overflow-y: auto;
  margin-bottom: 20px;
}

.message {
  margin-bottom: 15px;
  display: flex;
}

.message p {
  padding: 10px 15px;
  border-radius: 20px;
  max-width: 80%;
  word-wrap: break-word;
  margin: 0;
}

.message.user {
  justify-content: flex-end;
}

.message.user p {
  background-color: #007bff;
  color: white;
}

.message.bot p {
  background-color: #e9e9eb;
  color: #333;
}

.message-form {
  display: flex;
}

.message-form input {
  flex-grow: 1;
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 20px;
  margin-right: 10px;
  font-size: 1em;
}

.message-form button {
  padding: 10px 20px;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 20px;
  cursor: pointer;
  font-size: 1em;
}

.message-form button:hover {
  background-color: #0056b3;
}
</style>