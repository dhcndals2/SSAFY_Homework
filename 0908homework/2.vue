<script setup>
import { ref } from "vue";

const textColor = ref("black");

function handleClick() {
  textColor.value = "blue";
}
</script>

<template>
  <p class="text" :style="{ color: textColor }">글자</p>
  <button class="btn" @click="handleClick">blue</button>
</template>
