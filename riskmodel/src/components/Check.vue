<template>
  <div class="flex flex-wrap justify-center content-center">
    <div
      class="z-50 overflow-auto relative bg-gray-100 bg-opacity-70 h-vint w-5/6 sm:w-2/3 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-2xl flex flex-wrap content-center justify-center"
    >
      <div class="text-lg font-semibold text-gray-700 py-4 w-2/3">
        请输入身份证号
      </div>
      <input
        class="pl-2 w-2/3"
        v-model="personid"
        type="text"
        placeholder="身份证号"
      />
      <button
        class="absolute bottom-2 right-4 w-1/4 py-0.5 bg-amber-300 rounded shadow-lg"
        @click="showHistory = true"
      >
        确认
      </button>
    </div>
    <div class="h-deux w-full"></div>
    <div
      class="z-50 h-quarantecinq w-5/6 sm:w-2/3 overflow-auto text-right bg-gray-100 bg-opacity-60 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-2xl flex flex-wrap justify-center content-start"
        v-if="showHistory"
      >
      <div class="text-lg font-semibold w-2/3">
        您有<span class="text-amber-500">{{ reportList.length }}</span
        >条记录
      </div>
      <div class=" w-5/6 text-center">
        <div class="grid grid-cols-5 border-t-4 border-gray-400 last:border-b-4" v-for="(item, i) in reportList" :key="i">
          <div class="col-span-3 border-r-4 border-gray-400 py-2">{{ item.name }}</div>
          <div class="col-span-2 ">
            <button class="py-1 px-2 m-1 bg-amber-300 rounded shadow-lg border border-amber-400" @click="showDetail">查看</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";

const router = useRouter();

const personid = ref("");

const showHistory = ref(true);

const showDetail = ()=> {
    router.push('history')
}

const reportList = [
  {
    name: "我的体检报告",
  },
  {
    name: "我的体检报告 2",
  },
];
</script>
