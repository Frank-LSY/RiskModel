<template>
  <div class="flex flex-wrap justify-center relative">
    <div
      class="absolute left-0 top-0 p-2 z-50"
      @click="changeStyle"
    ></div>
    <img
      src="@assets/img/bg-large.jpg"
      class="absolute top-0 left-0 w-full h-full opacity-0 lg:opacity-10 z-0" v-if="store.getters.getChineseStyle"
    />
    <router-view
      class="w-full md:w-full bg-amber-50 lg:w-1/2 xl:w-2/5 shadow-lg z-10"
    ></router-view>
  </div>
</template>

<script setup>
import { useStore } from "vuex";

const store = useStore();

const changeStyle = () => {
  store.commit("changeChineseStyle", !store.getters.getChineseStyle);
  console.log(store.getters.getChineseStyle)
};
</script>
