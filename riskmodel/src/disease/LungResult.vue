<template>
  <div class="w-full py-2 flex flex-wrap justify-center">
    <div class="w-5/6 text-gray-700 font-semibold grid grid-cols-3">
      <div>
        您
        <span
          :style="{
            'background-color': status2Color(status),
          }"
          class="px-1 text-gray-50 py-0.5 rounded shadow-lg"
          >{{ statusChinese(status) }}</span
        >
      </div>
      <div v-if="status !== 'never'" class="col-span-2 sm:col-span-1">
        您<span v-if="status === 'former'">曾</span>是
        <span
          :style="{
            'background-color': intensity2Color(intensity),
          }"
          class="px-1 text-gray-50 py-0.5 rounded shadow-lg"
        >
          {{ intensityChinese(intensity) }}
        </span>
      </div>
      <div class="col-span-3 sm:col-span-2">
        您的5年期肺癌风险为
        <span
          :style="{
            'background-color':
              score <= 0
                ? state2Color[1]
                : score < 8
                ? state2Color[Math.ceil(score)]
                : state2Color[7],
          }"
          class="px-1 text-gray-50 py-0.5 rounded shadow-lg"
          >{{ probability }}%</span
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeMount } from "vue";
import API from "@/api";
import { useStore } from "vuex";
import { infoMessage } from "@/assets/js/common";

const store = useStore();
const status = ref("");
const intensity = ref("");
const probability = ref(0);
const score = ref(0);

const statusChinese = (status) => {
  var status_chinese = "";
  switch (status) {
    case "never":
      status_chinese = "不吸烟";
      break;
    case "former":
      status_chinese = "已戒烟";
      break;
    case "current":
      status_chinese = "仍在吸烟";
      break;
  }
  return status_chinese;
};

const status2Color = (status) => {
  if (status === "current") {
    return "#f43f5e";
  } else {
    return "#64d179";
  }
};

const intensityChinese = (intensity) => {
  var inten_chinese = "";
  switch (intensity) {
    case "NEVER":
      inten_chinese = "不吸烟者";
      break;
    case "LIGHT":
      inten_chinese = "轻度吸烟者";
      break;
    case "HEAVY":
      inten_chinese = "重度吸烟者";
      break;
  }
  return inten_chinese;
};

const intensity2Color = (intensity) => {
  var color = "";
  switch (intensity) {
    case "NEVER":
      color = "#64d179";
      break;
    case "LIGHT":
      color = "#f9ac26";
      break;
    case "HEAVY":
      color = "#f43f5e";
      break;
  }
  return color;
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

onBeforeMount(() => {
  
  API.lungDetails({
    pollId: store.getters.getCurrentPollId,
  })
    .then((res) => {
      status.value = res.data[0].status;
      intensity.value = res.data[0].intensity;
      probability.value = res.data[0].probability;
      score.value = res.data[0].score;
      store.commit("changeLungStatus", intensity.value);
    })
    .catch((err) => {
      infoMessage(err);
    });
});

onMounted(() => {});
</script>
