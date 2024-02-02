<template>
  <div class="w-full h-soixantecinq">
    <div id="radar-over" class="h-trente w-full relative shadow-lg rounded"></div>
    <div class="h-cinq w-full"></div>
    <div id="radar-within" class="h-trente w-full relative"></div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import * as echarts from "echarts";

const props = defineProps({
  olive_oil: Number,
  green_veges: Number,
  other_veges: Number,
  berries: Number,
  fruits: Number,
  processed_meat: Number,
  fish: Number,
  chicken: Number,
  cheese: Number,
  butter: Number,
  beans: Number,
  grains: Number,
  dessert: Number,
  nuts: Number,
  precooked_food: Number,
  drinking: Number,
});

var chartDom1;
var myChart1;
var option1 = {
  color: ["#e5e7eb", "#fde68a", "#fcd34d", "#f59e0b"],
  title: {
    text: "(越多越好)",
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "橄榄油", max: 60 },
        { text: "绿叶蔬菜", max: 1000 },
        { text: "其他蔬菜", max: 400 },
        { text: "浆果", max: 500 },
        { text: "其他水果", max: 500 },
        { text: "鱼虾贝", max: 500 },
        { text: "豆类", max: 600 },
        { text: "全谷物", max: 600 },
        { text: "坚果", max: 250 },
      ],
      center: ["50%", "50%"],

      splitNumber: 4,
      nameGap: 5,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
        fontSize: 9,
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
            30,
            525,
            150,
            300,
            150,
            200,
            300,
            300,
            120
          ],
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
            opacity: 0.9,
          },
        },
        {
          value: [
            props.olive_oil,
            props.green_veges,
            props.other_veges,
            props.berries,
            props.fruits,
            props.fish,
            props.beans,
            props.grains,
            props.nuts
          ],
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
            opacity: 0.9,
          },
        },
      ],
    },
  ],
};

var chartDom2;
var myChart2;
var option2 = {
  color: ["#e5e7eb", "#fde68a", "#fcd34d", "#f59e0b"],
  title: {
    text: "(越少越好)",
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "加工肉制品", max: 400 },
        { text: "鸡肉", max: 1200 },
        { text: "奶酪", max: 200 },
        { text: "黄油", max: 140 },
        { text: "甜品", max: 300 },
        { text: "预制菜", max: 7 },
        { text: "饮酒", max: 4 },
      ],
      center: ["50%", "50%"],

      splitNumber: 4,
      nameGap: 5,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
        fontSize: 9,
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
            255,
            430,
            120,
            70,
            120,
            1,
            2,
          ],
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
            opacity: 0.9,
          },
        },
        {
          value: [
            props.processed_meat,
            props.chicken,
            props.cheese,
            props.butter,
            props.dessert,
            props.precooked_food,
            props.drinking,
          ],
          areaStyle: {
            color: "rgba(161, 161, 133, 0.8)",
            opacity: 0.9,
          },
        },
      ],
    },
  ],
};

onMounted(() => {
  chartDom1 = document.getElementById("radar-over");
  myChart1 = echarts.init(chartDom1);
  option1 && myChart1.setOption(option1);

  chartDom2 = document.getElementById("radar-within");
  myChart2 = echarts.init(chartDom2);
  option2 && myChart2.setOption(option2);
});
</script>
