<template>
  <div
    class="absolute top-6 left-1/24 w-11/12 h-soixantedixhuit bg-gray-200 z-40"
  >
    <img
      src="@assets/img/gehong.jpg"
      class="absolute bottom-0 left-0 w-full opacity-10 z-0"
      v-if="store.getters.getChineseStyle"
    />
    <div
      class="w-full overflow-auto h-soixantedixhuit rounded-2xl shadow-lg z-50 divide-y-4 divide-double divide-gray-100"
    >
      <div
        class="absolute right-2 top-2 text-xl font-bold cursor-pointer select-none"
        @click="closeDetail"
      >
        X
      </div>
      <!-- 标题 -->
      <div
        class="w-full flex flex-wrap justify-center text-gray-700 font-semibold"
      >
        <div class="text-left w-5/6 my-1">
          您的
          <span class="text-amber-500">{{
            store.getters.getCurrentDisease["name"]
          }}</span>
          风险为:
        </div>
        <div
          class="text-center w-5/6 my-1 py-0.5 text-gray-100 rounded shadow shadow-amber-400 border-2 border-gray-400"
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
          class="w-5/6 h-cinq bg-gradient-to-r from-emerald-400 to-rose-500 rounded text-gray-100 font-semibold flex flex-wrap justify-between content-center border-2 border-gray-400"
        >
          <div class="px-1">低风险</div>
          <div class="px-1">高风险</div>
        </div>
        <div class="w-11/12 grid grid-cols-7 mt-0.5">
          <div v-for="(n, i) of severity_num"></div>
          <div class="flex flex-wrap justify-center content-start">
            <img src="@assets/img/arrow.png" class="h-4" />
            <div class="text-xs md:text-base font-semibold">您在这</div>
          </div>
        </div>
      </div>
      <!-- 选项块 -->
      <div class="w-full flex flex-wrap justify-evenly content-start relative">
        <button
          class="absolute top-0 right-2 bg-amber-300 px-1 rounded z-50 font-semibold text-gray-700"
          v-if="isChanged"
          @click="resetRisk"
        >
          重置
        </button>
        <div class="w-5/6 text-start text-gray-700 font-semibold">
          您的风险因素如下:
          <span class="text-gray-400 text-sm">(点击可改变以查看)</span>
        </div>
        <div
          v-for="(item, i) in showContribution"
          :key="i"
          class="w-5/6 flex flex-wrap justify-end font-semibold"
        >
          <div
            class="relative w-full rounded shadow-lg text-gray-50 pl-2 my-0.5 border-2 border-gray-400 cursor-pointer select-none"
            :style="{ 'background-color': calculateColor(item.risk) }"
          >
            <div @click="showChange(item, i)">{{ item.name }}</div>
            <div
              class="absolute left-0 w-full flex flex-wrap z-50 bg-gray-200 bg-opacity-90 animatecss animatecss-fadeIn"
              v-if="changeSelect === i"
            >
              <div
                v-for="(it, j) in item.change"
                :key="j"
                class="w-full rounded shadow-lg text-gray-50 pl-2 border-2 border-gray-400 cursor-pointer select-none"
                :style="{
                  'background-color': calculateChangedColor(item.risk, it.risk),
                  opacity: '70%',
                }"
                @click="changeRisk(i, it)"
              >
                {{ it.name }}
              </div>
              <!-- {{ item.change }} -->
            </div>
          </div>
          <div
            class="w-1/3 text-center border-2 border-gray-400 rounded shadow text-gray-700 text-sm md:text-base"
          >
            {{ item.RR }}
          </div>
        </div>
      </div>
      <!-- 雷达图 -->
      <Radar></Radar>
      <!-- 说明 -->
      <Declare></Declare>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, defineEmits } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { infoMessage, warningMessage } from "@/assets/js/common";

import Radar from "@charts/Radar.vue";
import Declare from "@disease/Declare.vue"

