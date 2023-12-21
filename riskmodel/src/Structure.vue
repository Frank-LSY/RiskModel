<template>
  <div class="bg-amber-50 h-screen relative">
    <img
      src="@assets/img/gehong.jpg"
      class="absolute bottom-0 left-0 w-full opacity-5 z-0"
    />
    <div class="w-full h-dix bg-amber-200 relative">
      <img
        src="@assets/img/head-syzwb.png"
        class="absolute w-2/3 left-1/6 sm:w-1/2 sm:left-1/4 top-4 md:top-0 lg:top-4 xl:top-2"
      />
      <img src="@assets/img/huakuang.png" class="absolute h-full w-full" />
      <img
        src="@assets/img/bamboo.png"
        class="absolute bottom-3 md:bottom-4 right-6 md:right-16 h-2/3"
      />
    </div>
    <div
      class="w-full h-huit text-xl font-bold border-y-4 border-gray-100 flex flex-wrap justify-center content-center"
    >
      <div>基于大数据的疾病风险因素分析</div>
    </div>
    <div>
      <router-view
        v-slot="{ Component }"
        id="main"
        class="h-quatrevintdeux overflow-auto"
      >
        <!-- 切页面时导航栏不动 -->
        <keep-alive>
          <transition :name="transitionName" appear>
            <component :is="Component" />
          </transition>
        </keep-alive>
      </router-view>
    </div>

  </div>
</template>

<script setup>
import { onBeforeRouteUpdate } from "vue-router";
import { ref } from "vue";

// import { successMessage,errorMessage } from "./assets/js/common";

const transitionName = ref("slide-up");

onBeforeRouteUpdate((to, from) => {
  if (to.meta.index > from.meta.index) {
    transitionName.value = "slide-up";
  } else {
    transitionName.value = "slide-down";
  }
});
</script>

<style scoped>
.slide-down-enter-active,
.slide-down-leave-active,
.slide-up-enter-active,
.slide-up-leave-active {
  will-change: transform;
  transition: all 500ms;
  position: relative;
}
.slide-down-enter-from {
  opacity: 0;
  transform: translate3d(0, -10%, 0);
}
.slide-down-leave-active {
  opacity: 0;
  transform: translate3d(0, 10%, 0);
}
.slide-up-enter-from {
  opacity: 0;
  transform: translate3d(0, 10%, 0);
}
.slide-up-leave-active {
  opacity: 0;
  transform: translate3d(0, -10%, 0);
}
</style>
