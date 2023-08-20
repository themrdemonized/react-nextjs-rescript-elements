<style module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

  .wrapper
  {
    width: 100%;
    height: 100%;
    position: relative;

    border: 1px solid var(--4ait-elements--text-filter--wrapper-border);
    box-shadow: var(--4ait-elements--text-filter--wrapper-shadow);

    border-radius: 20px;

    overflow: hidden;
    background-color: var(--4ait-elements--text-filter--background-color);
  }

  .inputfield
  {
    width: calc(100% - 24px);
    margin: 12px 12px 8px 12px;
  }

  .active-options-wrapper
  {
    position: relative;
  }

  .active-options
  {
    max-height: 148px;
    box-sizing: border-box;
    border-bottom: 1px solid var(--4ait-elements--text-filter--active-options-divider);

    overflow: scroll;

    &::-webkit-scrollbar{ /* Hide scrollbar for Chrome, Safari and Opera */
      display: none;
    }

    -ms-overflow-style: none;  /* Hide scrollbar for IE and Edge */
    scrollbar-width: none;  /* Hide scrollbar for Firefox */
  }

  .active-options_hider
  {
    position: absolute;
    bottom: 0;
    width: 100%;

    pointer-events: none;

    height: 32px;
    background: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.8) 100%);
  }

  .body
  {
    height: 100%;
    width: 100%;
    max-height: 236px;

    overflow: scroll;

    &::-webkit-scrollbar{ /* Hide scrollbar for Chrome, Safari and Opera */
      display: none;
    }

    -ms-overflow-style: none;  /* Hide scrollbar for IE and Edge */
    scrollbar-width: none;  /* Hide scrollbar for Firefox */
  }

  .active-options-overflowed
  {
    max-height: 192px;
  }

  .list-item
  {
    width: 100%;
    box-sizing: border-box;
    position: relative;
    padding: 8px 111px 8px 36px;

    &.list-item_padding--subtext{
      padding: 4px 111px 4px 36px;
    }

    &:hover {
      background: var(--4ait-elements--text-filter--list-item--hover);
    }
  }

  .list-item_checkbox
  {
    position: absolute;

    left: 12px;

    &.list-item_checkbox--with-subtext
    {
      top: 3px; //use this value (instead 6px from figma) cause inner padding is 3px (summary 6px)
    }
  }

  .list-item_text
  {
    height: 20px;

    overflow: hidden;
    text-overflow: ellipsis;

    @include setFont(font-4ait-elements, list-item-text);


    .normal
    {
      color: var(--4ait-elements--text-filter--list-item--text-normal);
    }

    .mono
    {
      color: var(--4ait-elements--text-filter--list-item--text-mono);
    }

    .selected
    {
      color: var(--4ait-elements--text-filter--list-item--text-selected);
    }
  }

  .list-item_text-padding
  {
    padding: 4px 0;
  }

  .list-item_subtext
  {
    height: 16px;
    width: 233px;

    overflow: hidden;
    text-overflow: ellipsis;

    @include setFont(font-4ait-elements, list-item-subtext);

    .normal
    {
      color: var(--4ait-elements--text-filter--list-item--subtext-normal);
    }

    .selected
    {
      color: var(--4ait-elements--text-filter--list-item--subtext-selected);
    }
  }

  .list-item_additional
  {
    height: 16px;
    max-width: 91px;

    position: absolute;
    top: 0;
    bottom: 0;
    margin-top: auto;
    margin-bottom: auto;

    right: 12px;

    overflow: hidden;
    text-overflow: ellipsis;

    @include setFont(font-4ait-elements, list-item-additioanal);

    .normal
    {
      color: var(--4ait-elements--text-filter--list-item--subtext-normal);
    }

    .selected
    {
      color: var(--4ait-elements--text-filter--list-item--subtext-selected);
    }
  }

  .footer
  {
    box-sizing: border-box;
    border-top: 1px solid var(--4ait-elements--text-filter--active-options-divider);
    width: 100%;
  }

  .sort-panel
  {
    box-sizing: border-box;
    height: 48px;
    padding: 8px 12px;
  }

  .reset-btn_wrapper
  {
    display: flex;

    color: var(--4ait-elements-text-filter--btn-reset--color-default);
    box-sizing: border-box;
    height: 40px;
    padding: 10px 0 10px 102.5px;

    user-select: none;
    cursor: pointer;

    &:hover
    {
      color: var(--4ait-elements-text-filter--btn-reset--color-hover);
      background: var(--4ait-elements-text-filter--btn-reset--background-hover);
    }
  }

  .reset-btn_label
  {
    height: 20px;
    padding-left: 8px;

    @include setFont(font-4ait-elements, reset-btn-label);
  }
</style>

