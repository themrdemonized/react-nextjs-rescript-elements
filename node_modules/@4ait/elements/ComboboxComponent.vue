<style module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

  .root
  {
      width: 264px;
      min-height: 52px;
  }

  .input-box
  {
    position: relative;

    width: 100%;
    height: 100%;

    background-color: var(--4ait-elements--combobox--empty-default-background-color);
    border: 1px solid var(--4ait-elements--combobox--empty-default-border-color);

    transition: all ease .2s;

    box-sizing: border-box;
    border-radius: 8px;

    overflow: hidden;

    cursor: pointer;
  }

  .content
  {
    position: relative;

    display: flex;
    flex-direction: row;
  }

  .caption
  {
    position: absolute;

    pointer-events: none;
    user-select: none;

    color: var(--4ait-elements--combobox--empty-default-caption-color);

    @include setFont(font-4ait-elements, caption-default);

    transition: all ease 0.2s;

    left: 16px;

    top: 14px;
    transform: none;
  }

  .items-divider
  {
    position: absolute;

    width: 100%;
    height: 1px;

    bottom: 0;
    left: 0;

    background-color: var(--4ait-elements--combobox--items-divider-color);

    display: none;
  }

  .list-button
  {
    position: relative;

    min-height: 40px;

    background-color: var(--4ait-elements--combobox--list-button-default-background-color);
    color: var(--4ait-elements--combobox--list-button-default-text-color);

    cursor: pointer;

    display: none;

    &:hover
    {
      background-color: var(--4ait-elements--combobox--list-button-hover-background-color);
      color: var(--4ait-elements--combobox--list-button-hover-text-color);
    }

    &:active
    {
      background-color: var(--4ait-elements--combobox--list-button-active-background-color);
      color: var(--4ait-elements--combobox--list-button-active-text-color);
    }
  }

  .list-button-box
  {
    display: flex;

    padding: 10px 16px;

    text-align: left;

    user-select: none;

    @include setFont(font-4ait-elements, list-button-text);
  }

  .list-button-text, .list-button-plus-icon
  {
    display: inline-block;
    vertical-align: middle;
  }
  .list-button-text
  {
    flex: 1;

    word-break: break-word;
  }

  .list-button-plus-icon
  {
    align-self: center;
    margin-right: 2px;
  }

  .list-button-divider
  {
    position: absolute;

    width: 100%;
    height: 1px;

    top: 0;
    left: 0;

    background-color: var(--4ait-elements--combobox--items-divider-color);
  }

  .input-area
  {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 4px;

    padding-left: 16px;
    padding-top: 22px;
    padding-bottom: 6px;

    flex: 1;

    @include setFont(font-4ait-elements, text);
  }

  .icons-area
  {
    margin-top: 18px;
    margin-left: 4px;
    margin-right: 12px;
  }

  .icon-triangle
  {
    color: var(--4ait-elements--combobox--empty-default-triangle-color)
  }

  .input
  {
    white-space: nowrap;
    overflow-x: auto;
    max-width: 200px;
    min-width: 10px;
    width: fit-content;
    min-height: 24px;

    outline: 0 solid transparent;
    border: 0 solid transparent;

    &::-webkit-scrollbar {
      display: none;
    }

    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */
  }

  .input-item
  {
    display: inline-block;
    vertical-align: middle;
  }


  // Hide input with opacity and position absolute for
  // keep availability element methods from script
  .input-hide
  {
    position: absolute;
    opacity: 0;
    pointer-events: none;
  }

  .with-data
  {
    .caption
    {
      top: 6px;
      transform: none;

      @include setFont(font-4ait-elements, caption-top);
    }
  }

  .input-box:hover
  {
    background-color: var(--4ait-elements--combobox--empty-hover-background-color);
    border: 1px solid var(--4ait-elements--combobox--empty-hover-border-color);

    .icon-triangle
    {
      color: var(--4ait-elements--combobox--empty-hover-triangle-color)
    }
  }

  .items-scrollbar
  {
    position: absolute;
    right: 0;
    height: 100%;
  }

  .items
  {
    position: relative;
    display: none;

    max-height: 208px;

    overflow-y: auto;

    -ms-overflow-style: none; /* Internet Explorer 10+ */
    scrollbar-width: none; /* Firefox */

    &::-webkit-scrollbar {
      display: none; /* Safari and Chrome */
    }
  }

  .item
  {
    display: flex;
    min-height: 36px;

    cursor: pointer;

    &:hover
    {
      background-color: var(--4ait-elements--combobox--item-hover-background-color);
    }

    &:first-child
    {
      margin-top: 4px;
    }

    &:last-child
    {
      margin-bottom: 4px;
    }
  }

  .item-text
  {
    user-select: none;

    word-break: break-word;
    align-self: center;

    padding: 6px 12px 6px 15px;

    @include setFont(font-4ait-elements, item-text);
  }

  .item-text-filtered
  {
    color: var(--4ait-elements--combobox--item-text-with-filter-normal-color);
  }

  .filtered-text
  {
    color: var(--4ait-elements--combobox--item-text-with-filter-filtered-color);
  }

  .not-found-message-item
  {
    display: flex;
    min-height: 72px;

    align-items: center;
    justify-content: center;

    padding-left: 15px;
    padding-right: 12px;

    user-select: none;

    @include setFont(font-4ait-elements, not-found-message);

    color: var(--4ait-elements--combobox--not-found-message-color);
  }

  .not-found-message-item-wrapper
  {
    text-align: center;
  }

  .input-box.focused
  {
    background-color: var(--4ait-elements--combobox--empty-focus-background-color);
    border: 1px solid var(--4ait-elements--combobox--empty-focus-border-color);

    box-shadow: var(--4ait-elements--combobox--empty-focus-box-shadow);

    height: fit-content;

    cursor: auto;

    .caption
    {
      color: var(--4ait-elements--combobox--empty-focus-caption-color);
    }

    .icon-triangle
    {
      color: var(--4ait-elements--combobox--empty-focus-triangle-color);
      transform: rotate(180deg);
    }

    .items
    {
      display: block;
    }

    .items-divider
    {
      display: block;
    }

    .list-button
    {
      display: block;
    }
  }

  .input-box.disabled
  {
    background-color: var(--4ait-elements--combobox--empty-inactive-background-color);
    border: 1px solid var(--4ait-elements--combobox--empty-inactive-border-color);

    pointer-events: none;
    user-select: none;

    .input
    {
      color: var(--4ait-elements--combobox--filled-inactive-text-color);
    }
  }
