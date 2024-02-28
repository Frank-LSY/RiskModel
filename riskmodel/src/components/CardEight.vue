<template>
  <div
    :class="[
      'cursor-pointer ring-offset-2 hover:ring-2 w-2/3 sm:w-2/5 h-quatre flex flex-wrap justify-evenly place-content-center shadow-xl rounded-xl my-2 bg-gray-400 bg-opacity-40',
      props.score === 100 ? 'hover:ring-emerald-400' : 'hover:ring-rose-500',
      props.score === 100
        ? 'hover:shadow-emerald-600'
        : 'hover:shadow-rose-600',
    ]"
    @click="detailDescription()"
  >
    <SvgIcon
      :iconName="props.iconName"
      :class="[
        'fill-gray-700 w-6 h-6 rounded-full ring-2 ring-offset-2',
        props.bg,
        props.ring,
      ]"
    ></SvgIcon>
    <div class="font-semibold text-gray-700">{{ props.name }}</div>
    <SvgIcon
      :iconName="props.score === 100 ? 'icon-zhengque' : 'icon-cuowu'"
      :class="[
        props.score === 100 ? 'fill-emerald-400' : 'fill-rose-500',
        'w-6 h-6',
      ]"
    ></SvgIcon>
  </div>
</template>

<script setup>
import { useStore } from "vuex";

const store = useStore();

const props = defineProps({
  iconName: String,
  bg: String,
  ring: String,
  name: String,
  score: Number,
});

const detailDescription = () => {
  console.log('show!')
  store.commit("changeDescriptionDialog", {
    show: true,
    iconName: props.iconName,
    bg: props.bg,
    ring: props.ring,
    name: props.name,
  });
};
</script>