<template>
  <div>
    <div :class="{
                 [$style.wrapper]: true
                 }">
        <text-field-component
            :class="{
                 [$style.inputfield]: true
                 }"
            v-model:value="inputValue"
            @input="onInputValue($event)"
        >
          <slot></slot>
        </text-field-component>
        <div :class="{
                     [$style['active-options-wrapper']]: true
                     }">
          <div :class="{
                       [$style['active-options']]: true
                       }"
               :ref="'activeOptions'"
               @scroll="recalculateActiveOptionsHiderVisiblity"
          >
            <div v-for="(item, index) in items" :key="item.id">
              <div :class="{
                     [$style['list-item']]: true,
                     [$style['list-item_padding']]: chosenItems[item.id], //enable padding if current list-item is checked
                     [$style['list-item_padding--subtext']]: item.subtext
                  }"
                  v-if="!!chosenItems[item.id]">
                <div :class="{
                       [$style['list-item_checkbox']]: true,
                       [$style['list-item_checkbox--with-subtext']]: item.subtext
                    }">
                  <checkbox-component
                      type="S"
                      v-model="chosenItems[item.id]"
                  ></checkbox-component>
                </div>
                <div :class="{
                       [$style['list-item_text']]: true
                    }">
                  <span
                      v-for="chunk in item.text" :key="item.id"
                      :class="{
                                [$style[chunk.type]]: true,
                                [$style.mono]: item.text.length === 1
                              }"
                  >
                    {{chunk.value}}
                  </span>
                </div>
                <div :class="{
                       [$style['list-item_subtext']]: true
                    }"
                     v-if="item.subtext"
                >
                  <span
                      v-for="chunk in item.subtext" :key="item.id"
                      :class="{
                                [$style[chunk.type]]: true
                              }"
                  >
                    {{chunk.value}}
                  </span>
                </div>
                <div :class="{
                       [$style['list-item_additional']]: true
                    }">
                  <span
                      v-for="chunk in item.additional" :key="item.id"
                      :class="{
                                [$style[chunk.type]]: true
                              }"
                  >
                    {{chunk.value}}
                  </span>
                </div>
              </div>
            </div>
          </div>
          <div :class="{
                     [$style['active-options_hider']]: true
                  }"
                v-if="isActiveOptionsOverflowed && isActiveOptionsHiderVisible"

          >
          </div>
        </div>
        <div :class="{
                   [$style.body]: true,
                   [$style['active-options-overflowed']]: isActiveOptionsOverflowed
                   }"
        >
          <div
               v-for="(item, index) in items" :key="item.id"
          >
            <div :class="{
                     [$style['list-item']]: true,
                     [$style['list-item_padding--subtext']]: item.subtext
                  }"
                  v-if="!chosenItems[item.id]">
              <div :class="{
                     [$style['list-item_checkbox']]: true,
                     [$style['list-item_checkbox--with-subtext']]: item.subtext
                  }">
                <checkbox-component
                    type="S"
                    v-model="chosenItems[item.id]"
                ></checkbox-component>
              </div>
              <div :class="{
                     [$style['list-item_text']]: true
                  }">
                <span
                    v-for="chunk in item.text" :key="item.id"
                    :class="{
                              [$style[chunk.type]]: true,
                              [$style.mono]: item.text.length === 1
                            }"
                >
                  {{chunk.value}}
                </span>
              </div>
              <div :class="{
                     [$style['list-item_subtext']]: true
                  }"
                   v-if="item.subtext"
              >
                <span
                    v-for="chunk in item.subtext" :key="item.id"
                    :class="{
                              [$style[chunk.type]]: true
                            }"
                >
                  {{chunk.value}}
                </span>
              </div>
              <div :class="{
                     [$style['list-item_additional']]: true
                  }"
                   v-if="item.additional"
              >
                <span
                    v-for="chunk in item.additional" :key="item.id"
                    :class="{
                              [$style[chunk.type]]: true
                            }"
                >
                  {{chunk.value}}
                </span>
              </div>
            </div>
          </div>
        </div>

        <div
            :class="{
                 [$style.footer]: true
                 }"
        >
          <slot name="sort-panel">
            <div
              :class="{
                 [$style['sort-panel']]: true
                 }"
            >
              <slot name="sort-panel-content">
                <segmented-tabs-component type="S" :countTabs="3" v-model="selectedTab">
                  <template #1>По умолчанию</template>
                  <template #2>А – Я</template>
                  <template #3>Я – А</template>
                </segmented-tabs-component>
              </slot>
            </div>
          </slot>
          <div
              :class="{
                 [$style['reset-btn_wrapper']]: true
                 }"
              @click="resetFilters"
          >
            <icon-trash-xmark-fill></icon-trash-xmark-fill>
            <span
                :class="{
                 [$style['reset-btn_label']]: true
                 }"
            >Сбросить все фильтры</span>
          </div>
      </div>
    </div>
  </div>
</template>

