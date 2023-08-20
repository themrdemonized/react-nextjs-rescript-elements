<style module lang="scss">
@import '~@4ait/scss_fonts_expansion/fonts_declare';

.root
{
  width: 264px;
  height: 52px;
}

.input
{
  width: 100%;
  height: 52px;

  border: 1px solid var(--4ait-elements--text-field--default-border-color);

  border-radius: 8px;

  outline: none;

  padding: 22px 0 6px 16px;

  box-sizing: border-box;

  transition: all ease 0.2s;

  color: var(--4ait-elements--text-field--default-text-color);
  background: var(--4ait-elements--text-field--default-background-color);

  // Fixes safari iOS drop-shadow
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;

  // Force autofilled as with text
  &:-webkit-autofill + .caption
  {
    top: 6px;
    transform: none;

    @include setFont(font-4ait-elements, caption-top);
  }
}

.input::-webkit-outer-spin-button,
.input::-webkit-inner-spin-button {
  /* display: none; <- Crashes Chrome on hover */
  -webkit-appearance: none;
  margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}

.input[type=number] {
  -moz-appearance:textfield; /* Firefox */
}

.input-wrapper
{
  position: relative;

  width: 100%;
  height: 100%;

  &:hover
  {
    .input
    {
      border: 1px solid var(--4ait-elements--text-field--hover-border-color);
    }
  }
}

.focused
{
  .input
  {
    border: 1px solid var(--4ait-elements--text-field--focused-border-color);
    box-shadow: var(--4ait-elements--text-field--focused-box-shadow);
  }

  .caption
  {
    top: 6px;
    transform: none;
    color: var(--4ait-elements--text-field--focused-caption-color);

    @include setFont(font-4ait-elements, caption-top);
  }

  &:hover
  {
    .input
    {
      border: 1px solid var(--4ait-elements--text-field--focused-border-color);
    }
  }
}

.with-text
{
  .caption
  {
    top: 6px;
    transform: none;

    @include setFont(font-4ait-elements, caption-top);
  }
}

.disabled
{
  .input
  {
    background: var(--4ait-elements--text-field--disabled-background-color);
    border: 1px solid var(--4ait-elements--text-field--disabled-border-color);
    color: var(--4ait-elements--text-field--disabled-text-color);
  }

  .caption
  {
    color: var(--4ait-elements--text-field--disabled-caption-text-color);
  }
}

.error
{
  .input
  {
    background: var(--4ait-elements--text-field--error-background-color);
    transition: all ease 0.2s, padding-right 0s;
    padding-right: 32px + 8px;
    border: 1px solid var(--4ait-elements--text-field--error-border-color);
  }

  .caption
  {
    color: var(--4ait-elements--text-field--error-caption-color);
  }

  .icon-warning
  {
    display: inline-block;
  }

  &:hover
  {
    .input
    {
      background: var(--4ait-elements--text-field--error-hover-background-color);
      border: 1px solid var(--4ait-elements--text-field--error-hover-border-color);
    }

    .caption
    {
      color: var(--4ait-elements--text-field--error-hover-caption-color);
    }
  }

  &.focused
  {
    .input
    {
      box-shadow: var(--4ait-elements--text-field--error-focused-box-shadow);
    }

    .caption
    {
      color: var(--4ait-elements--text-field--error-focused-caption-color);
    }
  }

  &.with-text
  {
    &:hover
    {
      .caption
      {
        color: var(--4ait-elements--text-field--error-with-text-hover-caption-color);
      }
    }
  }

  .disabled
  {
    .input
    {
      border: 1px solid var(--4ait-elements--text-field--error-disabled-border-color);
      background: var(--4ait-elements--text-field--error-disabled-background-color);
    }

    .caption
    {
      color: var(--4ait-elements--text-field--error-disabled-caption-color);
    }

    &:hover
    {
      .input
      {
        background: var(--4ait-elements--text-field--error-disabled-background-color);
      }
    }

    &.with-text
    {
      .input
      {
        background: var(--4ait-elements--text-field--error-disabled-background-color);
      }

      .caption
      {
        color: var(--kr-color-feedback-error-2);
      }
    }
  }
}

.caption
{
  color: var(--4ait-elements--text-field--default-caption-color);

  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);

  pointer-events: none;
  user-select: none;

  transition: all ease 0.2s;

  @include setFont(font-4ait-elements, caption-default);
}

.group-icon
{
  position: absolute;
  top: 50%;
  right: 16px - 4px;

  height: 16px;

  transform: translateY(-50%);

  pointer-events: none;
}

.icon-status
{
  display: inline-block;
  vertical-align: top;
  width: 16px;
  height: 16px;

  margin-right: 4px;
}

.icon-warning
{
  color: var(--4ait-elements--text-field--icon-warning-color);
  display: none;
}
</style>

