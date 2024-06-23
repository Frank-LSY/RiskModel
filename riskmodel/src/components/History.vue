<template>
  <div class="flex flex-wrap justify-center content-center relative">
    <button
      class="absolute top-0 left-2 bg-amber-300 px-1 rounded z-50 font-semibold text-gray-700"
      @click="goBack"
    >
      返回
    </button>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto text-gray-600 font-semibold h-douze bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg flex flex-wrap justify-center content-evenly text-center"
    >
      <div class="w-2/3">姓名: {{ store.getters.getCurrentUser.userName }}</div>
      <div class="w-2/3">性别: {{ store.getters.getCurrentUser.sex }}</div>
      <div class="w-2/3">年龄: {{ store.getters.getCurrentUser.age }}</div>
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
        class="h-full bg-gradient-to-b from-emerald-400 via-yellow-400 to-rose-500 flex flex-wrap justify-center content-between rounded font-bold text-sm md:text-base text-center text-gray-100"
      >
        <div class="w-full">低风险</div>
        <div class="w-full">高风险</div>
      </div>
      <div
        class="col-span-11 text-center divide-y-4 divide-double divide-gray-200"
        v-if="store.getters.getCurrentPoll.length !== 0"
      >
        <div class="flex flex-wrap justify-evenly w-full">
          <div class="text-gray-600 font-semibold mt-2">癌症风险:</div>
          <div class="flex flex-wrap justify-evenly w-full my-3">
            <div
              v-for="i in cancerOrder"
              :key="i"
              :style="{
                'background-color': score2Color(
                  store.getters.getCurrentPoll[i]['riskScore']
                ),
              }"
              class="w-1/4 mx-0.5 my-1 px-1 py-1 border-2 border-gray-400 rounded text-sm md:text-base text-gray-100 font-semibold shadow-lg cursor-pointer"
              @click="showDetail(store.getters.getCurrentPoll[i])"
            >
              {{ store.getters.getCurrentPoll[i]["diseaseName"] }}
            </div>
          </div>
        </div>

        <div class="flex flex-wrap justify-evenly">
          <div class="text-gray-600 font-semibold mt-2">慢性病风险:</div>
          <div class="flex flex-wrap justify-evenly w-full my-3">
            <div
              v-for="i in chronicOrder"
              :key="i"
              :style="{
                'background-color': score2Color(
                  store.getters.getCurrentPoll[i]['riskScore']
                ),
              }"
              class="w-1/4 mx-0.5 my-1 px-1 py-1 border-2 border-gray-400 rounded text-sm md:text-base text-gray-100 font-semibold shadow-lg cursor-pointer"
              @click="showDetail(store.getters.getCurrentPoll[i])"
            >
              {{ store.getters.getCurrentPoll[i]["diseaseName"] }}
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
    <disease-risk
      v-if="diseaseDialog"
      class="animatecss animatecss-fadeIn"
      @close-detail="closeDetailDialog"
    >
    </disease-risk>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { infoMessage, warningMessage } from "@/assets/js/common";
import DiseaseRisk from "./DiseaseRisk.vue";
import API from "@/api.js";

const router = useRouter();
const store = useStore();

const goBack = () => {
  router.push("query");
};

const diseaseDialog = ref(false);
const showDetail = (item) => {
  API.pollRisks({
    pollId: store.getters.getCurrentPollId,
    diseaseId: item.diseaseId,
  }).then((res) => {
    console.log(res.data);
    store.commit("changeCurrentDetails", res.data);
    store.commit("changeCurrentDisease", {
      name: item.diseaseName,
      id: item.diseaseId,
      riskScore: Math.ceil(item.riskScore),
    });
    diseaseDialog.value = true;
  });
};
const closeDetailDialog = (val) => {
  store.commit("changeCurrentDisease", {});
  diseaseDialog.value = val;
};

onMounted(() => {
  if (store.getters.getLogin === false) {
    infoMessage("未登录");
    goBack();
  }
});

const cancerOrder = [10, 4, 5, 11, 13, 15, 8, 2, 12, 7, 16, 3];
const chronicOrder = [0, 9, 6, 1, 14];

const score2Color = (score) => {
  if (score < 1) {
    return state2Color[1];
  } else {
    return state2Color[Math.ceil(score)];
  }
};
const state2Color = {
  1: "#34d499",
  2: "#64d179",
  3: "#9fcf52",
  4: "#facc15",
  5: "#f9ac26",
  6: "#f67841",
  7: "#f43f5e",
};
</script>
