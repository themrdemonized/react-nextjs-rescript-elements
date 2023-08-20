<style module lang="scss">
  .disable-default
  {
    -ms-overflow-style: none; /* Internet Explorer 10+ */
    scrollbar-width: none; /* Firefox */

    &::-webkit-scrollbar {
      display: none; /* Safari and Chrome */
    }
  }

  .root
  {
      position: absolute;
      top: 0;
      right: 0;
      width: 14px;
      height: 100%;
      overflow: hidden;

      pointer-events: none;
  }

  .body-mode
  {
    position: fixed;
    height: 100vh;
    z-index: 9999999;
  }

  .scrollbar
  {
      position: absolute;

      //left: 50%;
      top: 50%;
      transform: translate(0, -50%);
      right: 2px;

      border-radius: 3px;

      width: 6px;
      height: calc(100% - 4px);
      background: #757575;
      border: 1px solid #FFFFFF;

      transition: width 120ms;
  }

  .scrollbar-box
  {
      position: absolute;

      right: 0;

      box-sizing: border-box;

      width: 14px;

      will-change: transform, opacity, height;
      transform: translateY(0);

      opacity: 0;

      &:hover
      {
          opacity: 0.6;

          .scrollbar
          {
              width: 10px;
          }
      }

      &:active
      {
          opacity: 0.8;
          transition: none;
      }
  }

  .scrollbar-display
  {
    opacity: 0.4;
  }

  .scrollbar-interact
  {
    opacity: 0.8;

    .scrollbar
    {
      width: 10px;
    }
  }

  .scrollbar-box
  {
    &.required
    {
      transition: opacity 320ms, padding 320ms, width 320ms, height 320ms;
      pointer-events: auto;
    }

    &:not(.required)
    {
      opacity: 0;
      transition-duration: 180ms;
      pointer-events: none;
    }
  }

  .required
  {}
</style>

<template>
    <div :class="$style.root" v-if="enabled" >
        <div :class="$style['scrollbar-box']"
             ref="scrollbarBox"
             @mousedown.prevent="onMouseDownScrollbarBox"
             @mousemove.prevent
             @wheel.prevent
        >
            <div :class="$style.scrollbar"></div>
        </div>
    </div>
</template>

