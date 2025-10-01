<script setup>
import { ref } from "vue";

const PASSWORD = "0000";

const members = ref([
  {
    id: 1,
    name: "이정민",
    position: "정보부장",
  },
  {
    id: 2,
    name: "강필규",
    position: "인사과장",
  },
  {
    id: 3,
    name: "여설하",
    position: "경호팀장",
  },
]);

const inputPW = ref("");

</script>

<template>
  <div>
    <template v-if="inputPW === PASSWORD">
      <ul>
        <li v-for="mem in members" :key="mem.id">
          <p>
            이름: {{ mem.name }}
          </p>
          <p>
            직책: {{ mem.position }}
          </p>
        </li>
      </ul>
    </template>
    <template v-else>
      <p>암호를 입력하세요.</p>
      <div>
        <input type="password" v-model="inputPW" />
      </div>
    </template>
  </div>
</template>