const router = useRouter();
const store = useStore();

// 点击关闭
const emit = defineEmits(["closeDetail"]);
const closeDetail = () => {
  let showDetail = false;
  emit("closeDetail", showDetail);
};

// 严重程度
const severity = ref("");
const severity_num = ref(0);

// 页面展示的风险
const showContribution = ref([]);

// 改变风险
// 是否有页面上的改变
const isChanged = ref(false);
const changeSelect = ref(-1);
// 重置风险因素
const resetRisk = () => {
  isChanged.value = false;
  severity_num.value = Number(severity.value) - 1;
  changeSelect.value = -1;
  // showContribution.value = []
  showContribution.value = JSON.parse(JSON.stringify(contribution));
};
const currentItem = ref({});
// 展示可改变的项目
const showChange = (item, i) => {
  if (item.change.length === 0) {
    infoMessage("该风险因素无法改变！");
    return;
  }
  currentItem.value = item;
  if (changeSelect.value === i) {
    changeSelect.value = -1;
  } else {
    changeSelect.value = i;
  }
};
// 改变某一风险因素
const changeRisk = (index, neoItem) => {
  changeSelect.value = ref(-1);
  isChanged.value = true;
  showContribution.value[index]["name"] = neoItem["name"];
  var riskDiff = neoItem["risk"] - showContribution.value[index]["risk"];
  if (riskDiff > 0) {
    showContribution.value[index]["RR"] =
      "RR = " + showContribution.value[index]["risk"] + " + " + riskDiff;
  } else {
    showContribution.value[index]["RR"] =
      "RR = " + showContribution.value[index]["risk"] + " - " + Math.abs(riskDiff);
  }
  showContribution.value[index]["risk"] = neoItem["risk"];
  showContribution.value[index]["change"] = neoItem["change"];
  severity_num.value = Math.floor(Math.random() * 7)
};

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

const contribution = [
  {
    name: "吸烟，每天约一包",
    risk: 5.0,
    RR: "RR = 5",
    change: [
      {
        name: "吸烟，每天约两包",
        risk: 10.0,
        RR: "RR = 10",
        change: [],
      },
      {
        name: "吸烟，每天约半包",
        risk: 2.0,
        RR: "RR = 2",
        change: [],
      },
      {
        name: "持续戒烟，超过两年",
        risk: 3.5,
        RR: "RR = 3.5",
        change: [],
      },
      {
        name: "持续戒烟，超过十年",
        risk: 2.0,
        RR: "RR = 2",
        change: [],
      },
    ],
  },
  {
    name: "职业暴露，化学品，小于5年",
    risk: 2.0,
    RR: "RR = 2",
    change: [
      {
        name: "职业暴露，化学品，大于5年",
        risk: 5.0,
        RR: "RR = 5",
      },
      {
        name: "职业暴露，化学品，大于20年",
        risk: 10.0,
        RR: "RR = 10",
      },
    ],
  },
  {
    name: "在大城市中生活，大于10年",
    risk: 1.2,
    RR: "RR = 1.2",
    change: [],
  },
  {
    name: "直系亲属患有肺癌",
    risk: 1.5,
    RR: "RR = 1.5",
    change: [],
  },
];

const calculateColor = (risk) => {
  var color = Math.ceil(Math.log(risk) + 4);
  if (color > 0) {
    return state2Color[color];
  } else {
    return state2Color[1];
  }
};

const calculateChangedColor = (risk, neoRisk) => {
  var color = Math.ceil(neoRisk - risk + 4);
  if (color > 7) {
    return state2Color[7];
  } else if (color > 0) {
    return state2Color[color];
  }
  {
    return state2Color[1];
  }
};

onMounted(() => {
  severity.value = store.getters.getCurrentDisease["severity"];
  severity_num.value = Number(severity.value) - 1;
  showContribution.value = JSON.parse(JSON.stringify(contribution));
});
</script>
