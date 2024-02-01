<template>
  <div class="flex flex-wrap justify-center relative overflow-auto">
    <button
      class="absolute top-0 left-2 bg-amber-300 px-1 rounded z-50 font-semibold text-gray-700"
      @click="goBack"
    >
      返回
    </button>
    <div class="h-deux w-full"></div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto text-gray-600 font-semibold h-douze bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg flex flex-wrap justify-center content-evenly text-center"
      v-if="showDemo"
    >
      <div class="w-2/3">姓名: {{ store.getters.getCurrentUser.userName }}</div>
      <div class="w-2/3">
        性别: {{ sex === "male" ? "男性" : sex === "female" ? "女性" : "未知" }}
      </div>
      <div class="w-2/3">年龄: {{ age }}</div>
    </div>
    <div class="h-cinq w-5/6 sm:w-2/3 flex flex-wrap content-center z-30">
      <img src="@assets/img/le8.jpg" class="w-1/16 rounded-full mr-2" />
      <div
        class="text-sm md:text-base text-gray-600 font-semibold flex flex-wrap content-center"
      >
        以下是您的心血管风险评估及分析:
      </div>
    </div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto relative bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg"
    >
      <card-gauge :score="avg_score" v-if="showDemo"></card-gauge>
    </div>
    <div class="h-deux w-full"></div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto relative bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg"
    >
      <Radar
        :bmi_score="bmi_score"
        :bp_score="bp_score"
        :cholesterol_score="cholesterol_score"
        :glucose_score="glucose_score"
        :mepa_score="mepa_score"
        :nichotine_score="nichotine_score"
        :physical_score="physical_score"
        :sleep_score="sleep_score"
        v-if="showDemo"
      ></Radar>
    </div>
    <div class="h-deux w-full"></div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto relative bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg"
    >
      <!-- BMI 色条 -->
      <div
        class="grid grid-cols-7 w-full my-1 text-gray-600 font-semibold relative"
      >
        <img
          src="@assets/img/dual-arrow.png"
          class="absolute h-deux"
          :style="{ left: visBMI() }"
        />
        <div class="text-center h-trois">BMI:</div>
        <div
          class="col-span-1 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
        ></div>
        <div
          class="col-span-4 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500"
        ></div>
        <div class="h-deux bg-rose-500 rounded-r"></div>
        <div></div>
        <div class="col-span-1 flex justify-between">
          <div>0</div>
          <div>18</div>
        </div>
        <div class="col-span-4 flex justify-evenly ml-6">
          <div>25</div>
          <div>30</div>
          <div>35</div>
        </div>
      </div>
      <!-- 血脂色条 -->
      <div
        class="grid grid-cols-7 w-full my-1 text-gray-600 font-semibold relative"
      >
        <img
          src="@assets/img/dual-arrow.png"
          class="absolute h-deux"
          :style="{ left: visLipid() }"
        />
        <div class="text-center h-trois">血脂:</div>
        <div class="h-deux bg-emerald-400 rounded-l"></div>
        <div
          class="col-span-4 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500"
        ></div>
        <div class="h-deux bg-rose-500 rounded-r"></div>
        <div></div>
        <div>
          <div>0</div>
        </div>
        <div class="col-span-4 flex justify-between">
          <div>3.3</div>
          <div>4.1</div>
          <div>4.9</div>
          <div>5.7</div>
        </div>
        <div class="flex justify-end">
          <div>10</div>
        </div>
      </div>
      <!-- 睡眠色条 -->
      <div
        class="grid grid-cols-7 w-full my-1 text-gray-600 font-semibold relative"
      >
        <img
          src="@assets/img/dual-arrow.png"
          class="absolute h-deux"
          :style="{ left: visSleep() }"
        />
        <div class="text-center h-trois">睡眠:</div>

        <div
          class="col-span-4 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
        ></div>
        <div class="h-deux bg-emerald-400"></div>
        <div
          class="h-deux bg-gradient-to-r from-emerald-400 to-yellow-400 rounded-r"
        ></div>
        <div></div>
        <div class="col-span-4 flex justify-between">
          <div>0</div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div>5</div>
          <div></div>
          <div>7</div>
        </div>
        <div></div>
        <div class="flex justify-between">
          <div>9</div>
          <div>10</div>
        </div>
      </div>
      {{ ori_data }}
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, renderSlot } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { errorMessage, infoMessage, warningMessage } from "@/assets/js/common";
import CardGauge from "@charts/CardGauge.vue";
import Radar from "@charts/Radar.vue";
import API from "@/api.js";

const router = useRouter();
const store = useStore();

const goBack = () => {
  router.push("query");
};

const showDemo = ref(false);
const age = ref(-1);
const sex = ref("未知");
const avg_score = ref(0);
const bmi_score = ref(0);
const bp_score = ref(0);
const cholesterol_score = ref(0);
const glucose_score = ref(0);
const mepa_score = ref(0);
const nichotine_score = ref(0);
const physical_score = ref(0);
const sleep_score = ref(0);
const ori_data = ref({});

onMounted(() => {
  console.log(store.getters.getCurrentPollId);
  API.cardDetails({
    pollId: store.getters.getCurrentPollId,
  })
    .then((res) => {
      console.log(res.data[0]);
      showDemo.value = true;
      age.value = res.data[0].ori_data.age;
      sex.value = res.data[0].ori_data.sex;
      avg_score.value = res.data[0].avg_score;
      bmi_score.value = res.data[0].bmi_score;
      bp_score.value = res.data[0].bp_score;
      //   cholesterol_score.value = res.data[0].cholesterol_score;
      glucose_score.value = res.data[0].glucose_score;
      mepa_score.value = res.data[0].mepa_score;
      nichotine_score.value = res.data[0].nichotine_score;
      physical_score.value = res.data[0].physical_score;
      sleep_score.value = res.data[0].sleep_score;
      ori_data.value = res.data[0].ori_data;
    })
    .catch((err) => {
      errorMessage(err);
    });
});

const visBMI = () => {
  var position = {};
  if (ori_data.value.bmi > 44) {
    position = "97%";
  } else if (ori_data.value.bmi > 18) {
    position = 2.5974 * ori_data.value.bmi - 18.181818182 + "%";
  } else if (ori_data.value.bmi > 0) {
    position = 0.6 * ori_data.value.bmi + 14.2857 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

const visLipid = () => {
  var position = {};
    var cholesterol = ori_data.value.cholesterol
//   var cholesterol = 7;
  if (cholesterol > 9) {
    position = "97%";
  } else if (cholesterol > 5.7) {
    position = 3.32226 * cholesterol + 66.777409 + "%";
  } else if (cholesterol > 3.3) {
    position = 23.809524 * cholesterol - 50 + "%";
  } else if (cholesterol > 0) {
    position = 4.32900433 * cholesterol + 14.2857 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

const visSleep = () => {
  var position = {};
  //   var cholesterol = ori_data.value.cholesterol
  var sleep = 6;
  if (sleep > 10) {
    position = "97%";
  } else if (sleep > 9) {
    position = 3.32226 * sleep + 66.777409 + "%";
  } else if (sleep > 7) {
    position = 23.809524 * sleep - 50 + "%";
  } else if (sleep > 0) {
    position = 4.32900433 * sleep + 14.2857 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

</script>
