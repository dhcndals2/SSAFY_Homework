<script setup>
import { ref } from "vue";

const todos = ref([
  {
    id: 1,
    title: "밥먹기",
    isComplete: false,
  },
  {
    id: 2,
    title: "영화보기",
    isComplete: false,
  },
  {
    id: 3,
    title: "차마시기",
    isComplete: true,
  },
]);

</script>
 
<template>
  <div>
    <template v-for="todo in todos" :key="todo.id">
      <template v-if="!todo.isComplete">
        <li>
            {{ todo.title }}
        </li>
      </template>
    </template>
  </div>
</template>