</style>

<template>
    <div ref="root" :class="$style.root">
      <div ref="filler"></div>
      <overlay :enabled="teleported" :display-as-block="true">
        <div ref="teleportWrapper">
          <div
              :class="{
                [$style['input-box']]: true,
                [$style['with-data']]: hasData || focused,
                [$style['focused']]: focused,
                [$style['disabled']]: disabled
              }"
              @mousedown="onMouseDownInputBox"
              @mouseenter="mouseEnteredInputBox = true"
              @mouseleave="mouseEnteredInputBox = false"
              ref="inputBox"
          >
            <div :class="$style['caption']">
              <slot name="caption">Заголовок</slot>
            </div>
            <!-- Prevent selection if combobox is not focused -->
            <div
                :class="$style['content']"
                :style="{
                  'pointer-events': focused ? '' : 'none'
                }"
                ref="content"
            >
              <div :class="$style['input-area']" ref="inputArea">
                <template v-if="multiselect && localSelectedInputItems">
                  <tag-component
                      v-for="selectedItem in localSelectedInputItems"
                      :key="getIdItem(selectedItem)"
                      :class="$style['input-item']"
                      :model-value="displayTextFunc(selectedItem)"
                      :with-xmark="true"
                      :is-text-selectable="false"
                      :style="{
                          'max-width': maxWidthInputDiv + 'px'
                      }"
                      :model-is-activable="false"
                      :is-text-overflow-ellipsis="true"
                      @update:modelOnClickXmark="removeSelectedItem(selectedItem)"
                      @mousedown.prevent
                  >
                  </tag-component>
                </template>
                <div :class="{
                        [$style['input-item']]: true,
                        [$style['input-hide']]: !focused && multiselect && localSelectedInputItems && localSelectedInputItems.length > 0
                     }"
                >
                  <div
                      :contenteditable="!disabled"

                      :class="$style['input']"

                      @input="onInputDiv"
                      @change="onChangeDiv"
                      @focus="onFocusInput"
                      @blur="onBlurInputBox"

                      :style="{
                        'white-space': focused ? '' : 'normal',
                        'max-width': maxWidthInputDiv + 'px',
                        'user-select': focused ? '' : 'none'
                     }"

                      ref="inputDiv"

                      @mouseenter="mouseEnteredInput = true"
                      @mouseleave="mouseEnteredInput = false"
                  />
                </div>
              </div>
              <div :class="$style['icons-area']">
                <template v-if="$slots['main-icon'] && useMainIconSlot">
                  <slot name="main-icon"></slot>
                </template>
                <template v-else>
                  <icon-arrowtriangle-down-fill :class="$style['icon-triangle']" />
                </template>
              </div>
              <div :class="$style['items-divider']" v-if="items.length > 0 || true"></div>
            </div>
            <div style="position:relative;">
              <div :class="$style['items']" ref="itemsElement" :style="{ 'max-height': displayListButton ? '168px' : '' }">

                <!-- Item -->
                <template v-if="textFilter">

                  <!--
                    Items Info

                    [
                      {
                        item: ...,
                        type: normal-text | bold-text,
                        data: ...
                      },
                      {
                        item: ...,
                        type: normal-text | bold-text,
                        data: ...
                      },
                      ...
                    ]

                  -->
                  <template v-for="itemInfo in filteredItemsInfo" :key="getIdItem(itemInfo.item)" >
                    <div
                        v-if="isDisplayItem(itemInfo.item)"
                        :class="$style['item']"
                        @click="onClickItem($event, itemInfo.item)"
                    >

                      <slot name="additional-display-item-left"></slot>

                      <div :class="{ [$style['item-text']]: true, [$style['item-text-filtered']]: filterApplied }">
                        <template v-for="block in itemInfo.blocks">
                          <template v-if="block.type === 'normal-text'">{{block.data}}</template>
                          <template v-else-if="block.type === 'bold-text'"><span :class="$style['filtered-text']">{{block.data}}</span></template>
                        </template>
                      </div>

                      <slot name="additional-display-item-right"></slot>

                      <!--TODO Implement additional data in cell <slot name="item-ext-display" :item="item"></slot>-->
                    </div>
                  </template>

                </template>
                <template v-else>

                  <template v-for="item in items" :key="getIdItem(item)" >
                    <div
                        v-if="isDisplayItem(item)"
                        :class="$style['item']"
                        @click="onClickItem($event, item)"
                    >
                      <div :class="$style['item-text']">
                        {{displayTextFunc(item)}}
                      </div>

                      <!--TODO Implement additional data in cell <slot name="item-ext-display" :item="item"></slot>-->
                    </div>
                  </template>

                </template>

                <div :class="$style['not-found-message-item']"
                     v-if="($slots['not-found-message'] && useNotFoundMessageSlot) ||
                           (filterApplied && filteredItemsInfo.length === 0) ||
                           (!items || items.length === 0)"
                >
                  <div :class="$style['not-found-message-item-wrapper']">
                    <template v-if="$slots['not-found-message'] && useNotFoundMessageSlot">
                      <slot name="not-found-message"></slot>
                    </template>
                    <template v-else-if="filterApplied && filteredItemsInfo.length === 0">Не найдено</template>
                    <template v-else>Список пуст</template>
                  </div>
                </div>

              </div>
              <scrollbar-component :class="$style['items-scrollbar']"  :scroll-element="itemsElement" :always-display="true" />
            </div>
            <div v-if="displayListButton"
                 :class="$style['list-button']"
                 @mousedown.prevent
                 @click="onClickAddButton"
            >
              <div :class="$style['list-button-divider']" v-if="items.length > 0"></div>
              <div :class="$style['list-button-box']">
                <div :class="$style['list-button-plus-icon']"><icon-plus-small/></div>
                <div :class="$style['list-button-text']">Добавить «{{inputText.trim()}}»</div>
              </div>
            </div>
          </div>
        </div>
      </overlay>
    </div>