<template>
  <div :class="$style.root">
    <div
        :class="{
                    [$style['input-wrapper']]: true,
                    [$style.focused]: isFocused,
                    [$style['with-text']]: isWithContent,
                    [$style.disabled]: disabled === true || disabled === 'true',
                    [$style.error]: isError === true || isError === 'true'
                }"
    >
      <input
          ref="input"
          :class="{'font-4ait-elements_text': true, [$style.input]: true}"

          :disabled="disabled === true || disabled === 'true'"

          @focus="onFocus"
          @blur="onBlur"
          @change="onChange"
          @input="onInput"
          @keyup="onKeyUp"

          :type="type"
          :name="name"
          :value="currentValueString"
          :autocomplete="autocomplete"
          :autofocus="autofocus"

          :style="{
                      'padding-left': (16 + contentLeftPadding) + 'px'
                    }"
      />
      <div ref="content" v-if="$slots.content" style="
                  position: absolute;
                  left: 16px;
                  top: 22px;
                  height: 22px;
                  display: flex;
                  justify-content: center;
                  align-items: center;"
      >
        <div>
          <slot name="content"></slot>
        </div>
      </div>
      <span :class="$style.caption">
                <slot></slot>
            </span>
      <div :class="$style['group-icon']">
        <icon-exclamationmark-triangle-fill :class="[$style['icon-status'], $style['icon-warning']]" />
      </div>
    </div>
  </div>
</template>

<script setup>
import './src/font_classes/text.scss';

import IconExclamationmarkTriangleFill from "@4ait/icons_system/icons/IconExclamationmarkTriangleFill"
import {computed, watch, ref, toRefs, onBeforeMount, onMounted, useSlots, nextTick} from "vue";

const props = defineProps({
  name: String,
  autocomplete: String,
  type: {
    type: String,
    default: "text"
  },
  typeValue: {
    type: String,
    default: ''
  },
  modelValue: {
    type: [String, Number],
    default: undefined
  },
  typeSize: {
    type: String,
    default: "M"
  },
  value: {
    type: [String, Number],
    default: undefined
  },
  disabled: {
    type: [ String, Boolean ],
    default: false
  },
  isError: {
    type: [ String, Boolean ],
    default: false
  },
  autoselect: {
    default: false
  },
  autofocus: {
    default: false
  },
  forceWithContentState: false,
  forceFocusState: false,
  updateModelValueOnInput: {
    type: Boolean,
    default: false
  }
})

const propsRefs = toRefs(props);

const emit = defineEmits(['change', 'input', 'update:modelValue', 'focus', 'blur', 'keyup']);

const slots = useSlots();

const isFocusedInput = ref(false);
const currentValue = ref(null);

const contentLeftPadding = ref(0);

const input = ref(null);
const content = ref(null);

const useDeprecatedValue = ref(false);

onBeforeMount(() => {
  if(props.value !== undefined)
  {
    currentValue.value = props.value;
  }
  else if(props.modelValue !== undefined)
  {
    currentValue.value = props.modelValue;
  }
});


function updateContentPadding()
{
  contentLeftPadding.value = content.value.getBoundingClientRect().width
}

onMounted(() => {
  const ua = window.navigator.userAgent;
  const isiOS = !!ua.match(/iPad/i) || !!ua.match(/iPhone/i);

  if(props.autoselect && !isiOS)
  {
    input.value.focus();
  }

  if(slots.content)
  {
    updateContentPadding();
  }
});

function onFocus()
{
  isFocusedInput.value = true;
  emit('focus');
}

function valueToString(value)
{
  if(value === null || value === undefined)
  {
    return '';
  }

  if(props.typeValue !== '')
  {
    if(props.typeValue === 'number')
    {
      return value.toString();
    }
  }

  return value;
}

function onBlur()
{
  if (useDeprecatedValue.value)
  {
    currentValue.value = valueToString(propsRefs.value.value);
  }
  else
  {
    currentValue.value = valueToString(propsRefs.modelValue.value);
  }

  isFocusedInput.value = false;
  emit('blur');
}

function toTyped(val)
{
  if(val === undefined)
  {
    return null;
  }

  if(props.typeValue !== '')
  {
    if(props.typeValue === 'number')
    {
      if(val === '' || val === null)
      {
        return null;
      }

      let num = parseFloat(val.replace(',', '.'));

      if(Number.isNaN(num))
      {
        return undefined;
      }

      return num;
    }
  }

  return val;
}

function onChange(e)
{
  const value = toTyped(e.target.value);

  if(value === undefined)
  {
    return;
  }

  currentValue.value = value;

  emit('change', value);
  emit('update:modelValue', value);
}

function onInput(e)
{
  const value = toTyped(e.target.value);

  if(value === undefined)
  {
    return;
  }

  currentValue.value = value;

  emit('input', value);

  if(props.updateModelValueOnInput)
  {
    emit('update:modelValue', value);
  }

  let startPos = input.value.selectionStart;
  if(startPos !== null && startPos !== undefined)
  {
    nextTick(() =>  input.value.setSelectionRange(startPos, startPos))
  }
}

watch(propsRefs.value, (newValue) =>
{
  currentValue.value = newValue;
  useDeprecatedValue.value = true;
});

watch(propsRefs.modelValue, (newValue) =>
{
  currentValue.value = newValue;
});

const isWithContent = computed(() => {
  return (
      currentValue.value !== undefined &&
      currentValue.value !== null &&
      currentValue.value !== '') ||

      props.forceWithContentState;
})

const isFocused = computed(() => {
  return isFocusedInput.value || props.forceFocusState;
});

const currentValueString = computed(() => {
  return valueToString(currentValue.value)
});

function onKeyUp(e)
{
  emit('keyup', e);
}
</script>
