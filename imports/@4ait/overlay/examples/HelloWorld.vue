<style module lang="scss">
  .main-back
  {
    background: rgba(0, 0, 0, 0.35);
  }

  .main-box
  {
    background: aqua;
    width: 200px;
    height: 120px;
  }

  .slide-fade-enter-active
  {
    .main-box
    {
      transition: all 0.3s ease-out;
    }

    .main-back
    {
      transition: all 0.3s ease-out;
    }
  }

  .slide-fade-leave-active {
    .main-box
    {
      transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
    }
    .main-back
    {
      transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
    }
  }

  .slide-fade-enter-from,
  .slide-fade-leave-to {
    .main-box
    {
      transform: translateX(20px);
      opacity: 0;
    }

    .main-back
    {
      opacity: 0;
    }
  }
</style>

<template>
  <div>
    <h1 @click="enabledOverlay = true">Click here for display overlayed component</h1>

    <div ref="attach" style="width: 50px; height: 50px; background: red"></div>

    <overlay
        v-model:enabled="enabledOverlay"
        :attach-to="$refs.attach"
        attach-x="right"
        @click-back="enabledOverlay=false"

        :back-classes="[$style['main-back']]"

        :transition-enabled="true"

        :transition-enter-active-class="$style['slide-fade-enter-active']"
        :transition-enter-from-class="$style['slide-fade-enter-from']"
        :transition-leave-active-class="$style['slide-fade-leave-active']"
        :transition-leave-to-class="$style['slide-fade-leave-to']"

        :transition-duration="{ enter: 300, leave: 800 }"
    >
      <attach :attach-to="$refs.attach" attach-x="right">
        <div :class="$style['main-box']"></div>
      </attach>
    </overlay>
  </div>
</template>

<script>
import { Options, Vue } from 'vue-class-component';
import Overlay from "@/Overlay.vue";

@Options({
  components: {Overlay},
})
export default class HelloWorld extends Vue {
  enabledOverlay = false;
}
</script>