</template>

<script setup>
import ScrollbarComponent from "@4ait/scrollbar";
import TagComponent from "./TagComponent"
import IconArrowtriangleDownFill from "@4ait/icons_system/icons/IconArrowtriangleDownFill"
import IconPlusSmall from "@4ait/icons_system/icons/IconPlusSmall"
import {
  computed,
  nextTick,
  onMounted,
  onUnmounted,
  reactive,
  ref,
  toRefs,
  useCssModule,
  watch,
  watchEffect
} from "vue";
import Overlay from "@4ait/overlay/Overlay";
import "@4ait/focus_prevent_scroll_polyfill";

const props = defineProps({
  items: {
    type: Array,
    default: []
  },
  textFilter: {
    type: Boolean,
    default: false
  },
  selectedItems: {
    type: Array
  },
  modelValue: {
    type: Object
  },
  multiselect: {
    type: Boolean,
    default: false
  },
  disabled: {
    type: Boolean,
    default: false
  },
  displayTextFunc: {
    type: Function,
    default: (item) => { return item.text }
  },
  getIdItemFunc: {
    type: Function,
    default: null
  },
  enabledAddButton: {
    type: Boolean,
    default: false
  },
  useMainIconSlot: {
    type: Boolean,
    default: true
  },
  useNotFoundMessageSlot: {
    type: Boolean,
    default: true
  },
  nullable: {
    type: Boolean,
    default: true
  }
});

