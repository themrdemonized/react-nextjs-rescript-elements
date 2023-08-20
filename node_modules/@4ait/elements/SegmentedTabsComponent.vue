<style module lang="scss">
@import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

.body {
  display: flex;
  height: 40px;
  min-width: 288px;

  position: relative;

  justify-content: center;
  flex-direction: row;
  align-items: center;

  padding: 0 2px;

  background: var(--4ait-elements--segmented-tabs--body-background-color);
  border-radius: 12px;

  @include setFont(font-4ait-elements, caption-m);
}

.tab {
  width: 100%;
  height: 36px;

  padding: 0 6px;

  border-radius: 10px;
  flex:1 1 auto;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  white-space: nowrap;

  user-select: none;


  position: relative;

  cursor: pointer;





  &:hover {
    background: var(--4ait-elements--segmented-tabs--hovered-background-color);
    color: var(--4ait-elements--segmented-tabs--hovered-background-color);
  }
}

.disabled {
  pointer-events: none;

  .tab {
    color: var(--4ait-elements--segmented-tabs--disabled-label-color);
    &:hover {
      background: none;
    }
  }
  .tab-labels {
    color: var(--4ait-elements--segmented-tabs--disabled-label-color);
  }
}

.divider {
  position: absolute;
  left: -1px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  flex: 0 0 auto;

  height: 20px;
  width: 1px;

  background: var(--4ait-elements--segmented-tabs--body-divider-color);

  transition: border ease 0.2s;

  box-sizing: content-box;
}

.display-none {
  opacity: 0;
  transition: all cubic-bezier(1, 0, 0.65, 0.62) 0.2s;
}

.selected-tab {
  position: absolute;

  height: 36px;
  width: 136px;


  border-radius: 10px;

  transition: all ease 0.2s;

  background: var(--4ait-elements--segmented-tabs--selected-tab-background-color);
  box-shadow: var(--4ait-elements--segmented-tabs--selected-tab-box-shadow);


}

.transition-none {
  transition: none;
}

.cursor-auto {
  cursor: auto;
}

.tab-label-wrapper {
  width: calc(100% - 4px);
  left: 2px;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;

  position: absolute;


  pointer-events: none;
}

.tab-labels {

  width: 100%;
  height: 36px;

  padding: 0 6px;

  border-radius: 10px;
  flex:1 1 auto;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  white-space: nowrap;

  user-select: none;


  position: relative;

  cursor: pointer;
  &.disabled {
    color: var(--4ait-elements--segmented-tabs--disabled-label-color);
  }
}

.small {
  &.body {
    min-width: 264px;
    height: 32px;

    border-radius: 8px;
  }

  .tab {
    height: 28px;

    border-radius: 6px;
  }

  .selected-tab {
    height: 28px;

    border-radius: 6px;
  }

  @include setFont(font-4ait-elements, caption-s);
}
</style>


<template>
  <div>
    <div
        :class="{
                    [$style['body']]: true,
                    [$style.focused]: isFocused,
                    [$style.disabled]: disabled === true || disabled === 'true',
                    [$style.small]: type === 'S'
                }"
        ref="body"
    >
      <div
          :class="{
                      [$style['tab']]: true,
                      [$style.disabled]: disabledTabs[tab-1]
                  }"

          v-for="tab in countTabs"
          :key="tab"
          @click="selectTab(tab)"
      >
        <div :class="{[$style['divider']]: true,
                      [$style['display-none']]: (selectedTab === tab || tab === 1 || tab === (selectedTab+1) )}"></div>
        <div style="opacity: 0">
          <slot :name="tab"></slot>
        </div>

      </div>

      <div
          :class="{[$style['selected-tab']]: true,
                   [$style['transition-none']]: isTransitionOff}"
          :style="{width: selectedTabWidth + 'px', left: leftOffset + 'px'}"
          ref="slider"
      ></div>

      <div :class="{
                      [$style['tab-label-wrapper']]: true
                  }">
        <div
            :class="{
                      [$style['tab-labels']]: true,
                      [$style.disabled]: disabledTabs[tab-1]
                  }"

            v-for="tab in countTabs"
            :key="tab"
        >
          <slot :name="tab"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {ref, watchEffect} from "vue";
import {Options, Vue} from "vue-class-component"

