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
        性别:
        {{ sex === "male" ? "男性" : sex === "female" ? "女性" : "未知" }}
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
      <card-gauge
        :score="avg_score"
        :bmi_score="bmi_score"
        :bp_score="bp_score"
        :cholesterol_score="cholesterol_score"
        :glucose_score="glucose_score"
        :mepa_score="mepa_score"
        :nichotine_score="nichotine_score"
        :physical_score="physical_score"
        :sleep_score="sleep_score"
        v-if="showDemo"
      ></card-gauge>
    </div>
    <div class="h-deux w-full"></div>
    <div
      class="w-5/6 sm:w-2/3 z-30 overflow-auto relative bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg flex flex-wrap justify-end"
    >
      <div class="text-gray-600 font-semibold w-11/12 my-0.5">各分项得分:</div>
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
      class="w-5/6 sm:w-2/3 z-30 relative bg-gray-100 bg-opacity-70 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-lg flex flex-wrap justify-center"
    >
      <div class="w-5/6">
        <div class="font-semibold text-gray-700 my-1">您的检查结果如下:</div>
        <div class="text-xs text-gray-700 mb-2">
          <div
            class="grid grid-cols-10 text-center font-semibold border-t-2 border-gray-400 bg-amber-200 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">项目</div>
            <div class="col-span-3 border-r-2 border-gray-400">检查值</div>
            <div class="col-span-4">推荐值</div>
          </div>
          <!-- 饮食 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              饮食 (Mepa得分)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ diet_score }}
            </div>
            <div class="col-span-4">15~16</div>
          </div>
          <!-- 锻炼 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-50 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              锻炼 (分钟/周)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.exercise }}
            </div>
            <div class="col-span-4">≥150</div>
          </div>
          <!-- 吸烟 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">吸烟情况</div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ checkSmoking() }}
            </div>
            <div class="col-span-4">不吸烟</div>
          </div>
          <!-- 睡眠 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-50 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              睡眠 (小时/天)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.sleep }}
            </div>
            <div class="col-span-4">7~9</div>
          </div>
          <!-- BMI -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">BMI (kg/㎡)</div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.bmi }}
            </div>
            <div class="col-span-4">18~25</div>
          </div>
          <!-- 血脂 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-50 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              血脂 (mmol/dL)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.cholesterol }}
            </div>
            <div class="col-span-4">≤3.3</div>
          </div>
          <div
            class="text-center border-t-2 border-gray-400 bg-amber-50 py-0.5"
          >
            是否使用降脂药: {{ ori_data.lipid_drug === "yes" ? "是" : "否" }}
          </div>
          <!-- 血糖 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              血糖 (mmol/dL)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.FBG }}
            </div>
            <div class="col-span-4">3.9~6.1</div>
          </div>
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">
              糖化血红蛋白 (%)
            </div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.HbA1C }}
            </div>
            <div class="col-span-4">≤5.6</div>
          </div>
          <div
            class="text-center border-t-2 border-gray-400 bg-amber-100 py-0.5"
          >
            {{ glucoseControl() }}
          </div>
          <!-- 血压 -->
          <div
            class="grid grid-cols-10 text-center border-t-2 border-gray-400 bg-amber-50 py-0.5"
          >
            <div class="col-span-3 border-r-2 border-gray-400">血压 (mmHg)</div>
            <div class="col-span-3 border-r-2 border-gray-400">
              {{ ori_data.diastolic_bp }}/{{ ori_data.systolic_bp }}
            </div>
            <div class="col-span-4">60~90/90~120</div>
          </div>
          <div
            class="text-center border-y-2 border-gray-400 bg-amber-50 py-0.5"
          >
            是否使用降压药: {{ ori_data.bp_drug === "yes" ? "是" : "否" }}
          </div>
        </div>
      </div>
      <div class="w-full flex flex-wrap justify-end">
        <div class="font-semibold text-gray-700 my-1 w-11/12">
          您的饮食详情:
        </div>
        <diet-radar
          :olive_oil="ori_data.olive_oil"
          :green_veges="ori_data.green_veges"
          :other_veges="ori_data.other_veges"
          :berries="ori_data.berries"
          :fruits="ori_data.fruits"
          :processed_meat="ori_data.processed_meat"
          :fish="ori_data.fish"
          :chicken="ori_data.chicken"
          :cheese="ori_data.cheese"
          :butter="ori_data.butter"
          :beans="ori_data.beans"
          :grains="ori_data.grains"
          :dessert="ori_data.dessert"
          :nuts="ori_data.nuts"
          :precooked_food="ori_data.precooked_food"
          :drinking="ori_data.drinking"
        ></diet-radar>
      </div>
      <div class="w-5/6">
        <!-- 睡眠色条 -->
        <div
          class="grid grid-cols-7 w-full mt-1 text-gray-600 font-semibold relative"
        >
          <img
            src="@assets/img/dual-arrow.png"
            class="absolute h-deux"
            :style="{ left: visSleep() }"
          />
          <div class="text-center text-xs">睡眠:</div>

          <div
            class="col-span-4 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
          ></div>
          <div class="h-deux bg-emerald-400"></div>
          <div
            class="h-deux bg-gradient-to-r from-emerald-400 to-yellow-400 rounded-r"
          ></div>
          <div></div>
          <div class="col-span-4 flex justify-between text-xs">
            <div>0</div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div>4.5</div>
            <div></div>
            <div>7</div>
          </div>
          <div></div>
          <div class="flex justify-between text-xs">
            <div>9</div>
            <div>10</div>
          </div>
        </div>
        <!-- 运动色条 -->
        <div
          class="grid grid-cols-7 w-full mt-1 text-gray-600 font-semibold relative"
        >
          <img
            src="@assets/img/dual-arrow.png"
            class="absolute h-deux"
            :style="{ left: visExercise() }"
          />
          <div class="text-center text-xs">运动:</div>

          <div
            class="col-span-3 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
          ></div>
          <div class="col-span-3 h-deux bg-emerald-400 rounded-r"></div>
          <div></div>
          <div
            class="col-span-6 grid grid-cols-7 justify-between text-xs text-end"
          >
            <div class="text-start">0</div>
            <div>60</div>
            <div></div>
            <div>150</div>
            <div>180</div>
            <div>240</div>
            <div>300</div>
          </div>
        </div>
        <!-- BMI 色条 -->
        <div
          class="grid grid-cols-7 w-full mt-0.5 text-gray-600 font-semibold relative"
        >
          <img
            src="@assets/img/dual-arrow.png"
            class="absolute h-deux"
            :style="{ left: visBMI() }"
          />
          <div class="text-center text-xs">BMI:</div>
          <div
            class="col-span-1 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
          ></div>
          <div
            class="col-span-4 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500"
          ></div>
          <div class="h-deux bg-rose-500 rounded-r"></div>
          <div></div>
          <div class="col-span-1 flex justify-between text-xs">
            <div>0</div>
            <div>18</div>
          </div>
          <div class="col-span-4 flex justify-evenly ml-6 text-xs">
            <div>25</div>
            <div>30</div>
            <div>35</div>
          </div>
        </div>
        <!-- 血压色条 -->
        <div
          class="grid grid-cols-7 text-gray-600 font-semibold relative text-xs"
        >
          <div class="text-center">血压:</div>
          <div class="col-span-3 text-center">低压</div>
          <div class="col-span-3 text-center">高压</div>
          <div></div>
          <div
            class="col-span-3 grid grid-cols-4 w-full mt-0.5 text-gray-600 font-semibold relative pr-1"
          >
            <img
              src="@assets/img/dual-arrow.png"
              class="absolute h-deux"
              :style="{ left: visDiastolic() }"
            />

            <div
              class="col-span-2 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
            ></div>
            <div class="h-deux bg-emerald-400"></div>
            <div
              class="h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500 rounded-r"
            ></div>
            <div class="col-span-4 grid grid-cols-5 text-xs text-end">
              <div class="text-start">0</div>
              <div></div>
              <div class="rotate-45 sm:rotate-0">60</div>
              <div class="rotate-45 sm:rotate-0">90</div>
              <div class="rotate-45 sm:rotate-0">110</div>
            </div>
          </div>
          <div
            class="col-span-3 grid grid-cols-6 w-full mt-0.5 text-gray-600 font-semibold relative pl-1"
          >
            <img
              src="@assets/img/dual-arrow.png"
              class="absolute h-deux"
              :style="{ left: visSystolic() }"
            />

            <div
              class="col-span-3 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
            ></div>
            <div class="h-deux bg-emerald-400"></div>
            <div
              class="col-span-2 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500 rounded-r"
            ></div>
            <div class="col-span-6 grid grid-cols-7 text-xs text-end">
              <div class="text-start">0</div>
              <div></div>
              <div></div>
              <div class="rotate-45 sm:rotate-0">90</div>
              <div class="rotate-45 sm:rotate-0">120</div>
              <div class="rotate-45 sm:rotate-0">150</div>
              <div class="rotate-45 sm:rotate-0">180</div>
            </div>
          </div>
        </div>
        <!-- 血脂色条 -->
        <div
          class="grid grid-cols-7 w-full mt-0.5 text-gray-600 font-semibold relative"
        >
          <img
            src="@assets/img/dual-arrow.png"
            class="absolute h-deux"
            :style="{ left: visLipid() }"
          />
          <div class="text-center text-xs">血脂:</div>
          <div class="h-deux bg-emerald-400 rounded-l"></div>
          <div
            class="col-span-4 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500"
          ></div>
          <div class="h-deux bg-rose-500 rounded-r"></div>
          <div></div>
          <div>
            <div class="text-xs">0</div>
          </div>
          <div class="col-span-4 flex justify-between text-xs">
            <div>3.3</div>
            <div>4.1</div>
            <div>4.9</div>
            <div>5.7</div>
          </div>
          <div class="flex justify-end text-xs">
            <div>10</div>
          </div>
        </div>
        <!-- 血糖色条 -->
        <div
          class="grid grid-cols-7 w-full mt-1 text-gray-600 font-semibold relative"
        >
          <img
            src="@assets/img/dual-arrow.png"
            class="absolute h-deux"
            :style="{ left: visGlucose() }"
          />
          <div class="text-center text-xs">血糖:</div>

          <div
            class="col-span-2 h-deux bg-gradient-to-r from-rose-500 via-yellow-400 to-emerald-400 rounded-l"
          ></div>
          <div class="h-deux bg-emerald-400"></div>
          <div
            class="col-span-3 h-deux bg-gradient-to-r from-emerald-400 via-yellow-400 to-rose-500 rounded-r"
          ></div>
          <div></div>
          <div
            class="col-span-6 grid grid-cols-8 justify-between text-xs text-end"
          >
            <div class="text-start">0</div>
            <div></div>
            <div>3.9</div>
            <div>6.1</div>
            <div>8</div>
            <div>10</div>
            <div>12</div>
            <div>14</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, renderSlot } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import {
  errorMessage,
  infoMessage,
  successMessage,
  warningMessage,
} from "@/assets/js/common";
import CardGauge from "@charts/CardGauge.vue";
import Radar from "@charts/Radar.vue";
import DietRadar from "@charts/DietRadar.vue";
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
const diet_score = ref(0);
const glucose_score = ref(0);
const mepa_score = ref(0);
const nichotine_score = ref(0);
const physical_score = ref(0);
const sleep_score = ref(0);
const ori_data = ref({});

