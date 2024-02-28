<template>
  <div class="w-full h-soixantecinq">
    <div
      id="radar-over"
      class="h-trente w-full relative shadow-lg rounded"
    ></div>
    <div class="h-trois w-full"></div>
    <div
      id="radar-within"
      class="h-trente w-full relative shadow-lg rounded"
    ></div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeMount, watch } from "vue";
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

const beans = ref(0);

var chartDom1;
var myChart1;
var option1 = {
  color: ["#14b8a6", "#0284c7"],
  // title: {
  //   text: "(越多越好)",
  // },
  legend: {
    right: "2%",
    textStyle: { fontWeight: "bold" },
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "橄榄油(克/周)", max: 60 },
        { text: "绿叶蔬菜(克/周)", max: 1000 },
        { text: "其他蔬菜\n(克/周)", max: 400 },
        { text: "浆果(克/周)", max: 500 },
        { text: "其他水果(克/天)", max: 500 },
        { text: "鱼虾贝(克/周)", max: 500 },
        { text: "豆类(克/周)", max: 600 },
        { text: "全谷物\n(克/天)", max: 600 },
        { text: "坚果(克/周)", max: 250 },
      ],
      center: ["52%", "55%"],

      splitNumber: 4,
      nameGap: 7,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
        fontSize: 11,
      },
      splitArea: {
        areaStyle: {
          color: ["#a7f3d0", "#fb923c", "#fde68a", "#a7f3d0"],
          opacity: 0.7,
          shadowBlur: 0,
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
          value: [30, 525, 150, 300, 150, 200, 300, 300, 120],
          name: "最低推荐值",
          areaStyle: {
            color: "#99f6e4",
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
            props.nuts,
          ],
          name: "实际值",
          areaStyle: {
            color: "#bae6fd",
            opacity: 0.7,
          },
        },
      ],
    },
  ],
};
// var option1 = {
//   title: {
//     text: "",
//   },
//   tooltip: {
//     trigger: "axis",
//     axisPointer: {
//       type: "shadow",
//     },
//   },
//   legend: {},
//   grid: {
//     left: "3%",
//     right: "4%",
//     bottom: "3%",
//     containLabel: true,
//   },
//   xAxis: {
//     type: "value",
//     boundaryGap: [0, 0.01],
//   },
//   yAxis: {
//     type: "category",
//     data: [
//       "橄榄油",
//       "绿叶蔬菜",
//       "其他蔬菜",
//       "浆果",
//       "其他水果",
//       "鱼虾贝",
//       "豆类",
//       "全谷物",
//       "坚果",
//     ],
//   },
//   series: [
//     {
//       name: "最低推荐值",
//       type: "bar",
//       data: [30, 525, 150, 300, 150, 200, 300, 300, 120],
//     },
//     {
//       name: "实际值",
//       type: "bar",
//       data: [
//         props.olive_oil,
//         props.green_veges,
//         props.other_veges,
//         props.berries,
//         props.fruits,
//         props.fish,
//         props.beans,
//         props.grains,
//         props.nuts,
//       ],
//     },
//   ],
// };

var chartDom2;
var myChart2;
var option2 = {
  color: ["#e11d48", "#0284c7"],
  // title: {
  //   text: "(越少越好)",
  // },
  legend: {
    right: "2%",
    textStyle: { fontWeight: "bold" },
  },
  tooltip: {
    trigger: "item",
  },
  radar: [
    {
      indicator: [
        { text: "加工肉制品(克/周)", max: 400 },
        { text: "鸡肉(克/周)", max: 1200 },
        { text: "奶酪\n(克/周)", max: 200 },
        { text: "黄油(克/周)", max: 140 },
        { text: "甜品(克/周)", max: 300 },
        { text: "预制菜\n(次/周)", max: 14 },
        { text: "饮酒(份/天)", max: 4 },
      ],
      center: ["50%", "55%"],

      splitNumber: 4,
      nameGap: 7,
      shape: "circle",
      axisName: {
        formatter: "{value}",
        color: "#6b7280",
        fontWeight: "bold",
        fontSize: 11,
      },
      splitArea: {
        areaStyle: {
          color: ["#a7f3d0", "#fde68a", "#fb923c", "#fb7185"],
          opacity: 0.6,
          shadowBlur: 0,
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
          value: [255, 430, 120, 70, 120, 1, 2],
          name: "最高警戒值",
          areaStyle: {
            color: "#fecdd3",
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
          name: "实际值",
          areaStyle: {
            color: "#bae6fd",
            opacity: 0.7,
          },
        },
      ],
    },
  ],
};

onBeforeMount(() => {
  console.log(props);
});

onMounted(() => {
  beans.value = props.beans;
  chartDom1 = document.getElementById("radar-over");
  myChart1 = echarts.init(chartDom1);
  option1 && myChart1.setOption(option1);

  chartDom2 = document.getElementById("radar-within");
  myChart2 = echarts.init(chartDom2);
  option2 && myChart2.setOption(option2);
});

watch(
  () => props.beans,
  () => {
    option1.series[0].data[1].value = [
      props.olive_oil,
      props.green_veges,
      props.other_veges,
      props.berries,
      props.fruits,
      props.fish,
      props.beans,
      props.grains,
      props.nuts,
    ];
    myChart1.setOption(option1);
    option2.series[0].data[1].value = [
      props.processed_meat,
      props.chicken,
      props.cheese,
      props.butter,
      props.dessert,
      props.precooked_food,
      props.drinking,
    ];
    myChart2.setOption(option2);
  }
);
</script>
