<template>
  <div id="radar" class="h-trente w-full"></div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import * as echarts from "echarts";

var chartDom;
var myChart;
var option = {
  color: ["#e5e7eb", "#fde68a", "#fcd34d", "#f59e0b"],
  title: {
    text: "疾病风险因素",
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "生活习惯因素", max: 100 },
        { text: "职业暴露因素", max: 100 },
        { text: "家族遗传因素", max: 100 },
        { text: "饮食习惯因素", max: 100 },
        { text: "其他病史因素", max: 100 },
        { text: "药物使用因素", max: 100 },
      ],
      center: ["50%", "50%"],

      splitNumber: 4,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
      },
      splitArea: {
        areaStyle: {
          color: ["#fef3c7", "#fde68a", "#fcd34d", "#f59e0b"],

          shadowBlur: 5,
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
          value: [100, 60, 20, 20, 15, 15],
          name: "风险因素",
          areaStyle: {
            color: "rgba(251, 113, 133, 0.5)",
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
