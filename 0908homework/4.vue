<script setup>
import { ref } from "vue";


const text = ref("");
function handleClick(target) {
  text.value = target;
}
</script>

<template>
  <h1>{{ text }}</h1>
  <button @click="handleClick(3)">3</button>
  <button @click="handleClick(6)">6</button>
  <button @click="handleClick(9)">9</button>
</template>