<script>
    import { Options, Vue } from "vue-class-component";
    import AnimationFrameProcessor from "@4ait/animation_frame_processor";
    import TimeoutResetter from "@4ait/timeout_resetter";

    @Options({
        components: {
        },
        props: {
          display: {
              type: Boolean,
              default: true
          },
          alwaysDisplay: {
              type: Boolean,
              default: false
          },
          scrollElement: HTMLElement,
          reactiveUpdateParams: 0
        },
        watch: {
          reactiveUpdateParams() {
              this.onScrollBox();
          },
          scrollElement(newElement, oldElement) {
              if(this.enabled && this.scrollElement)
              {
                  if(oldElement)
                  {
                      this.freeElement(oldElement);
                  }

                  this.initializeElement();
              }
          },
          display() {
            if(this.enabled)
            {
              this.requestUpdateHidingScrollbar();
            }
          },
          scrollbarIsRequired() {
            if(this.enabled)
            {
              this.requestUpdateHidingScrollbar();
            }
          }
        }
    })
    export default class ScrollbarComponent extends Vue
    {
      scrollbarIsRequired = false;
      enabled = true;

      beforeMount()
      {
        if(navigator.platform.indexOf('Win') === -1 &&
            navigator.platform.indexOf('Mac') === -1)
        {
            this.enabled = false;
        }
      }

      mounted()
      {
        if(!this.enabled)
        {
            return;
        }

        if(this.scrollElement)
        {
          this.initializeElement();
        }
      }

      initializeElement()
      {
        const scrollbarBox = this.$refs.scrollbarBox;

        const scrollbarBoxClassList = scrollbarBox.classList;

        this.scrollbarBoxStyle = scrollbarBox.style;
        this.scrollbarBoxClassList = scrollbarBoxClassList;

        if(this.scrollbarMouseYPos !== null)
        {
          this.scrollbarBoxClassList.remove(this.$style["scrollbar-interact"]);
        }

        this.scrollbarHeight = 80;
        this.scrollbarMinHeight = 80;
        this.scrollbarTopOffset = 0;
        this.lastScrollTop = -1;
        this.lastClientHeight = -1;
        this.lastScrollHeight = -1;
        this.scrollbarDisplay = false;
        this.scrollbarMouseYPos = null;

        this.scrollElementProps = {};

        this.scrollElement.classList.add(this.$style["disable-default"]);

        const bodyMode = this.scrollElement === document.documentElement;

        this.bodyMode = bodyMode;

        if(bodyMode)
        {
          this.$el.classList.add(this.$style["body-mode"]);
        }
        else
        {
          this.$el.classList.remove(this.$style["body-mode"]);
        }

        this.timeoutResetterActivateScrollbar = new TimeoutResetter(this.requestResetScrollbarDisplay, 1000);

        if(this.alwaysDisplay)
        {
          this.setScrollBarDisplay(true);
        }
        else
        {
          this.scrollElementProps.scrollHeight = this.scrollElement.scrollHeight;
          this.scrollElementProps.clientHeight = this.scrollElement.clientHeight;

          //this.scrollElement.addEventListener("scroll", this.onScrollBox);
          this.scrollElement.addEventListener("mouseenter", this.onMouseEnterBox);
          this.scrollElement.addEventListener("mousemove", this.onMouseMoveElement);
          this.activateScrollbar();
        }

        this.scrollbarBoxStyle.height = this.scrollbarHeight + 'px';

        this.requestUpdateScrollbarParams();
      }

      freeElement(element)
      {
        element.classList.remove(this.$style["disable-default"]);

        window.removeEventListener('mousemove', this.onMouseMoveWindowScrollbarChange, false);
        window.removeEventListener('mouseup', this.onMouseUpWindowScrollbarChange, false);

        //this.scrollElement.removeEventListener("scroll", this.onScrollBox);
        element.removeEventListener("mouseenter", this.onMouseEnterBox);
        element.removeEventListener("mousemove", this.onMouseMoveElement);

        this.timeoutResetterActivateScrollbar.cancel();

        AnimationFrameProcessor.cancel(this.animationFrameIdHeightChange);
        AnimationFrameProcessor.cancel(this.animationFrameIdScrollbarTopOffset);
        AnimationFrameProcessor.cancelStylesGet(this.mouseMoveAnimationFrameId);
        AnimationFrameProcessor.cancel(this.activateScrollbarAnimationFrameId);
        AnimationFrameProcessor.cancelStylesGet(this.animationFrameStyleGetIdUpdateScrollBarParams);
        AnimationFrameProcessor.cancelStylesGet(this.animationFrameIdStylesGetMouseEnter);
        AnimationFrameProcessor.cancel(this.animationFrameIdMouseMoveWindowScrollbarChange);
        AnimationFrameProcessor.cancelStylesGet(this.animationFrameIdStylesGetMouseMoveWindowScrollbarChange);
        AnimationFrameProcessor.cancel(this.animationFrameIdResetScrollbarDisplay);
        AnimationFrameProcessor.cancel(this.animationFrameIdInteractChange);
      }

      beforeUnmount()
      {
        if(!this.enabled)
        {
            return;
        }

        if(this.scrollElement)
        {
            this.freeElement(this.scrollElement);
        }
      }

      requestResetScrollbarDisplay()
      {
        AnimationFrameProcessor.cancel(this.animationFrameIdResetScrollbarDisplay);
        this.animationFrameIdResetScrollbarDisplay = AnimationFrameProcessor.request(this.resetScrollbarDisplay);
      }

        requestScrollbarInteractOn()
        {
          this.scrollbarBoxClassList.add(this.$style["scrollbar-interact"]);
        }

        requestScrollbarInteractOff()
        {
          this.scrollbarBoxClassList.remove(this.$style["scrollbar-interact"]);
        }

        onMouseDownScrollbarBox(event)
        {
          if(this.scrollbarMouseYPos === null)
          {
            AnimationFrameProcessor.cancel(this.animationFrameIdInteractChange);
            this.animationFrameIdInteractChange = AnimationFrameProcessor.request(this.requestScrollbarInteractOn);
          }

          this.scrollbarMouseYPos = event.offsetY;

          window.removeEventListener('mousemove', this.onMouseMoveWindowScrollbarChange, false);
          window.removeEventListener('mouseup', this.onMouseUpWindowScrollbarChange, false);

          window.addEventListener('mousemove', this.onMouseMoveWindowScrollbarChange, false);
          window.addEventListener('mouseup', this.onMouseUpWindowScrollbarChange, false);
        }

        onMouseUpWindowScrollbarChange()
        {
          if(this.scrollbarMouseYPos !== null)
          {
            AnimationFrameProcessor.cancel(this.animationFrameIdInteractChange);
            this.animationFrameIdInteractChange = AnimationFrameProcessor.request(this.requestScrollbarInteractOff);
          }

          this.scrollbarMouseYPos = null;

          window.removeEventListener('mousemove', this.onMouseMoveWindowScrollbarChange, false);
          window.removeEventListener('mouseup', this.onMouseUpWindowScrollbarChange, false);
        }

        onMouseMoveWindowScrollbarChange(event)
        {
          AnimationFrameProcessor.cancelStylesGet(this.animationFrameIdStylesGetMouseMoveWindowScrollbarChange);

          this.animationFrameIdStylesGetMouseMoveWindowScrollbarChange = AnimationFrameProcessor.requestStylesGet(() => {
            const scrollElementProps = this.scrollElementProps;
            const scrollElement = this.scrollElement;

            scrollElementProps.scrollHeight = scrollElement.scrollHeight;
            scrollElementProps.clientHeight = scrollElement.clientHeight;
            scrollElementProps.boundingClientRect = scrollElement.getBoundingClientRect();
            scrollElementProps.scrollTop = scrollElement.scrollTop;

            AnimationFrameProcessor.cancel(this.animationFrameIdMouseMoveWindowScrollbarChange);
            this.animationFrameIdMouseMoveWindowScrollbarChange = AnimationFrameProcessor.request(() => {
              this.scrollElement.scrollTo({
                top:
                    (scrollElementProps.scrollHeight - scrollElementProps.clientHeight) *
                    (event.clientY - (scrollElementProps.boundingClientRect.y + (this.bodyMode ? scrollElementProps.scrollTop : 0)) - this.scrollbarMouseYPos) /
                    (scrollElementProps.clientHeight - this.scrollbarHeight),
              });
            });
          });
        }

        onMouseMoveElement(event)
        {
          this.mouseMoveElementOffsetX = event.offsetX;

          AnimationFrameProcessor.cancelStylesGet(this.mouseMoveAnimationFrameId);
          this.mouseMoveAnimationFrameId = AnimationFrameProcessor.requestStylesGet(this.requestMouseMoveElement);
        }

        requestMouseMoveElement()
        {
          const scrollElement = this.scrollElement;

          const eventOffsetX = this.mouseMoveElementOffsetX;
          const boundingClientRectWidth = scrollElement.getBoundingClientRect().width;

          if(eventOffsetX - boundingClientRectWidth < 32 &&
              eventOffsetX - boundingClientRectWidth > -32)
          {
            this.scrollElementProps.scrollHeight = scrollElement.scrollHeight;
            this.scrollElementProps.clientHeight = scrollElement.clientHeight;

            AnimationFrameProcessor.cancel(this.activateScrollbarAnimationFrameId);
            this.activateScrollbarAnimationFrameId = AnimationFrameProcessor.request(this.activateScrollbar);
          }
        }

        onScrollBox()
        {
            if(!this.scrollbarMouseYPos)
            {
                this.requestUpdateScrollbarParams();
            }
        }

        updateScrollBarHeight()
        {
          this.scrollbarBoxStyle.height = this.scrollbarHeight + 'px';
        }

        updateScrollBarTopOffset()
        {
          this.scrollbarBoxStyle.transform = `translateY(${this.scrollbarTopOffset}px)`;
        }

        updateScrollbarParamsStylesGet()
        {
          this.requestUpdateScrollbarParams();

          const scrollElement = this.scrollElement;

          const scrollElementClientHeight = scrollElement.clientHeight;
          const scrollElementScrollHeight = scrollElement.scrollHeight;
          const scrollElementScrollTop = scrollElement.scrollTop;

          if(this.lastClientHeight === scrollElementClientHeight &&
              this.lastScrollHeight === scrollElementScrollHeight &&
              this.lastScrollTop === scrollElementScrollTop)
          {
            return;
          }

          this.lastClientHeight = scrollElementClientHeight;
          this.lastScrollHeight = scrollElementScrollHeight;
          this.lastScrollTop = scrollElementScrollTop;

          if(scrollElementScrollHeight <= scrollElementClientHeight)
          {
            this.scrollbarIsRequired = false;
            return;
          }
          else
          {
            this.scrollbarIsRequired = true;
          }

          let scrollbarHeight = scrollElementClientHeight - (scrollElementScrollHeight - scrollElementClientHeight);
          if(scrollbarHeight < this.scrollbarMinHeight)
          {
            scrollbarHeight = this.scrollbarMinHeight;
          }

          if(scrollbarHeight !== this.scrollbarHeight)
          {
            this.scrollbarHeight = scrollbarHeight;

            AnimationFrameProcessor.cancel(this.animationFrameIdHeightChange);
            this.animationFrameIdHeightChange = AnimationFrameProcessor.request(this.updateScrollBarHeight);
          }

          let scrollHeight = scrollElementScrollHeight;
          let scrollTop = scrollElementScrollTop;

          let clientScrollHeight = scrollElementClientHeight - this.scrollbarHeight;

          let percent = scrollTop / (scrollHeight - scrollElementClientHeight);
          let scrollbarTopOffset = percent * clientScrollHeight;

          if(scrollbarTopOffset !== this.scrollbarTopOffset)
          {
            this.scrollbarTopOffset = scrollbarTopOffset;

            AnimationFrameProcessor.cancel(this.animationFrameIdScrollbarTopOffset);
            this.animationFrameIdScrollbarTopOffset = AnimationFrameProcessor.request(this.updateScrollBarTopOffset);
          }

          if(!this.alwaysDisplay)
          {
            this.scrollElementProps.scrollHeight = scrollElementScrollHeight;
            this.scrollElementProps.clientHeight = scrollElementClientHeight;

            this.activateScrollbar();
          }
        }

        requestUpdateScrollbarParams()
        {
          AnimationFrameProcessor.cancelStylesGet(this.animationFrameStyleGetIdUpdateScrollBarParams);
          this.animationFrameStyleGetIdUpdateScrollBarParams =
              AnimationFrameProcessor.requestStylesGet(this.updateScrollbarParamsStylesGet);
        }

        onMouseEnterBox()
        {
          AnimationFrameProcessor.cancelStylesGet(this.animationFrameIdStylesGetMouseEnter);

          this.animationFrameIdStylesGetMouseEnter = AnimationFrameProcessor.requestStylesGet(() => {
            this.scrollElementProps.scrollHeight = this.scrollElement.scrollHeight;
            this.scrollElementProps.clientHeight = this.scrollElement.clientHeight;

            AnimationFrameProcessor.cancel(this.activateScrollbarAnimationFrameId);

            this.activateScrollbarAnimationFrameId = AnimationFrameProcessor.request(this.activateScrollbar);
          });
        }

        activateScrollbar()
        {
            if(this.scrollElementProps.scrollHeight <= this.scrollElementProps.clientHeight)
            {
                return;
            }

            if(!this.scrollbarDisplay)
            {
              this.setScrollBarDisplay(true);
            }

            this.timeoutResetterActivateScrollbar.run();
        }

        resetScrollbarDisplay()
        {
          this.setScrollBarDisplay(false);
        }

        setScrollBarDisplay(newDisplay)
        {
          if(this.scrollbarDisplay !== newDisplay)
          {
            this.scrollbarDisplay = newDisplay;

            if(newDisplay)
            {
              this.scrollbarBoxClassList.add(this.$style["scrollbar-display"]);
            }
            else
            {
              this.scrollbarBoxClassList.remove(this.$style["scrollbar-display"]);
            }
          }
        }

      updateHidingScrollbar()
      {
        if(!this.display || !this.scrollbarIsRequired)
        {
          this.scrollbarBoxClassList.remove(this.$style.required);
        }
        else
        {
          this.scrollbarBoxClassList.add(this.$style.required);
        }
      }

      requestUpdateHidingScrollbar()
      {
        AnimationFrameProcessor.cancel(this.animationFrameIdUpdateHidingScrollbar);
        this.animationFrameIdUpdateHidingScrollbar = AnimationFrameProcessor.request(this.updateHidingScrollbar);
      }
    }
</script>