const emit = defineEmits([
  'add-item',
  'select-item',
  'remove-item',
  'input-text',
  'focus',
  'blur',
  'filtered-items',
  'update:modelValue'
]);

const propsRefs = toRefs(props);

const focused = ref(false);
const teleported = ref(false);

const inputText = ref('');

const inputArea = ref(null);
const inputDiv = ref(null);
const teleportWrapper = ref(null);
const filler = ref(null);
const itemsElement = ref(null);
const content = ref(null);
const inputBox = ref(null);

const root = ref(null);

const maxWidthInputDiv = ref(10);

const mouseEnteredInputBox = ref(false);
const mouseEnteredInput = ref(false);

const startEdit = ref(false);

const localSelectedInputItems = reactive({value: []});

let resizeObserverInputArea;

let positionUpdateIntervalId = undefined;
let positionUpdateAnimationFrameId = undefined;

let focusInProgress = false;

const style = useCssModule();

const hasData = computed(() => {
  return localSelectedInputItems.value !== null && localSelectedInputItems.value.length > 0;
});

const displayListButton = computed(() => {
  return inputText.value && inputText.value !== '' && props.enabledAddButton &&
      !(localSelectedInputItems.value !== null && localSelectedInputItems.value.length > 0 && props.displayTextFunc(localSelectedInputItems.value[0]) === inputText.value);
});

const filterApplied = computed(() => {
  // Do not filter on start edit and empty input text
  return props.textFilter && inputText.value !== '' && !startEdit.value
});

if(props.selectedItems !== undefined && props.selectedItems !== null)
{
  localSelectedInputItems.value = props.selectedItems;
}
else if(props.modelValue !== undefined && props.modelValue !== null)
{
  localSelectedInputItems.value = [props.modelValue];
}
else
{
  localSelectedInputItems.value = [];
}

