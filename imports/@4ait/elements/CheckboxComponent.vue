<style module lang="scss">
    @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

    .input-wrapper
    {
        position: relative;

        display: grid;
        grid-template-columns: 20px auto;
        align-items: center;

        width: 100%;
        height: 100%;

        cursor: pointer;

        @include setFont(font-4ait-elements, caption-m);

        &:focus
        {
          outline: none;
        }

        &:hover
        {
            .checkbox
            {
                border: 1px solid var(--4ait-elements--checkbox--hover-border-color);
            }
        }

        &:active
        {
            .checkbox
            {
                background: var(--4ait-elements--checkbox--active-background-color);
                border: 1px solid var(--4ait-elements--checkbox--active-border-color);
            }
        }
    }

    .focused
    {
      .checkbox
      {
        border: 1px solid var(--4ait-elements--checkbox--focused-border-color);
        box-shadow: var(--4ait-elements--checkbox--focused-box-shadow);
      }

      &:hover
      {
        .checkbox
        {
          border: 1px solid var(--4ait-elements--checkbox--focused-border-color);
        }
      }


    }

    .checked
    {
      .check-icon
      {
        display: block;
        color: var(--4ait-elements--checkbox--checked-icon-color);
      }

      .checkbox
      {
        background: var(--4ait-elements--checkbox--checked-checkbox-background-color);
        border: 1px solid var(--4ait-elements--checkbox--checked-checkbox-border-color);
      }

      &.focused
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--checked-focused-checkbox-background-color);
        }
      }

      &:hover
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--checked-hover-checkbox-background-color);
          border: 1px solid var(--4ait-elements--checkbox--checked-hover-checkbox-border-color);
        }
      }

      &:active
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--checked-active-checkbox-background-color);
          border: 1px solid var(--4ait-elements--checkbox--checked-active-checkbox-background-color);
        }
      }
    }

    .disabled
    {
      pointer-events: none;

      .checkbox
      {
        background: var(--4ait-elements--checkbox--disabled-checkbox-background-color);
        border: none;
      }

      .caption
      {
        color: var(--4ait-elements--checkbox--disabled-checked-caption-color);
        pointer-events: auto;
        cursor: text;
      }

      &.checked
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--disabled-checked-checkbox-background-color);
        }

        .check-icon
        {
          color: var(--4ait-elements--checkbox--disabled-checked-icon-color);
        }
      }
    }

    .error
    {
      .checkbox
      {
        background: var(--4ait-elements--checkbox--error-checkbox-background-color);
        border: 1px solid var(--4ait-elements--checkbox--error-border-color);
      }

      .caption
      {
        color: var(--4ait-elements--checkbox--error-caption-color);
      }

      &:hover
      {
        .checkbox
        {
          border: 1px solid var(--4ait-elements--checkbox--error-hover-border-color);
        }

        .caption
        {
          color: var(--4ait-elements--checkbox--error-hover-caption-color);
        }
      }

      &:active
      {
        .checkbox
        {
          border: 1px solid var(--4ait-elements--checkbox--error-checked-active-border-color);
          background: var(--4ait-elements--checkbox--error-active-checkbox-background-color);
        }

        .caption
        {
          color: var(--4ait-elements--checkbox--error-checked-active-caption-color);
        }
      }

      &.focused
      {
        .checkbox
        {
          box-shadow: var(--4ait-elements--checkbox--error-focused-box-shadow);
        }
      }

      &.checked
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--error-checked-checkbox-background-color);
          border: none;
        }

        &:hover
        {
          .checkbox
          {
            background: var(--4ait-elements--checkbox--error-checked-hover-checkbox-background-color);
          }
        }

        &:active
        {
          .checkbox
          {
            background: var(--4ait-elements--checkbox--error-checked-active-checkbox-background-color);
          }
        }
      }

      &.disabled
      {
        .checkbox
        {
          background: var(--4ait-elements--checkbox--error-disabled-checkbox-background-color);
          border: none;
        }

        .caption
        {
          color: var(--4ait-elements--checkbox--error-disabled-caption-color);
        }

        &:hover
        {
          .checkbox
          {
            background: var(--4ait-elements--checkbox--error-disabled-hover-checkbox-background-color);
          }
        }

        &.checked
        {
          .check-icon
          {
            color: var(--4ait-elements--checkbox--error-disabled-checked-icon-color);
          }
        }
      }
    }

    .checkbox-wrapper
    {
        padding-top: 2px;
        padding-bottom: 2px;
    }

    .checkbox
    {
        position: relative;

        width: 20px;
        height: 20px;

        border: 1px solid var(--4ait-elements--checkbox--default-border-color);

        border-radius: 6px;

        transition: all ease 0.2s;

        color: var(--4ait-elements--checkbox--default-icon-color);

        box-sizing: border-box;

    }

    .check-icon
    {
        width: 16px;
        height: 16px;
        display: none;

        position: absolute;

        top: 50%;
        left: 50%;

        transform: translate(-50%, -50%);
    }

    .caption
    {
        color: var(--4ait-elements--checkbox--default-caption-color);

        transition: all ease 0.2s;

        margin-left: 12px;

        text-align: left;
    }

    .small
    {
      &.input-wrapper
      {
        grid-template-columns: 16px auto;
      }

      .checkbox
      {
        width: 16px;
        height: 16px;
        border-radius: 4px;
      }

      .caption
      {
        margin-left: 8px;
      }

      @include setFont(font-4ait-elements, caption-s);
    }


