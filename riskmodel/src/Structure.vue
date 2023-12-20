<template>
  <div class="bg-sky-50 h-screen">
    <div
      class="w-full h-cinquante bg-amber-200 relative"
    >
      <img src="@assets/img/head-syzwb.png" class="absolute left-1/6 w-2/3 top-4" />
      <img src="@assets/img/huakuang.png" class=" absolute h-full w-full" />
      <img src="@assets/img/bamboo.png" class=" absolute bottom-2 right-6 h-full" />
    </div>
    <div
      class="w-full h-cinquante text-3xl font-bold border-y-4 border-gray-100 flex flex-wrap justify-center content-center"
    >
      <div>疾病风险因素分析</div>
    </div>
    <div>
      <router-view
        v-slot="{ Component }"
        id="main"
        class="h-soixantedix overflow-auto"
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