const filteredItemsInfo = computed(() => {
  const retItemsInfo = [];
  const filteredItems = []

  if(!filterApplied.value)
  {
    for(const item of props.items)
    {
      retItemsInfo.push({
        item: item,
        blocks: [
          {
            data: props.displayTextFunc(item),
            type: 'normal-text'
          }
        ]
      });

      filteredItems.push(item);
    }
  }
  else
  {
    for(const item of props.items)
    {
      const text = props.displayTextFunc(item);

      const textIndexes = getIndicesOf(inputText.value, text, false);

      if(textIndexes.length === 0)
      {
        continue;
      }

      const blocks = [];

      let curIndex = 0;
      for(const indexOf of textIndexes)
      {
        if(curIndex < indexOf)
        {
          blocks.push({
            data: text.substring(curIndex, indexOf),
            type: 'normal-text'
          });
        }

        curIndex = indexOf + inputText.value.length;

        blocks.push({
          data: text.substring(indexOf, curIndex),
          type: 'bold-text'
        });
      }

      if(curIndex < text.length)
      {
        blocks.push({
          data: text.substring(curIndex),
          type: 'normal-text'
        });
      }

      retItemsInfo.push({
        item: item,
        blocks: blocks
      });

      filteredItems.push(item);
    }
  }

  emit('filtered-items', filteredItems);

  return retItemsInfo;
});

function getIndicesOf(searchStr, str, caseSensitive) {
  const searchStrLen = searchStr.length;
  if (searchStrLen === 0) {
    return [];
  }
  let startIndex = 0, index, indices = [];
  if (!caseSensitive) {
    str = str.toLowerCase();
    searchStr = searchStr.toLowerCase();
  }
  while ((index = str.indexOf(searchStr, startIndex)) > -1) {
    indices.push(index);
    startIndex = index + searchStrLen;
  }
  return indices;
}

/* Use this method for setup text inside inputDiv.innerText directly */
function updateTextInInputDev(text)
{
  inputDiv.value.innerText = text;
  inputText.value = text;
}

function updateInputDevFromSelectedItems()
{
  if(props.multiselect)
  {
    // TODO
  }
  else
  {
    if(localSelectedInputItems.value && localSelectedInputItems.value.length > 0)
    {
      updateTextInInputDev(props.displayTextFunc(localSelectedInputItems.value[0]));
    }
    else
    {
      updateTextInInputDev('');
    }
  }
}

let observeElement;

const resizeObserverInputAreaEntries = ref(null);

onMounted(() =>
{
  resizeObserverInputArea = new ResizeObserver(entries => {
    resizeObserverInputAreaEntries.value = entries;
  });

  observeElement = inputArea.value;

  resizeObserverInputArea.observe(observeElement);

  updateInputDevFromSelectedItems();
});

watchEffect(() => {
  if(resizeObserverInputAreaEntries.value)
  {
    const entries = resizeObserverInputAreaEntries.value;
    resizeObserverInputAreaEntries.value = null;

    for (let entry of entries)
    {
      if(entry.contentBoxSize)
      {
        // Firefox implements `contentBoxSize` as a single content rect, rather than an array
        const contentBoxSize = Array.isArray(entry.contentBoxSize) ?
            entry.contentBoxSize[0] :
            entry.contentBoxSize;

        maxWidthInputDiv.value = contentBoxSize.inlineSize;
      }
      else
      {
        maxWidthInputDiv.value = entry.contentRect.width;
      }
    }
  }
});

onUnmounted(() =>
{
  resizeObserverInputArea.unobserve(observeElement);
  resizeObserverInputArea = null;

  if(positionUpdateIntervalId)
  {
    clearInterval(positionUpdateIntervalId);
    positionUpdateIntervalId = undefined;
  }

  if(positionUpdateAnimationFrameId)
  {
    cancelAnimationFrame(positionUpdateAnimationFrameId);
    positionUpdateAnimationFrameId = undefined;
  }
});