</style>

<template>
    <div>
        <div
                :class="{
                    [$style['input-wrapper']]: true,
                    [$style.focused]: isFocused,
                    [$style.disabled]: disabled === true || disabled === 'true',
                    [$style.error]: isError === true || isError === 'true',
                    [$style.checked]: state === true || state === 'true' || state === 'parted',
                    [$style.small]: type === 'S'
                }"
                :tabindex=" disabled ? undefined : '0'"

                @focus="onFocus"
                @blur="isFocused = false"

                @keyup="onKeyUp"
                @mousedown="onMousedown"

                @click="onChange"
        >
            <div :class="$style['checkbox-wrapper']">
                <div :class="$style.checkbox">
                    <icon-minus-large v-if="state === 'parted'"
                                      :class="$style['check-icon']"
                    />
                    <icon-checkmark v-else :class="$style['check-icon']" />
                </div>
            </div>
            <span v-if="defaultSlotHasContent" :class="[$style.caption]">
                <slot></slot>
            </span>
        </div>
    </div>
</template>

<script setup>
import IconCheckmark from "@4ait/icons_system/icons/IconCheckmark"
import IconMinusLarge from "@4ait/icons_system/icons/IconMinusLarge"
import {computed, ref, toRefs, useSlots, watch, onMounted} from "vue";

const props = defineProps({
  modelValue: {
    type: [Boolean, String],
    default: false
  },
  disabled: {
    type: [ String, Boolean ],
    default: false
  },
  isError: {
    type: [ String, Boolean ],
    default: false
  },
  type: {
    type: [ String ],
    default: "M"
  },
  mode: {
    type: String,
    default: 'normal'
  }
});

const mode = {
  normal: 'normal',
  parted: 'parted'
}

const state = computed(() => {
  if (refsProps.mode.value === mode.normal) {
    return currentChecked.value
  } else if (refsProps.mode.value === mode.parted) {
    if (currentChecked.value) return true
    else if (!currentChecked.value && props.modelValue === mode.parted) return 'parted'
    else return false
  }
})

const refsProps = toRefs(props);

const emit = defineEmits(['update:modelValue']);

const slots = useSlots();

const isFocused = ref(false);
const currentChecked = ref(props.modelValue);

const defaultSlotHasContent = computed(() => {
  const defaultSlot = slots.default;

  if(!defaultSlot)
  {
    return false;
  }

  const slot = defaultSlot()
  return slot[0]['children'].length !== 0;
});

function onFocus()
{
  isFocused.value = true;
}

function onChange()
{
  if(!props.disabled)
  {
    currentChecked.value = !currentChecked.value;
    emit('update:modelValue', currentChecked.value);
  }
}

function onKeyUp(e)
{
  if(props.disabled)
    return;

  if (e.keyCode === 13 || e.keyCode === 32) {
    onChange();
    e.preventDefault();
  }
}

watch(refsProps.modelValue, (newValue) =>
{
  if (refsProps.mode.value === mode.normal)
  {
    if (typeof newValue === 'boolean')
    {
      currentChecked.value = newValue;
    } else {
      currentChecked.value = newValue === 'true';
    }
  } else if (refsProps.mode.value === mode.parted) {
    if (newValue === 'true' || newValue === true) {
      currentChecked.value = true
    } else if (newValue === 'false' || newValue === false || newValue === mode.parted) {
      currentChecked.value = false
    } else {
      console.error("invalid modelValue")
    }
  } else {
   console.error("invalid mode")
  }
});

watch(refsProps.disabled, (newValue) => {
  if(newValue)
  {
    isFocused.value = false;
  }
});

function onMousedown(event)
{
  // Prevent double click for disable text selection
  if (event.detail > 1) {
    event.preventDefault();
  }
}

onMounted(() => {
  if (refsProps.mode.value === mode.normal)
  {
    if (typeof props.modelValue === 'boolean')
    {
      currentChecked.value = props.modelValue;
    } else {
      currentChecked.value = props.modelValue === 'true';
    }
  } else if (refsProps.mode.value === mode.parted) {
    if (props.modelValue === 'true' || props.modelValue === true) {
      currentChecked.value = true
    } else if (props.modelValue === 'false' || props.modelValue === false || props.modelValue === mode.parted) {
      currentChecked.value = false
    } else {
      console.error("invalid modelValue")
    }
  } else {
    console.error("invalid mode")
  }
})
</script>
