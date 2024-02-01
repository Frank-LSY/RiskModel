<template>
  <div id="radar" class="h-trente w-full relative"></div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import * as echarts from "echarts";

const props = defineProps({
  bmi_score: Number,
  bp_score: Number,
  cholesterol_score: Number,
  glucose_score: Number,
  mepa_score: Number,
  nichotine_score: Number,
  physical_score: Number,
  sleep_score: Number,
});

var chartDom;
var myChart;
var option = {
  color: ["#e5e7eb", "#fde68a", "#fcd34d", "#f59e0b"],
  title: {
    text: "各分项得分",
    left: "8.333333%",
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "体重指数", max: 105 },
        { text: "血压", max: 105 },
        { text: "血脂", max: 105 },
        { text: "血糖", max: 105 },
        { text: "饮食", max: 105 },
        { text: "吸烟", max: 105 },
        { text: "运动", max: 105 },
        { text: "睡眠", max: 105 },
      ],
      center: ["50%", "50%"],

      splitNumber: 4,
      nameGap: 5,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
        fontSize: 16,
        
      },
      splitArea: {
        areaStyle: {
          color: ["#fb7185", "#fb923c", "#fde68a", "#a7f3d0"],
          opacity: 0.9,
          shadowBlur: 3,
        },
      },
      axisLine: {
        lineStyle: {
          color: "#6b7280",
        },
      },
      splitLine: {
        lineStyle: {
          color: "#6b7280",
        },
      },
    },
  ],
  series: [
    {
      type: "radar",
      emphasis: {
        lineStyle: {
          width: 4,
        },
      },
      data: [
        {
          value: [
            props.bmi_score,
            props.bp_score,
            props.cholesterol_score,
            props.glucose_score,
            props.mepa_score,
            props.nichotine_score,
            props.physical_score,
            props.sleep_score,
          ],
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
            opacity: 0.9
          },
        },
      ],
    },
  ],
};

onMounted(() => {
  chartDom = document.getElementById("radar");
  myChart = echarts.init(chartDom);
  option && myChart.setOption(option);
});
</script>