function selectInputDevText()
{
  if(!inputDiv.value)
  {
    // element has been unmounted
    return;
  }

  if(!inputDiv.value.isConnected)
  {
    // element is not exists on DOM
    // prevent chrome warning: addRange(): The given range isn't in document
    return;
  }

  let range = document.createRange();
  range.selectNodeContents(inputDiv.value);
  let sel = window.getSelection();
  sel.removeAllRanges();
  sel.addRange(range);
}

function onFocusInput()
{
  if(focused.value)
  {
    emit('focus');
  }

  if(focused.value || focusInProgress)
  {
    return;
  }

  focusInProgress = true;

  root.value.classList.forEach(className => {
    if(className === style['root'])
    {
      return;
    }

    teleportWrapper.value.classList.add(className);
  });

  teleportWrapper.value.style = root.value.style;

  let bodyRect = document.body.getBoundingClientRect(),
      elemRect = root.value.getBoundingClientRect(),
      offsetTop = (elemRect.top - bodyRect.top) - window.scrollY,
      offsetLeft = elemRect.left - bodyRect.left;

  teleportWrapper.value.style.top = "0px";
  // Use transform for top for performance reason
  teleportWrapper.value.style.transform = "translateY(" + offsetTop+ "px)";
  teleportWrapper.value.style.left = offsetLeft + "px";
  teleportWrapper.value.style.width = elemRect.width + "px";
  teleportWrapper.value.style.position = "absolute";
  teleportWrapper.value.style.margin = '0';

  const pureWidth = elemRect.width;
  const pureHeight = elemRect.height;

  filler.value.style.width = pureWidth + "px";
  filler.value.style.height = pureHeight + "px";

  if(positionUpdateIntervalId)
  {
    clearInterval(positionUpdateIntervalId);
  }

  positionUpdateIntervalId = setInterval(() => {
    if(!inputBox.value)
    {
      // element has been unmounted
      return;
    }

    if(positionUpdateAnimationFrameId)
    {
      cancelAnimationFrame(positionUpdateAnimationFrameId);
    }

    positionUpdateAnimationFrameId = requestAnimationFrame(() => {
      const bodyRect = document.body.getBoundingClientRect(),
          rootElemRect = root.value.getBoundingClientRect();

      let targetOffsetTop = (rootElemRect.top - bodyRect.top) - window.scrollY,
          targetOffsetLeft = rootElemRect.left - bodyRect.left;

      const contentRect = content.value.getBoundingClientRect();

      const elementTop = contentRect.top - bodyRect.top,
          elementLeft = contentRect.left - bodyRect.left;

      const inputBoxRect = inputBox.value.getBoundingClientRect();

      const minTransitionSpeedPixelsPerSec = 175;
      const maxTransitionSpeedPixelsPerSec = 800;
      const maxDiffWithMaxSpeed = 150;
      const padding = 8;

      const clientHeight = document.documentElement.clientHeight;
      const bottomPosStaticElement = rootElemRect.top + inputBoxRect.height + padding;

      const style = teleportWrapper.value.style;

      if(rootElemRect.top < clientHeight && clientHeight <= bottomPosStaticElement)
      {
        targetOffsetTop -= bottomPosStaticElement - clientHeight;

        if(clientHeight === contentRect.top + inputBoxRect.height + padding - 1)
        {
          if(style.position !== "fixed")
          {
            style.position = "fixed";
          }

          if(style.transform !== "translateY(" + (clientHeight - (inputBoxRect.height + padding)) + "px)")
          {
            style.transform = "translateY(" + (clientHeight - (inputBoxRect.height + padding)) + "px)"
          }

          style.transition = ""

          return;
        }
      }

      if(style.position === "fixed")
      {
        style.transform = "translateY(" + elementTop + "px)"
        style.position = "absolute";
        return; // Maybe we need force update on next tick?
      }

      const transitions = [];

      if(style.top !== targetOffsetTop + "px")
      {
        const diffOffset = Math.abs(targetOffsetTop - elementTop);

        if(diffOffset >= maxDiffWithMaxSpeed)
        {
          transitions.push("transform " + (diffOffset / maxTransitionSpeedPixelsPerSec) + "s linear 0s");
        }
        else if(diffOffset >= maxDiffWithMaxSpeed / 2)
        {
          transitions.push("transform " + (diffOffset / ((maxTransitionSpeedPixelsPerSec - minTransitionSpeedPixelsPerSec) / 2)) + "s linear 0s");
        }
        else
        {
          transitions.push("transform " + (diffOffset / minTransitionSpeedPixelsPerSec) + "s linear 0s");
        }

        style.transform = "translateY(" + targetOffsetTop+ "px)";
      }

      if(style.left !== targetOffsetLeft + "px")
      {
        const diffOffset = Math.abs(targetOffsetLeft - elementLeft);

        if(diffOffset >= maxDiffWithMaxSpeed)
        {
          transitions.push("left " + (diffOffset / maxTransitionSpeedPixelsPerSec) + "s linear 0s");
        }
        else if(diffOffset >= maxDiffWithMaxSpeed / 2)
        {
          transitions.push("left " + (diffOffset / ((maxTransitionSpeedPixelsPerSec - minTransitionSpeedPixelsPerSec) / 2)) + "s linear 0s");
        }
        else
        {
          transitions.push("left " + (diffOffset / minTransitionSpeedPixelsPerSec) + "s linear 0s");
        }

        style.left = targetOffsetLeft + "px";
      }

      if(transitions.length > 0)
      {
        let transitionString = null;

        for(const transition of transitions)
        {
          if(!transitionString)
          {
            transitionString = transition;
            continue;
          }

          transitionString += "," + transition
        }

        style.transition = transitionString;
      }

      positionUpdateAnimationFrameId = undefined;
    });
  }, 100);

  // Firstly teleport component for smooth animation
  teleported.value = true;

  // Fixed focus on iOS
  inputDiv.value.focus({
    preventScroll: true
  });

  nextTick(() => {
    nextTick(() => {
      if(!inputDiv.value)
      {
        // element has been unmounted
        return;
      }

      inputDiv.value.focus({
        preventScroll: true
      });
      selectInputDevText();

      // Timeout fix focus on macOS Safari
      setTimeout(() => {
        if(!inputDiv.value)
        {
          // element has been unmounted
          return;
        }

        inputDiv.value.focus({
          preventScroll: true
        });
        selectInputDevText();
      }, 0);
    });
    focused.value = true;
    focusInProgress = false;
    startEdit.value = true;
  });
}

