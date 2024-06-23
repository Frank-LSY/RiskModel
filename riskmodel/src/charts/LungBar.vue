<template>
  <div class="w-19/20 py-4 flex flex-wrap justify-center">
    <div id="lung-bar" class="h-trente w-full relative"></div>
    <div class="w-full grid grid-cols-5" v-if="props.status === 'NEVER'">
      <div class="text-end mr-3 text-xs sm:text-base">
        <div class="py-0.5">年龄</div>
        <div>BMI<span class="hidden sm:inline py-0.5">(kg/㎡)</span></div>
        <div><span class="hidden sm:inline py-0.5">肺癌</span>家族史</div>
        <div class="py-0.5">AFP(ng/ml)</div>
        <div class="py-0.5">CEA(ng/ml)</div>
        <div class="py-0.5">肺功能</div>
      </div>
      <div class="col-span-4 grid grid-cols-7 text-center text-xs sm:text-base">
        <div class="shadow" v-for="i in 7" :key="i">
          {{ neverattr.age[i - 1] }}
        </div>
        <div
          :class="[
            i > 1 ? ' bg-cyan-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ neverattr.bmi[i - 1] }}
        </div>
        <div
          :class="[
            i > 2 ? ' bg-lime-600 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ neverattr.family[i - 1] }}
        </div>
        <div
          :class="[
            i > 3 ? ' bg-violet-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ neverattr.afp[i - 1] }}
        </div>
        <div
          :class="[
            i > 4
              ? i < 7
                ? ' bg-red-500 border border-gray-400 bg-opacity-40'
                : 'bg-red-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ neverattr.cea[i - 1] }}
        </div>
        <div
          :class="[
            i > 5
              ? i < 7
                ? ' bg-amber-500 border border-gray-400 bg-opacity-40'
                : 'bg-amber-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ neverattr.mmef[i - 1] }}
        </div>
      </div>
    </div>
    <div class="w-full grid grid-cols-5" v-if="props.status === 'LIGHT'">
      <div class="text-end mr-3 text-xs sm:text-base">
        <div class="py-0.5">年龄</div>
        <div>戒烟否</div>
        <div>年吸烟(包)</div>
        <div class="py-0.5">家族史</div>
        <div class="py-0.5">AFP(ng/ml)</div>
        <div class="py-0.5">CEA(ng/ml)</div>
      </div>
      <div class="col-span-4 grid grid-cols-7 text-center text-xs sm:text-base">
        <div class="shadow" v-for="i in 7" :key="i">
          {{ lightattr.age[i - 1] }}
        </div>
        <div
          :class="[
            i > 1 ? ' bg-cyan-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ lightattr.status[i - 1] }}
        </div>
        <div
          :class="[
            i > 2 ? ' bg-lime-600 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ lightattr.pack[i - 1] }}
        </div>
        <div
          :class="[
            i > 3 ? ' bg-violet-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ lightattr.family[i - 1] }}
        </div>
        <div
          :class="[
            i > 4
              ? i < 7
                ? ' bg-red-500 border border-gray-400 bg-opacity-40'
                : 'bg-red-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ lightattr.afp[i - 1] }}
        </div>
        <div
          :class="[
            i > 5
              ? i < 7
                ? ' bg-amber-500 border border-gray-400 bg-opacity-40'
                : 'bg-amber-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ lightattr.cea[i - 1] }}
        </div>
      </div>
    </div>
    <div class="w-full grid grid-cols-5" v-if="props.status === 'HEAVY'">
      <div class="text-end mr-3 text-xs sm:text-base">
        <div class="py-0.5">年龄</div>
        <div>戒烟否</div>
        <div>日吸烟(包)</div>
        <div class="py-0.5">
          BMI<span class="hidden sm:inline py-0.5">(kg/㎡)</span>
        </div>
        <div class="py-0.5">CEA(ng/ml</div>
        <div class="py-0.5">肺功能</div>
      </div>
      <div class="col-span-4 grid grid-cols-7 text-center text-xs sm:text-base">
        <div class="shadow" v-for="i in 7" :key="i">
          {{ heavyattr.age[i - 1] }}
        </div>
        <div
          :class="[
            i > 1 ? ' bg-cyan-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ heavyattr.status[i - 1] }}
        </div>
        <div
          :class="[
            i > 2 ? ' bg-lime-600 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ heavyattr.pack[i - 1] }}
        </div>
        <div
          :class="[
            i > 3 ? ' bg-violet-500 border border-gray-400' : '',
            'bg-opacity-40 shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ heavyattr.bmi[i - 1] }}
        </div>
        <div
          :class="[
            i > 4
              ? i < 7
                ? ' bg-red-500 border border-gray-400 bg-opacity-40'
                : 'bg-red-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ heavyattr.cea[i - 1] }}
        </div>
        <div
          :class="[
            i > 5
              ? i < 7
                ? ' bg-amber-500 border border-gray-400 bg-opacity-40'
                : 'bg-amber-500 border border-gray-400'
              : '',
            ' shadow',
          ]"
          v-for="i in 7"
          :key="i"
        >
          {{ heavyattr.mmef[i - 1] }}
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, onBeforeUnmount } from "vue";
import * as echarts from "echarts";
import { useStore } from "vuex";

const store = useStore();

const props = defineProps({
  status: String,
});

