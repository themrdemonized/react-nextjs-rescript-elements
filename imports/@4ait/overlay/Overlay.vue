<style module lang="scss">
  .frame
  {
    position: fixed;
    left: 0;
    top: 0;
  }
</style>

<template>
  <teleport v-if="overlayData.teleportTo || displayAsBlock"
            :to="overlayData.teleportTo"
            :disabled="displayAsBlock && !enabled">
    <transition
        :css="transitionEnabled"

        :leave-active-class="transitionLeaveActiveClass"
        :leave-from-class="transitionLeaveFromClass"
        :leave-to-class="transitionLeaveToClass"

        :enter-active-class="transitionEnterActiveClass"
        :enter-from-class="transitionEnterFromClass"
        :enter-to-class="transitionEnterToClass"

        :duration="transitionDuration"

        appear
    >
      <div v-if="enabled || displayAsBlock"
           :class="{
              [$style.frame]: enabled
            }"
           :style="{ 'z-index': displayAsBlock && !enabled ? '' : currentZIndex }"
      >
        <slot></slot>
      </div>
    </transition>
  </teleport>
</template>

<script setup>
  import OverlayVueProvideKey from "./OverlayVueProvideKey";
  import DefaultOverlayData from "./DefaultOverlayData";
  import {computed, inject, ref, toRefs, watch} from 'vue';

  const props = defineProps({
    enabled: {
      type: Boolean,
      default: false
    },
    transitionEnabled: {
      type: Boolean,
      default: false
    },
    transitionDuration: {
      type: [Object, Number],
      default: undefined
    },
    transitionEnterFromClass: {
      type: String,
      default: undefined
    },
    transitionEnterActiveClass: {
      type: String,
      default: undefined
    },
    transitionEnterToClass: {
      type: String,
      default: undefined
    },
    transitionLeaveFromClass: {
      type: String,
      default: undefined
    },
    transitionLeaveActiveClass: {
      type: String,
      default: undefined
    },
    transitionLeaveToClass: {
      type: String,
      default: undefined
    },
    displayAsBlock: {
      type: Boolean,
      default: false
    }
  })

  const overlayData = inject(OverlayVueProvideKey, DefaultOverlayData);

  let currentZIndex = ref(0);

  function activate()
  {
    currentZIndex.value = overlayData.requestZIndex();
  }

  watch(() => props.enabled, () => {
    if(props.enabled)
    {
      activate();
    }
  });

  if(props.enabled)
  {
    activate();
  }
</script>
