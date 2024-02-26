<template>
  <div class="w-full relative">
    <div class="absolute left-1/12 top-1/24 font-semibold text-gray-700">
      您的心血管总体评分为:
    </div>
    <!-- <div class="absolute left-1/12 bottom-1/24 font-semibold text-gray-700">
      依据模型推算，您的无疾病年约为:
    </div> -->
    <div
      id="card-gauge"
      class="h-trente w-full relative shadow-lg rounded"
    ></div>
    <div class="w-full flex flex-wrap justify-evenly">
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-meal"
          class="fill-gray-700 w-6 h-6 bg-lime-500 rounded-full ring-2 ring-lime-500 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">健康饮食</div>
        <SvgIcon
          :iconName="mepa_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            mepa_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-exercise"
          class="fill-gray-700 w-6 h-6 bg-cyan-400 rounded-full ring-2 ring-cyan-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">适量运动</div>
        <SvgIcon
          :iconName="physical_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            physical_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-smoke"
          class="fill-gray-700 w-6 h-6 bg-rose-400 rounded-full ring-2 ring-rose-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">不要吸烟</div>
        <SvgIcon
          :iconName="nichotine_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            nichotine_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-sleep"
          class="fill-gray-700 w-6 h-6 bg-teal-300 rounded-full ring-2 ring-teal-300 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">充足睡眠</div>
        <SvgIcon
          :iconName="sleep_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            sleep_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-tizhong"
          class="fill-gray-700 w-6 h-6 bg-orange-400 rounded-full ring-2 ring-orange-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">控制体重</div>
        <SvgIcon
          :iconName="bmi_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            bmi_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-fat"
          class="fill-gray-700 w-6 h-6 bg-fuchsia-400 rounded-full ring-2 ring-fuchsia-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">控制血脂</div>
        <SvgIcon
          :iconName="cholesterol_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            cholesterol_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-sugar"
          class="fill-gray-700 w-6 h-6 bg-teal-400 rounded-full ring-2 ring-teal-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">控制血糖</div>
        <SvgIcon
          :iconName="glucose_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            glucose_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
      <div
        class="w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-lg rounded-xl my-2 bg-gray-400 bg-opacity-40"
      >
        <SvgIcon
          iconName="icon-xieyaji-F"
          class="fill-gray-700 w-6 h-6 bg-indigo-400 rounded-full ring-2 ring-indigo-400 ring-offset-2"
        ></SvgIcon>
        <div class="font-semibold text-gray-700">控制血压</div>
        <SvgIcon
          :iconName="bp_score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
          :class="[
            bp_score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
            'w-6 h-6',
          ]"
        ></SvgIcon>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, onBeforeUnmount } from "vue";
import * as echarts from "echarts";

const props = defineProps({
  score: Number,
  bmi_score: Number,
  bp_score: Number,
  cholesterol_score: Number,
  glucose_score: Number,
  mepa_score: Number,
  nichotine_score: Number,
  physical_score: Number,
  sleep_score: Number,
});

const state2Color = {
  1: "#34d499",
  2: "#64d179",
  3: "#9fcf52",
  4: "#facc15",
  5: "#f9ac26",
  6: "#f67841",
  7: "#f43f5e",
};

var chartDom;
var myChart;
var option = {
  series: [
    {
      type: "gauge",
      startAngle: 180,
      endAngle: 0,
      center: ["50%", "90%"],
      radius: "100%",
      min: 0,
      max: 100,
      splitNumber: 8,
      axisLine: {
        lineStyle: {
          width: 30,
          shadowBlur: 3,
          color: [
            [
              1,
              new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                {
                  offset: 0.1,
                  color: "#f43f5e",
                },
                {
                  offset: 0.7,
                  color: "#facc15",
                },
                {
                  offset: 1,
                  color: "#34d399",
                },
              ]),
            ],
          ],
        },
      },
      pointer: {
        icon: "path://M12.8,0.7l12,40.1H0.7L12.8,0.7z",
        length: "55%",
        width: 20,
        offsetCenter: [0, "-40%"],
        itemStyle: {
          color: "#6b7280",
        },
      },
      axisTick: {
        length: 1,
        lineStyle: {
          color: "#464646",
          width: 1,
        },
      },
      splitLine: {
        length: 0,
        lineStyle: {
          color: "auto",
          width: 5,
        },
      },
      axisLabel: {
        color: "#6b7280",
        fontSize: 16,
        fontWeight: "bold",
        distance: -20,
        rotate: "tangential",
        formatter: function (value) {
          if (value === 87.5) {
            return "优";
          } else if (value === 75) {
            return "良";
          } else if (value === 50) {
            return "较差";
          } else if (value === 25) {
            return "差";
          }
          return "";
        },
      },
      title: {
        offsetCenter: [0, "-10%"],
        fontSize: 20,
        fontWeight: "bold",
      },
      detail: {
        fontSize: 40,
        offsetCenter: [0, "-15%"],
        valueAnimation: true,
        color: state2Color[Math.ceil(props.score / 14.3)],
        formatter: function (value) {
          return Math.round(value) + "分";
        },
      },
      data: [
        {
          value: props.score,
        },
      ],
    },
  ],
};

onMounted(() => {
  chartDom = document.getElementById("card-gauge");
  myChart = echarts.init(chartDom);
  option && myChart.setOption(option);
});
</script>
