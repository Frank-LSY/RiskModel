<template>
  <div class="flex flex-wrap justify-center content-center">
    <div
      class="z-50 overflow-auto relative bg-gray-100 bg-opacity-70 h-vint w-5/6 sm:w-2/3 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-2xl flex flex-wrap content-start justify-center"
    >
      <div class="text-lg font-semibold text-gray-700 py-4 w-2/3 my-1">
        请输入身份证号
      </div>
      <input
        class="pl-2 w-2/3 my-1"
        v-model="personid"
        type="text"
        placeholder="身份证号"
      />
      <div class="text-red-500 font-semibold text-right w-2/3" v-if="showPS">
        请输入身份证号!
      </div>
      <button
        class="absolute bottom-2 right-4 w-1/4 py-0.5 bg-amber-300 rounded shadow-lg"
        @click="showHistory()"
      >
        确认
      </button>
    </div>
    <div class="h-deux w-full"></div>
    <div
      class="z-50 h-quarantecinq w-5/6 sm:w-2/3 overflow-auto text-right bg-gray-100 bg-opacity-60 shadow-lg shadow-stone-200 focus:shadow-stone-700 rounded-2xl flex flex-wrap justify-center content-start"
      v-if="showList"
    >
      <div class="text-lg font-semibold w-2/3">
        您有<span class="text-amber-500">{{ reportList.length }}</span
        >条记录
      </div>
      <div class="w-5/6 text-center">
        <div
          class="grid grid-cols-5 border-t-4 border-gray-400 last:border-b-4"
          v-for="(item, i) in reportList"
          :key="i"
        >
          <div class="col-span-3 border-r-4 border-gray-400 py-2">
            {{ item.description }}
          </div>
          <div class="col-span-2">
            <button
              class="py-1 px-2 m-1 bg-amber-300 rounded shadow-lg border border-amber-400"
              @click="getPollDetail(item.pollId)"
            >
              查看
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import API from "@/api.js";
import { infoMessage } from "@/assets/js/common";

const router = useRouter();
const store = useStore();

const personid = ref("");

const showList = ref(false);
const showPS = ref(false);
const showHistory = () => {
  if (personid.value === "") {
    showPS.value = true;
  } else {
    showPS.value = false;

    getUser();
    getPoll();
  }
};

// const showDetail = (pollid) => {
//   store.commit("changeLoginStatus", true);
//   router.push("history");
//   getPollDetail(pollid);
// };

const reportList = ref([]);

const getUser = () => {
  API.user({
    userId: personid.value,
  }).then((res) => {
    store.commit("changeCurrentUser", res.data[0]);
    showList.value = true;
  }).catch((err)=>
  {
    infoMessage(err)
  });
};

const getPoll = () => {
  API.userPolls({
    userId: personid.value,
  }).then((res) => {
    reportList.value = res.data;
  }).catch((err)=>{
    infoMessage(err)
  });
};

const getPollDetail = (pollid) => {
  API.pollDetails({
    pollId: pollid,
  }).then((res) => {
    store.commit("changeCurrentPoll", res.data);
    store.commit("changeCurrentPollId", pollid);
    store.commit("changeLoginStatus", true);
    router.push("cardiovascular");
  });
};

onMounted(() => {});
</script>
