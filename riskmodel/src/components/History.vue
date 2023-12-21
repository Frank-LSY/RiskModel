<template>
  <div class="flex flex-wrap justify-center content-center relative">
    <button
      class="absolute top-0 left-2 bg-amber-300 px-1 rounded z-50 font-semibold"
      @click="goBack"
    >
      返回
    </button>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto text-gray-600 font-semibold h-douze bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg flex flex-wrap justify-center content-evenly text-center"
    >
      <div class="w-2/3">姓名: 测试</div>
      <div class="w-2/3">性别: 女性</div>
      <div class="w-2/3">年龄: 38</div>
    </div>
    <div class="h-cinq w-5/6 sm:w-2/3 flex flex-wrap content-center z-30">
      <div class="text-sm md:text-base text-gray-600 font-semibold">
        以下是您基于您的问卷信息得到的疾病风险评估及分析:
      </div>
    </div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto relative h-soixante bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg grid grid-cols-12"
    >
      <div
        class="h-full bg-gradient-to-b from-emerald-400 to-rose-500 flex flex-wrap justify-center content-between rounded font-bold text-sm md:text-base text-center text-gray-100"
      >
        <div class="w-full">低风险</div>
        <div class="w-full">高风险</div>
      </div>
      <div
        class="col-span-11 text-center divide-y-4 divide-double divide-gray-200"
      >
        <div class="flex flex-wrap justify-evenly w-full">
          <div class="text-gray-600 font-semibold mt-2">癌症风险:</div>
          <div class="flex flex-wrap justify-evenly w-full my-3">
            <div
              v-for="(item, i) in cancer"
              :key="i"
              :style="{
                'background-color': state2Color[item.severity],
              }"
              class="w-1/4 mx-0.5 my-1 px-1 py-1 border-2 border-gray-400 rounded text-sm md:text-base text-gray-100 font-semibold shadow-lg cursor-pointer"
              @click="showDetail(item)"
            >
              {{ item.name }}
            </div>
          </div>
        </div>

        <div class="flex flex-wrap justify-evenly">
          <div class="text-gray-600 font-semibold mt-2">慢性病风险:</div>
          <div class="flex flex-wrap justify-evenly w-full my-3">
            <div
              v-for="(item, i) in chronic"
              :key="i"
              :style="{
                'background-color': state2Color[item.severity],
              }"
              class="w-1/4 mx-0.5 my-1 px-1 py-1 border-2 border-gray-400 rounded text-sm md:text-base text-gray-100 font-semibold shadow-lg cursor-pointer"
              @click="showDetail(item)"
            >
              {{ item.name }}
            </div>
          </div>
        </div>
        <div
          class="flex flex-wrap justify-evenly text-gray-400 font-semibold text-start"
        >
          <div class="w-3/4">* 点击以查看具体风险</div>
          <div class="w-3/4">
            *
            该报告完全根据您的问卷信息生成，仅指出您的相关疾病风险及因素。<span
              class="hidden sm:inline"
              >受本问卷所限，本报告可能无法列出所有可能升高您疾病风险的因素，也不代表您罹患报告中未提及的疾病风险较低。</span
            >
          </div>
        </div>
      </div>
    </div>
    <disease-risk v-if="diseaseDialog" class="animatecss animatecss-fadeIn" @close-detail="closeDetailDialog">
    </disease-risk>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { infoMessage, warningMessage } from "@/assets/js/common";
import DiseaseRisk from "./DiseaseRisk.vue";

const router = useRouter();
const store = useStore();

const goBack = () => {
  router.push("query");
};

const diseaseDialog = ref(false);
const showDetail = (item) => {
  console.log(item.name);
  console.log(diseaseDialog.value);
  store.commit("changeCurrentDisease", item);
  diseaseDialog.value = true;
};
const closeDetailDialog = (val)=> {
  store.commit("changeCurrentDisease", {});
  diseaseDialog.value = val
}

onMounted(() => {
  if (store.getters.getLogin === false) {
    infoMessage("未登录");
    goBack();
  }
});

const cancer = [
  {
    name: "膀胱癌",
    severity: "1",
  },
  {
    name: "乳腺癌",
    severity: "2",
  },
  {
    name: "宫颈癌",
    severity: "3",
  },
  {
    name: "大肠癌",
    severity: "4",
  },
  {
    name: "肾癌",
    severity: "5",
  },
  {
    name: "肺癌√",
    severity: "6",
  },
  {
    name: "黑色素瘤",
    severity: "7",
  },
  {
    name: "卵巢癌",
    severity: "6",
  },
  {
    name: "胰腺癌",
    severity: "5",
  },
  {
    name: "前列腺癌",
    severity: "4",
  },
  {
    name: "胃癌",
    severity: "3",
  },
  {
    name: "子宫癌",
    severity: "2",
  },
];

const chronic = [
  {
    name: "支气管炎/肺气肿",
    severity: "1",
  },
  {
    name: "糖尿病",
    severity: "6",
  },
  {
    name: "心血管疾病",
    severity: "5",
  },
  {
    name: "骨质疏松",
    severity: "1",
  },
  {
    name: "中风",
    severity: "7",
  },
];

const state2Color = {
  1: "#34d499",
  2: "#5cb48d",
  3: "#789f84",
  4: "#9a847a",
  5: "#be696f",
  6: "#d35868",
  7: "#f43f5e",
};
</script>