<script setup>
//imports
import {ref, toRefs, watch, isReactive, onBeforeMount, onMounted, onUnmounted, watchEffect} from "vue";
import TextFieldComponent from "@4ait/elements/TextFieldComponent";
import SegmentedTabsComponent from "@4ait/elements/SegmentedTabsComponent";
import IconTrashXmarkFill from "@4ait/icons_system/icons/IconTrashXmarkFill";
import CheckboxComponent from "@4ait/elements/CheckboxComponent";
//defines
const props = defineProps({
  listItems: {
    type: Array,
    default: []
  },
  chosenOptions: {
    type: Object,
    default: {}
  },
  value: String,
  selectedTabValue: [ Number, String ],
  modelValue: String
})
const emit = defineEmits(['choosenOptionsChange', 'update:selectedTabValue', 'update:modelValue', 'selectedTabChange', 'update:chosenOptions', 'resetFilters']);
const refsProps = toRefs(props);
//variables
const items = ref([]);
const chosenItems = ref({});
const selectedTab = ref(1);
const inputValue = ref("");
const currentResizeObserver = ref(null);
const isActiveOptionsOverflowed = ref(false);
const isActiveOptionsHiderVisible = ref(false);
//elements
const activeOptions = ref(null);
//watchers
watch(selectedTab, (val) => {
  emit('selectedTabChange', val)
  emit('update:selectedTabValue', val)
})
watch(inputValue, (val) => {
  emit('update:modelValue', val)
})
watch(chosenItems, (val) => {
  emit('choosenOptionsChange', val);
  emit('update:chosenOptions', val)
  recalculateActiveOptionsHiderVisiblity();
}, {deep: true})
watch(refsProps.selectedTabValue, (newVal) => {
  let numberVal = parseInt(newVal)
  if (isNaN(numberVal)) numberVal = 1;

  if (numberVal < 2) selectedTab.value = 1;
  else if (numberVal > 2) selectedTab.value = 3;
  else selectedTab.value = 2;
})
watch(() => {
  return props.chosenOptions
}, (val) => {
  chosenItems.value = val
}, {deep: true})
watch(() => [...props.listItems], (val) => {
  items.value = val
}, {deep: true})
watch(refsProps.value, (newVal) => {
  inputValue.value = newVal
})
watch(refsProps.modelValue, (newVal) => {
  inputValue.value = newVal
})
//functions
function resetFilters() {
  chosenItems.value = {};
  selectedTab.value = 1;
  inputValue.value = "";
  emit('resetFilters');
}
function onInputValue(event) {
  inputValue.value = event;
}
function setOptionVisible(key, value) {
  chosenItems.value[key] = value;
}
function summaryOfResults (array, callback) {
  let result = 0;
  for (let i = 0; i < array.length; i++)
  {
    result += callback(array[i])
  }
  return result;
}
function recalculateActiveOptionsHiderVisiblity() {
  isActiveOptionsHiderVisible.value = !(activeOptions.value.scrollTop === (activeOptions.value.scrollHeight - activeOptions.value.clientHeight));
}
//lifecycle hooks
onBeforeMount(() => {
  if (!isReactive(props.chosenOptions))
  {
    console.error("TextFilter onBeforeMount: \nCaution! chosenOptions must be reactive!")
  }
  if (!isReactive(props.listItems))
  {
    console.error("TextFilter onBeforeMount: \nCaution! listItems must be reactive!")
  }

  let numberVal = parseInt(refsProps.selectedTabValue.value)
  if (isNaN(numberVal)) numberVal = 1;
  if (numberVal < 2) selectedTab.value = 1;
  else if (numberVal > 2) selectedTab.value = 3;
  else selectedTab.value = 2;

  inputValue.value = refsProps.value.value;
  items.value = props.listItems;
})

const currentResizeObserverTriggered = ref(false);

onMounted(() => {
  currentResizeObserver.value = new ResizeObserver(() => {
    currentResizeObserverTriggered.value = true;
  })
  currentResizeObserver.value.observe(activeOptions.value);
})
onUnmounted(() => {
  if (currentResizeObserver.value !== null)
  {
    currentResizeObserver.value.disconnect();
  }
})

watchEffect(() => {
  if(!currentResizeObserverTriggered.value)
  {
    return;
  }

  currentResizeObserverTriggered.value = false;

  if (activeOptions.value != null) {
    const childrensArray = activeOptions.value.children;
    const currentActiveOptionsHeight = activeOptions.value.getBoundingClientRect().height;
    if (childrensArray != null || childrensArray.length > 0) {
      const childrensHeight = summaryOfResults(childrensArray, (elem) => {
        return elem.getBoundingClientRect().height;
      })

      isActiveOptionsOverflowed.value = childrensHeight > currentActiveOptionsHeight;
    } else {
      isActiveOptionsOverflowed.value = false;
    }
  } else {
    isActiveOptionsOverflowed.value = false;
  }
})

</script>
