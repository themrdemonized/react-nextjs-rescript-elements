<style module lang="scss">
@import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

.wrapper
{
  width: 100%;
  height: 100%;
  position: relative;

  border: 1px solid var(--4ait-elements--number-filter--wrapper-border);
  box-shadow: var(--4ait-elements--number-filter--wrapper-shadow);

  border-radius: 20px;

  overflow: hidden;
}

.inputfield
{
  width: calc(100% - 24px);
  margin: 12px 12px 12px 12px;
}

.active-options-wrapper
{
  position: relative;
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



.footer
{
  box-sizing: border-box;
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

  color: var(--4ait-elements-number-filter--btn-reset--color-default);
  box-sizing: border-box;
  height: 40px;
  padding: 10px 0 10px 102.5px;

  user-select: none;
  cursor: pointer;

  &:hover
  {
    color: var(--4ait-elements-number-filter--btn-reset--color-hover);
    background: var(--4ait-elements-number-filter--btn-reset--background-hover);
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
          @keypress="isKeyValid($event)"
          @input="onInputValue($event)"
          v-model:value="inputValue"
      >
        <slot></slot>
      </text-field-component>

      <div
          :class="{
                 [$style.footer]: true
                 }"
      >
        <div
            :class="{
                 [$style['sort-panel']]: true
                 }"
        >
          <segmented-tabs-component type="S" :countTabs="3" v-model="selectedTab">
            <template #1>По умолчанию</template>
            <template #2>1 – 9</template>
            <template #3>9 – 1</template>
          </segmented-tabs-component>

        </div>
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

<script>
import {Options, Vue} from "vue-class-component"
import TextFieldComponent from "@4ait/elements/TextFieldComponent";
import SegmentedTabsComponent from "@4ait/elements/SegmentedTabsComponent";
import IconTrashXmarkFill from "@4ait/icons_system/icons/IconTrashXmarkFill";

const Component = Options;
@Component({
  props: {
    value: String,
    selectedTabValue: Number
  },
  components: {
    TextFieldComponent,
    SegmentedTabsComponent,
    IconTrashXmarkFill
  },
  emits: ['update:selectedTabValue', 'update:modelValue'],
  watch: {
    inputValue(newVal){
      let floatVal = parseFloat(newVal);
      if (!isNaN(floatVal))
      {
        this.$emit('update:modelValue', newVal)
      }
    },
    value: function (newVal){
      let floatVal = parseFloat(newVal);
      if (!isNaN(floatVal))
      {
        this.inputValue = floatVal;
      }
    },
    selectedTabValue: function (newVal)
    {
      let numberVal = parseInt(newVal)
      if (isNaN(numberVal)) numberVal = 1;
      if (numberVal < 2)
      {
        this.selectedTab = 1;
      } else if (numberVal === 2) {
        this.selectedTab = 2;
      } else {
        this.selectedTab = 3;
      }
    },
    selectedTab: function (newVal)
    {
      this.$emit('update:selectedTabValue', this.selectedTab);
    }
  }
})

export default class NumberFilterComponent extends Vue {
  inputValue = '';
  selectedTab = 1;

  beforeMount()
  {
    if (this.value)
    {
      let floatVal = parseFloat(this.value);
      if (!isNaN(floatVal))
      {
        this.inputValue = floatVal;
      }
    }

    if (this.selectedTabValue)
    {
      let numberVal = parseInt(this.selectedTabValue)
      if (isNaN(numberVal)) numberVal = 1;
      if (numberVal < 2)
      {
        this.selectedTab = 1;
      } else if (numberVal === 2) {
        this.selectedTab = 2;
      } else {
        this.selectedTab = 3;
      }
    }
  }

  onInputValue(event) {
    this.inputValue = event;
  }

  isKeyValid(event) {
     const keyCode = event.keyCode;
     if (((keyCode >= 48)&&(keyCode <= 57))||((keyCode === 44)||(keyCode === 46))) { //codes from 0 to 9, comma and dot
       return
     }
    event.preventDefault();
  }

  resetFilters()
  {
    this.selectedTab = 1;
  }
}
</script>
