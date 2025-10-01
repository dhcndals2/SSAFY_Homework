<script setup>
import { ref } from "vue";

//입력
const userheight =ref(100);
const userwidth =ref(100);

//출력
const firstheight =ref("100px");
const firstwidth =ref("100px");

function handleClick() {
  if(userheight.value<0)
{
  userheight.value=0;
}
if(userwidth.value<0)
{
  userwidth.value=0;
}
  firstheight.value =`${userheight.value}px`;
  firstwidth.value =`${userwidth.value}px`;
}
</script>

<template>
  높이<input type="number" v-model="userheight"></input>
  <div></div>
  너비<input type="number" v-model="userwidth"></input>
  <div></div>
  <button @click="handleClick">설정</button>
  <div class="box" :style="{height: firstheight, width:firstwidth}">

  </div>
</template>

<style scoped>
.box{
  margin:10px;
  border: 1px solid black;
}
</style>