const probs = {
  never5: [0.11, 0.22, 0.31, 0.43, 0.83, 1.63, 11.58],
  never10: [0.26, 0.51, 0.71, 0.99, 1.93, 3.74, 24.86],
  light5: [0.06, 0.1, 0.14, 0.32, 0.7, 1.55, 5.03],
  light10: [0.15, 0.22, 0.33, 0.73, 1.62, 3.55, 11.27],
  heavy5: [0.16, 0.24, 0.35, 0.76, 1.64, 2.41, 3.53],
  heavy10: [0.42, 0.61, 0.9, 1.95, 4.17, 6.08, 8.82],
};

const neverattr = {
  age: [65, 65, 65, 65, 65, 65, 65],
  bmi: ["≥30", "<25", "<25", "<25", "<25", "<25", "<25"],
  family: ["无", "无", "有", "有", "有", "有", "有"],
  afp: ["<1.8", "<1.8", "<1.8", "≥1.8", "≥1.8", "≥1.8", "≥1.8"],
  cea: ["<1.5", "<1.5", "<1.5", "<1.5", "1.5-2.6", "4.3-7.0", ">7.0"],
  mmef: [">103", ">103", ">103", ">103", "55-77", "49-78", "<49"],
};
const lightattr = {
  age: [65, 65, 65, 65, 65, 65, 65],
  status: ["是", "否", "否", "否", "否", "否", "否"],
  pack: ["<15", "<15", "15-30", "15-30", "15-30", "15-30", "15-30"],
  family: ["无", "无", "无", "有", "有", "有", "有"],
  afp: ["<1.8", "<1.8", "<1.8", "<1.8", "≥1.8", "≥1.8", "≥1.8"],
  cea: ["<1.5", "<1.5", "<1.5", "<1.5", "<1.5", "4.3-7.0", ">7.0"],
};

const heavyattr = {
  age: [65, 65, 65, 65, 65, 65, 65],
  status: ["是", "否", "否", "否", "否", "否", "否"],
  pack: ["<15", "<15", "15-30", "15-30", "15-30", "15-30", "15-30"],
  bmi: ["≥30", "≥30", "≥30", "<25", "<25", "<25", "<25"],
  cea: ["<1.5", "<1.5", "<1.5", "<1.5", "4.3-7.0", "4.3-7.0", ">7.0"],
  mmef: [">103", ">103", ">103", ">103", ">103", "49-78", "<49"],
};

const status2Chinese = (status) => {
  var chinese = "";
  switch (status) {
    case "NEVER":
      chinese = "不吸烟者";
      break;
    case "LIGHT":
      chinese = "轻度吸烟者";
      break;
    case "HEAVY":
      chinese = "重度吸烟者";
      break;
  }
  return chinese;
};

const status2prob = (year) => {
  var prob = "";
  if (year === 5) {
    switch (props.status) {
      case "NEVER":
        prob = probs.never5;
        break;
      case "LIGHT":
        prob = probs.light5;
        break;
      case "HEAVY":
        prob = probs.heavy5;
        break;
    }
  } else if (year === 10) {
    switch (props.status) {
      case "NEVER":
        prob = probs.never10;
        break;
      case "LIGHT":
        prob = probs.light10;
        break;
      case "HEAVY":
        prob = probs.heavy10;
        break;
    }
  }

  return prob;
};

var chartDom;
var myChart;
var option = {
  grid: {
    left: "20%",
    right: "0%",
    bottom: "2%",
  },
  title: {
    text: status2Chinese(props.status) + "\n主要肺癌风险一览",
    textStyle: {
      fontWeight: "bold",
      fontSize: 16,
    },
  },
  tooltip: {
    trigger: "item",
  },
  legend: {
    data: ["5年期风险", "10年期风险"],
    right: 0,
  },
  xAxis: [
    {
      type: "category",
      show: false,
      data: ["※", "※", "※", "※", "※", "※", "※"],
      axisPointer: {
        type: "shadow",
      },
    },
  ],
  yAxis: [
    {
      type: "value",
      min: 0,
      axisLabel: {
        formatter: "{value} %",
        textStyle: {
          fontWeight: "bold",
          fontSize: 9,
        },
      },
    },
  ],
  series: [
    {
      name: "5年期风险",
      type: "bar",
      color: "#0369a1",
      itemStyle: {
        normal: {
          label: {
            show: true,
            rotate: 90,
            position: ["20%", "-10%"],
            textStyle: {
              color: "#374151",
              fontWeight: "bold",
              fontSize: 8,
            },
            formatter: function (d) {
              return d.data + "%";
            },
          },
          shadowBlur: 3,
        },
      },
      tooltip: {
        valueFormatter: function (value) {
          return value + " %";
        },
      },
      data: status2prob(5),
    },
    {
      name: "10年期风险",
      type: "bar",
      color: "#e11d48",
      itemStyle: {
        normal: {
          label: {
            show: true,
            rotate: 90,
            position: ["20%", "-5%"],
            textStyle: {
              color: "#374151",
              fontWeight: "bold",
              fontSize: 8,
            },
            formatter: function (d) {
              return d.data + "%";
            },
          },
          shadowBlur: 3,
        },
      },
      tooltip: {
        valueFormatter: function (value) {
          return value + " %";
        },
      },
      data: status2prob(10),
    },
  ],
};

onMounted(() => {
  chartDom = document.getElementById("lung-bar");
  myChart = echarts.init(chartDom);
  option && myChart.setOption(option);
});

onBeforeUnmount(()=> {
    myChart.dispose();
})

// watch(
//   () => store.getters.getLungStatus,
//   () => {
//     myChart.setOption(option);
//   }
// );
</script>
