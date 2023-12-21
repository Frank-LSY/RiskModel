<template>
  <div
    class="absolute top-6 left-1/24 w-11/12 h-soixantedixhuit bg-gray-200 bg-opacity-90 rounded-2xl shadow-lg z-50 divide-y-4 divide-double divide-gray-100"
  >
    <!-- 标题 -->
    <div
      class="w-full flex flex-wrap justify-center text-gray-700 font-semibold"
    >
      <div class="text-left w-2/3 my-1">
        您的
        <span class="text-amber-500">{{
          store.getters.getCurrentDisease["name"]
        }}</span>
        风险为:
      </div>
      <div
        class="text-center w-3/4 my-1 py-0.5 text-gray-100 rounded shadow shadow-amber-400 border-2 border-amber-400"
        :style="{
          'background-color': state2Color[severity],
        }"
      >
        {{ state2description() }}
      </div>
    </div>
    <!-- 色条 -->
    <div
      class="w-full flex flex-wrap justify-center content-start text-gray-700 font-semibold pt-2"
    >
      <div
        class="w-5/6 h-cinq bg-gradient-to-r from-emerald-400 to-rose-500 rounded text-gray-100 font-semibold flex flex-wrap justify-between content-center"
      >
        <div  class="px-1">低风险</div>
        <div class="px-1">高风险</div>
      </div>
      <div class="w-5/6 grid grid-cols-7 mt-0.5">
        <div v-for="(n, i) of severity_num"></div>
        <div class=" flex flex-wrap justify-evenly content-start">
          <img src="@assets/img/arrow.png" class=" h-4" />
          <div class=" text-xs md:text-base font-semibold">
            当前风险
          </div>
        </div>
      </div>
    </div>
    <!-- 选项块 -->
    <div class=""></div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";

const router = useRouter();
const store = useStore();

const severity = ref("");
const severity_num = ref(0);

const state2description = () => {
  var diseaseRisk = "";
  switch (severity.value) {
    case "1":
      diseaseRisk = "风险远远低于平均水平 (风险---)";
      break;
    case "2":
      diseaseRisk = "风险远低于平均水平 (风险--)";
      break;
    case "3":
      diseaseRisk = "风险低于平均水平 (风险-)";
      break;
    case "4":
      diseaseRisk = "风险远约为平均水平 (风险)";
      break;
    case "5":
      diseaseRisk = "风险高于平均水平 (风险+)";
      break;
    case "6":
      diseaseRisk = "风险远高于平均水平 (风险++)";
      break;
    case "7":
      diseaseRisk = "风险远远高于平均水平 (风险+++)";
      break;
  }
  return diseaseRisk;
};

const state2Color = {
  1: "#34d499",
  2: "#5cb48d",
  3: "#789f84",
  4: "#9a847a",
  5: "#be696f",
  6: "#d35868",
  7: "#f43f5e",
};

onMounted(() => {
  severity.value = store.getters.getCurrentDisease["severity"];
  severity_num.value = Number(severity.value) - 1;
});
</script>