@Options({
  props: {
    countTabs: {
      type: [ Number ],
      default: 2
    },
    modelValue: {
      type: Number
    },
    disabled: {
      type: [ String, Boolean ],
      default: false
    },
    type: {
      type: [ String ],
      default: "M"
    },
    disabledTabs: {
      type: Array,
      default: []
    }
  },
  components: {},
  computed: {

  },
  emits: ['update:modelValue'],
  watch: {
    modelValue: function(newValue)
    {
      this.selectedTab = newValue;
    },
    disabled: function (newValue) {
      if(newValue)
      {
        this.isFocused = false;
      }
    },
    selectedTab: function (newValue) {
      if (this.transitionTimer != null) {
        clearTimeout(this.transitionTimer)
      }
      if (this.updateValueTimer != null) {
        clearTimeout(this.updateValueTimer)
      }
      this.isTransitionOff = false;
      this.handleResize();
      this.updateValueTimer = setTimeout(() => {
        this.$emit('update:modelValue', this.selectedTab);
        this.updateValueTimer = null
      }, 85)
      this.transitionTimer =  setTimeout(() => {
        this.isTransitionOff = true;
        this.transitionTimer = null;
      }, 200);
    },
    countTabs: function (newValue) {
      if (this.selectedTab > newValue){
        this.selectedTab = newValue;
      }
      this.resizeObserverRestart();
    }
  }
})

export default class SegmentedTabsComponent extends Vue {
  isFocused = false;
  selectedTab = 1;
  selectedTabWidth = 0;
  leftOffset = 0;
  isRendered = false;
  currentResizeObserver = null;
  isTransitionOff = true;
  transitionTimer = null;
  updateValueTimer = null;

  beforeMount()
  {
    if (this.modelValue <= this.countTabs) {
      if (this.modelValue != null) {
        this.selectedTab = this.modelValue;
      } else {
        this.selectedTab = 0;
        for (let i = 1; i < this.countTabs; i++) {
          if (!this.disabledTabs[i-1]) {
            this.selectedTab = (i)
            break;
          }
        }
      }
    } else {
      this.selectedTab = this.countTabs;
    }

    this.$emit('update:modelValue', this.selectedTab);
  }

  mounted() {
    this.isTransitionOff = true;
    this.handleResize();
    this.resizeObserverRestart();
  }

  beforeUnmount () {
    if (this.currentResizeObserver !== null) {
      this.currentResizeObserver.disconnect();
    }
  }

  unmounted()
  {
    if (this.transitionTimer != null) {
      clearTimeout(this.transitionTimer)
    }
    if (this.updateValueTimer != null) {
      clearTimeout(this.updateValueTimer)
    }
  }

  handleResize() {
    this.$nextTick(() => {
      this.selectedTabWidth = this.$refs.body.children[this.selectedTab-1].getBoundingClientRect().width;
      this.leftOffset = this.$refs.body.children[this.selectedTab-1].getBoundingClientRect().left-this.$refs.body.getBoundingClientRect().left
      this.isRendered = true
    })
  }

  resizeObserverRestart() {
    if (this.currentResizeObserver != null) {
      this.currentResizeObserver.disconnect();
    }
    this.handleResize();
    this.$nextTick(() => {
      const currentResizeObserverTriggered = ref(false);
      this.currentResizeObserver = new ResizeObserver(() => {
        currentResizeObserverTriggered.value = true;
      });
      for (let i = 0; i < this.countTabs; i++) {
        this.currentResizeObserver.observe(this.$refs.body.children[i]);
      }

      if(this.curWatchEffectcurrentResizeObserver)
      {
        this.curWatchEffectcurrentResizeObserver();
      }

      this.curWatchEffectcurrentResizeObserver = watchEffect(() => {
        if(currentResizeObserverTriggered.value)
        {
          currentResizeObserverTriggered.value = false;

          this.selectedTabWidth = this.$refs.body.children[this.selectedTab-1].getBoundingClientRect().width;
          this.leftOffset = this.$refs.body.children[this.selectedTab-1].getBoundingClientRect().left-this.$refs.body.getBoundingClientRect().left;
        }
      });
    })
  }

  selectTab(index) {
    this.selectedTab = index;
  }
}
</script>
