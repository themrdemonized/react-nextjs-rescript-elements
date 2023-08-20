<style module lang="scss">
  .root
  {
    position: fixed;
  }

  .hidden
  {
    opacity: 0;
    pointer-events: none;
    user-select: none;
  }
</style>

<template>
  <div
      ref="root"
      :class="{
        [$style.root]: true,
        [$style.hidden]: !display
      }"
      :style="{
          transform: 'translate(' + (left !== null ? left : right - screenWidth) + 'px, ' + (top !== null ? top : bottom - screenHeight) + 'px)',
          top: top !== null ? '0' : 'unset',
          left: left !== null ? '0' : 'unset',
          bottom: bottom !== null ? '0' : 'unset',
          right: right !== null ? '0' : 'unset',
          'max-height': mode === 'wo-overlay' ? maxHeight + 'px' : ''
      }"
  >
    <slot></slot>
  </div>
</template>

<script setup>
import {computed, onBeforeMount, onBeforeUnmount, onMounted, onUnmounted, ref} from "vue";

  const props = defineProps({
    attachTo: {
      type: Object,
      default: null
    },
    attachX: {
      type: [String, Number],
      default: "left"
    },
    attachY: {
      type: [String, Number],
      default: "bottom"
    },
    anchorX: {
      type: [String, Number],
      default: "left"
    },
    anchorY: {
      type: [String, Number],
      default: "top"
    },
    offsetX: {
      type: Number,
      default: 0
    },
    offsetY: {
      type: Number,
      default: 0
    },
    padding: {
      type: Number,
      default: 0
    },
    paddingTop: {
      type: Number,
      default: 0
    },
    paddingLeft: {
      type: Number,
      default: 0
    },
    paddingRight: {
      type: Number,
      default: 0
    },
    paddingBottom: {
      type: Number,
      default: 0
    },
    mode: {
      type: String,
      default: 'base'
    },
    invertPositionSizeRatio: {
      type: Number,
      default: 1.0
    },
    minSizeForInvertPosition: {
      type: Number,
      default: null
    }
  });

  let animationFrameUpdatePositionId = null;

  const screenWidth = ref(Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0));
  const screenHeight = ref(Math.max(document.documentElement.clientHeight || 0, window.innerHeight || 0));

  function updateSreenSizes()
  {
    screenWidth.value = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0);
    screenHeight.value = Math.max(document.documentElement.clientHeight || 0, window.innerHeight || 0);
  }

  window.addEventListener("resize", updateSreenSizes);

  onUnmounted(() => {
    window.removeEventListener("resize", updateSreenSizes);
  });

  const left = ref(0);
  const top = ref(0);
  const bottom = ref(null);
  const right = ref(null);

  const display = ref(false);

  const root = ref(null);

  const attachTo = computed(() => {
    let userAttachTo = props.attachTo;

    if(userAttachTo)
    {
      if(userAttachTo.$el)
      {
        return userAttachTo.$el;
      }

      return userAttachTo;
    }

    return null;
  });

  const maxHeight = ref(null);

  function updatePositionWithoutOverlay()
  {
    let attachRect = null;

    if(!!attachTo.value && attachTo.value.isConnected)
    {
      attachRect = attachTo.value.getBoundingClientRect();
    }

    let attachLeft = 0;

    if(typeof props.attachX === "number")
    {
      attachLeft = props.attachX;
    }
    else
    {
      if(attachRect === null)
      {
        display.value = false;
        return;
      }

      if(props.attachX === 'left')
      {
        attachLeft = attachRect.left;
      }
      else if(props.attachX === 'center')
      {
        attachLeft = attachRect.left + attachRect.width / 2;
      }
      else if(props.attachX === 'right')
      {
        attachLeft = attachRect.left + attachRect.width;
      }
    }

    let attachTop = 0;

    if(typeof props.attachY === "number")
    {
      attachTop = props.attachY;
    }
    else
    {
      if(attachRect === null)
      {
        display.value = false;
        return;
      }

      if(props.attachY === 'top')
      {
        attachTop = attachRect.top;
      }
      else if(props.attachY === 'center')
      {
        attachTop = attachRect.top + attachRect.height / 2;
      }
      else if(props.attachY === 'bottom')
      {
        attachTop = attachRect.top + attachRect.height;
      }
    }

    let elementRect = root.value.getBoundingClientRect();

    let anchorLeft = 0;

    if(typeof props.anchorX === "number")
    {
      anchorLeft = props.anchorX;
    }
    else if(props.anchorX === 'left')
    {
      anchorLeft = 0;
    }
    else if(props.anchorX === 'center')
    {
      anchorLeft = elementRect.width / 2;
    }
    else if(props.anchorX === 'right')
    {
      anchorLeft = elementRect.width;
    }

    let anchorTop = 0;

    if(typeof props.anchorY === "number")
    {
      anchorTop = props.anchorY;
    }
    else if(props.anchorY === 'top')
    {
      anchorTop = 0;
    }
    else if(props.anchorY === 'center')
    {
      anchorTop = elementRect.height / 2;
    }
    else if(props.anchorY === 'bottom')
    {
      anchorTop = elementRect.height;
    }

    const vw = screenWidth.value;
    const vh = screenHeight.value;

    let topBorder = props.paddingTop + props.padding;
    let leftBorder = props.paddingLeft + props.padding;
    let bottomBorder = vh - (props.paddingBottom + props.padding);
    let rightBorder = vw - (props.paddingRight + props.padding);

    let lTopInitial = attachTop - anchorTop + props.offsetY;

    let lLeft = attachLeft - anchorLeft + props.offsetX;

    // TODO: Process others conditions
    if(props.attachY === 'bottom' && props.anchorY === 'top')
    {
      let lBottom = (attachRect.top + attachRect.height / 2) -
                      (lTopInitial - (attachRect.top + attachRect.height / 2));

      let useInitialTop;
      if(props.minSizeForInvertPosition)
      {
        useInitialTop = bottomBorder - lTopInitial > props.minSizeForInvertPosition ||
                        bottomBorder - lTopInitial > lBottom - topBorder;
      }
      else
      {
        useInitialTop = bottomBorder - lTopInitial > (lBottom - topBorder) * props.invertPositionSizeRatio;
      }

      if(useInitialTop)
      {
        maxHeight.value = bottomBorder - lTopInitial;
        top.value = lTopInitial;
        bottom.value = null;
      }
      else
      {
        maxHeight.value = lBottom - topBorder;
        bottom.value = lBottom;
        top.value = null;
      }

      if(lLeft < leftBorder)
      {
        lLeft = leftBorder;
      }

      if(lLeft + elementRect.width > rightBorder)
      {
        lLeft = rightBorder - elementRect.width;
      }

      left.value = lLeft;
      right.value = null;

      display.value = true;
    }
    else
    {
      console.warn(`props.attachY: '${props.attachY}' and props.anchorY: '${props.anchorY}' is not supported`)
    }
  }

  function updatePositionBase()
  {
    let attachRect = null;

    if(!!attachTo.value && attachTo.value.isConnected)
    {
      attachRect = attachTo.value.getBoundingClientRect();
    }

    let attachLeft = 0;

    if(typeof props.attachX === "number")
    {
      attachLeft = props.attachX;
    }
    else
    {
      if(attachRect === null)
      {
        display.value = false;
        return;
      }

      if(props.attachX === 'left')
      {
        attachLeft = attachRect.left;
      }
      else if(props.attachX === 'center')
      {
        attachLeft = attachRect.left + attachRect.width / 2;
      }
      else if(props.attachX === 'right')
      {
        attachLeft = attachRect.left + attachRect.width;
      }
    }

    let attachTop = 0;

    if(typeof props.attachY === "number")
    {
      attachTop = props.attachY;
    }
    else
    {
      if(attachRect === null)
      {
        display.value = false;
        return;
      }

      if(props.attachY === 'top')
      {
        attachTop = attachRect.top;
      }
      else if(props.attachY === 'center')
      {
        attachTop = attachRect.top + attachRect.height / 2;
      }
      else if(props.attachY === 'bottom')
      {
        attachTop = attachRect.top + attachRect.height;
      }
    }

    let elementRect = root.value.getBoundingClientRect();

    let anchorLeft = 0;

    if(typeof props.anchorX === "number")
    {
      anchorLeft = props.anchorX;
    }
    else if(props.anchorX === 'left')
    {
      anchorLeft = 0;
    }
    else if(props.anchorX === 'center')
    {
      anchorLeft = elementRect.width / 2;
    }
    else if(props.anchorX === 'right')
    {
      anchorLeft = elementRect.width;
    }

    let anchorTop = 0;

    if(typeof props.anchorY === "number")
    {
      anchorTop = props.anchorY;
    }
    else if(props.anchorY === 'top')
    {
      anchorTop = 0;
    }
    else if(props.anchorY === 'center')
    {
      anchorTop = elementRect.height / 2;
    }
    else if(props.anchorY === 'bottom')
    {
      anchorTop = elementRect.height;
    }

    let lTop = attachTop - anchorTop + props.offsetY;
    let lLeft = attachLeft - anchorLeft + props.offsetX;

    const vw = screenWidth.value;
    const vh = screenHeight.value;

    let topBorder = props.paddingTop + props.padding;

    /* Always on screen checking */
    if(lTop < topBorder)
    {
      lTop = topBorder;
    }

    let leftBorder = props.paddingLeft + props.padding;

    if(lLeft < leftBorder)
    {
      lLeft = leftBorder;
    }

    let bottomBorder = vh - (props.paddingBottom + props.padding);

    if(lTop + elementRect.height > bottomBorder)
    {
      lTop = bottomBorder - elementRect.height;
    }

    let rightBorder = vw - (props.paddingRight + props.padding);

    if(lLeft + elementRect.width > rightBorder)
    {
      lLeft = rightBorder - elementRect.width;
    }

    left.value = lLeft;
    top.value = lTop;
    bottom.value = null;
    right.value = null;
    display.value = true;
  }

  const updatePosition = computed(() => {
    if(props.mode === 'base')
    {
      return updatePositionBase;
    }
    else if(props.mode === 'wo-overlay')
    {
      return updatePositionWithoutOverlay;
    }

    return updatePositionBase;
  })

  function animationFrameUpdatePosition()
  {
    updatePosition.value();
    animationFrameUpdatePositionId = requestAnimationFrame(animationFrameUpdatePosition);
  }

  onBeforeMount(() => {
    display.value = false;
  });

  onMounted(() =>
  {
    animationFrameUpdatePositionId = requestAnimationFrame(animationFrameUpdatePosition);
  });

  onBeforeUnmount(()=>
  {
    if(animationFrameUpdatePositionId !== null)
    {
      cancelAnimationFrame(animationFrameUpdatePositionId);
    }
  });
</script>
