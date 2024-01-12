<template>
  <div id="radar" class="h-trente w-full relative"></div>
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
    left: "8.333333%",
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "生活习惯", max: 100 },
        { text: "职业暴露", max: 100 },
        { text: "家族遗传", max: 100 },
        { text: "饮食习惯", max: 100 },
        { text: "个人病史", max: 100 },
        { text: "药物使用", max: 100 },
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
          value: [90, 60, 20, 10, 55, 15],
          name: "风险因素",
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
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
