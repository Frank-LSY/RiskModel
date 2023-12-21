<template>
  <div class="flex flex-wrap justify-center relative">
    <img
      src="@assets/img/bg-large.jpg"
      class="absolute top-0 left-0 w-full h-full opacity-0 lg:opacity-20 z-0"
    />
    <router-view
      class="w-full md:w-full bg-amber-50 lg:w-1/2 xl:w-2/5 shadow-lg z-10"
    ></router-view>
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>
