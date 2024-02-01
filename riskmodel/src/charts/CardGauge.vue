<template>
  <div class="w-full relative">
    <div class="absolute left-1/12 top-1/24 font-semibold text-gray-700">
      您的心血管总体评分为:
    </div>
    <div class="absolute left-1/12 bottom-1/24 font-semibold text-gray-700">
      依据模型，您的无疾病年约为:
    </div>
    <div
      id="card-gauge"
      class="h-trente w-full relative shadow-lg rounded"
    ></div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, onBeforeUnmount } from "vue";
import * as echarts from "echarts";

const props = defineProps({
  score: Number,
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
  grid: {
    left: "200%",
    right: "0%",
    bottom: "2%",
  },
  series: [
    {
      type: "gauge",
      startAngle: 180,
      endAngle: 0,
      center: ["50%", "75%"],
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