onMounted(() => {
  // console.log(store.getters.getCurrentPollId);
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
      cholesterol_score.value = res.data[0].cholesterol_score;
      diet_score.value = res.data[0].diet_score;
      glucose_score.value = res.data[0].glucose_score;
      mepa_score.value = res.data[0].mepa_score;
      nichotine_score.value = res.data[0].nichotine_score;
      physical_score.value = res.data[0].physical_score;
      sleep_score.value = res.data[0].sleep_score;
      ori_data.value = res.data[0].ori_data;
    })
    .catch((err) => {
      router.push("query");
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
  var cholesterol = ori_data.value.cholesterol;
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
  var sleep = ori_data.value.sleep;
  //   var sleep = 7;
  if (sleep > 9.9) {
    position = "97%";
  } else if (sleep > 9) {
    position = 14.285714 * sleep - 42.857143 + "%";
  } else if (sleep > 7) {
    position = 7.142857 * sleep + 21.428571 + "%";
  } else if (sleep > 0) {
    position = 8.163265306 * sleep + 14.285714 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

const visExercise = () => {
  var position = {};
  var exercise = ori_data.value.exercise;
  // var exercise = 150;
  if (exercise > 290) {
    position = "97%";
  } else if (exercise > 0) {
    position = 0.285714 * exercise + 14.285714 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

const visDiastolic = () => {
  var position = {};
  var diastolic_bp = ori_data.value.diastolic_bp;
  // var diastolic_bp = 50;
  if (diastolic_bp > 109) {
    position = "95%";
  } else if (diastolic_bp > 90) {
    position = 0.8 * diastolic_bp + 3 + "%";
  } else if (diastolic_bp > 60) {
    position = 0.833333 * diastolic_bp + "%";
  } else if (diastolic_bp > 0) {
    position = 0.833333 * diastolic_bp + "%";
  } else {
    position = "2%";
  }

  return position;
};

const visSystolic = () => {
  var position = {};
  var systolic_bp = ori_data.value.systolic_bp;
  // var systolic_bp = 0;
  if (systolic_bp > 170) {
    position = "95%";
  } else if (systolic_bp > 0) {
    position = 0.555555556 * systolic_bp + "%";
  } else {
    position = "2%";
  }

  return position;
};

const visGlucose = () => {
  var position = {};
  var glucose = ori_data.value.FBG;
  // var glucose = 8;
  if (glucose > 13.5) {
    position = "97%";
  } else if (glucose > 0) {
    position = 6.122449 * glucose + 14.285714 + "%";
  } else {
    position = "14.285714%";
  }

  return position;
};

const checkSmoking = () => {
  var showSmoking = "";
  if (ori_data.value.smoking_status === "never") {
    if (ori_data.value.second_smoke === "yes") {
      showSmoking = "二手烟暴露";
    } else {
      showSmoking = "不吸烟";
    }
  } else if (ori_data.value.smoking_status === "former") {
    if (ori_data.value.second_smoke === "yes") {
      showSmoking = "戒烟，二手烟暴露";
    } else {
      showSmoking = "戒烟";
    }
  } else {
    showSmoking = "吸烟";
  }
  return showSmoking;
};

const glucoseControl = () => {
  var showControl = "";
  if (ori_data.value.diabetes === "no") {
    showControl = "未进行血糖控制";
  } else if (ori_data.value.diabetes === "diet") {
    showControl = "血糖控制:饮食";
  } else if (ori_data.value.diabetes === "tablet") {
    showControl = "血糖控制:药物";
  } else if (ori_data.value.diabetes === "insulin") {
    showControl = "血糖控制:注射胰岛素";
  }
  return showControl;
};
</script>