function onMouseDownInputBox($event)
{
  if(focused.value || focusInProgress)
  {
    if(mouseEnteredInputBox.value && !mouseEnteredInput.value)
    {
      $event.preventDefault();
    }
    return;
  }

  $event.preventDefault();

  onFocusInput();
}

function onBlurInputBox()
{
  if(!focused.value || focusInProgress)
  {
    return;
  }

  if(!teleportWrapper.value)
  {
    // element has been unmounted
    return;
  }

  teleported.value = false;
  focused.value = false;

  teleportWrapper.value.setAttribute("style", "");
  filler.value.setAttribute("style", "");

  const classesToRemove = [];
  teleportWrapper.value.classList.forEach(className => {
    if(className === style['root'])
    {
      return;
    }

    classesToRemove.push(className);
  });

  teleportWrapper.value.classList.remove(...classesToRemove);

  if(positionUpdateIntervalId)
  {
    clearInterval(positionUpdateIntervalId);
    positionUpdateIntervalId = undefined;
  }

  if(positionUpdateAnimationFrameId)
  {
    cancelAnimationFrame(positionUpdateAnimationFrameId);
    positionUpdateAnimationFrameId = undefined;
  }

  if(props.multiselect)
  {
    // TODO Implement multiselect clear

    updateTextInInputDev('');
  }
  else
  {
    if(localSelectedInputItems.value !== null && localSelectedInputItems.value.length > 0)
    {
      if(inputDiv.value.textContent || !props.nullable)
      {
        updateTextInInputDev(props.displayTextFunc(localSelectedInputItems.value[0]));
      }
      else
      {
        // Clear data
        const items = localSelectedInputItems.value.splice(0, localSelectedInputItems.value.length);
        updateTextInInputDev('');

        emit('remove-item', items[0]);
        emit('update:modelValue', null);
      }
    }
    else
    {
      updateTextInInputDev('');
    }
  }

  emit('blur');
}

function onClickItem(event, item)
{
  if(!localSelectedInputItems.value)
  {
    return;
  }

  if(props.multiselect)
  {
    localSelectedInputItems.value.push(item);
  }
  else
  {

    if(localSelectedInputItems.value.length === 0)
    {
      localSelectedInputItems.value.push(item);
    }
    else
    {
      localSelectedInputItems.value[0] = item;
    }

    // update text in input dev manual
    // prevent auto clear if input inner text is empty
    updateTextInInputDev(props.displayTextFunc(localSelectedInputItems.value[0]));

    inputDiv.value.blur();

    emit('update:modelValue', item);
  }

  emit('select-item', item);
}

// Do not call this method directly
// It used only in events onInputDiv() and onChangeDiv()
function rawUpdateInputTextFromInoutDiv()
{
  if(inputDiv.value.innerText)
  {
    // Safari innerText equal ' ' on empty div
    inputText.value = inputDiv.value.innerText.trim();
  }
  else
  {
    inputText.value = '';
  }
}

function resetScroll()
{
  if(itemsElement.value)
  {
    itemsElement.value.scrollTo(0,0);
  }
}

function onInputDiv()
{
  rawUpdateInputTextFromInoutDiv();

  emit('input-text', inputText.value);

  startEdit.value = false;

  if(props.textFilter)
  {
    resetScroll();
  }
}

function onChangeDiv()
{
  rawUpdateInputTextFromInoutDiv();

  startEdit.value = false;

  if(props.textFilter)
  {
    resetScroll();
  }
}

/* Do not use props.getIdItemFunc directly */
function getIdItem(item)
{
  if(props.getIdItemFunc)
  {
    return props.getIdItemFunc(item)
  }

  return item;
}

function isEqualItems(firstItem, secondItem)
{
  return getIdItem(firstItem) === getIdItem(secondItem)
}

function isDisplayItem(item)
{
  if(!props.multiselect)
  {
    return true;
  }

  let indexItem = localSelectedInputItems.value.findIndex((element, index, array) => {
    return isEqualItems(item, element);
  });

  return indexItem === -1;
}

function removeSelectedItem(item)
{
  if(!localSelectedInputItems.value)
  {
    return;
  }

  let indexItem = localSelectedInputItems.value.findIndex((element, index, array) => {
    return isEqualItems(item, element);
  });

  if(indexItem !== -1)
  {
    const removedItems = localSelectedInputItems.value.splice(indexItem, 1);

    emit('remove-item', removedItems[0]);
    emit('update:modelValue', null);
  }
}

function onClickAddButton()
{
  emit('add-item', inputText.value);
  inputDiv.value.blur();
}


watch(propsRefs.selectedItems, () => {
  if(props.selectedItems !== null && props.selectedItems !== undefined)
  {
    localSelectedInputItems.value = props.selectedItems;
  }
  else
  {
    localSelectedInputItems.value = [];
  }
});

watch(propsRefs.modelValue, () =>
{
  if(props.modelValue)
  {
    localSelectedInputItems.value = [props.modelValue];
  }
  else
  {
    localSelectedInputItems.value = [];
  }
});

watch(() => {
  let arr = [];
  for(let item of localSelectedInputItems.value)
  {
    let newItem = {};
    for(let field in item)
    {
      newItem[field] = item[field];
    }
    arr.push(newItem);
  }
  return arr;
},
    () => {
      updateInputDevFromSelectedItems();
    }
);
</script>
