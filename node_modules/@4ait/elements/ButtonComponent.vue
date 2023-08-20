<style module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

  .root
  {
    width: fit-content;
    height: 40px;

    @include setFont(font-4ait-elements, text-m);
  }

  .root-with-icon
  {
    .content
    {
      margin-left: 12px - 1px;
      margin-right: 12px - 1px;
    }
  }

  .root-with-icon-single
  {
    .content
    {
      margin-left: 16px - 1px;
      margin-right: 16px - 1px;
    }
  }

  .root-with-icon-double
  {
    .content
    {
      margin-left: 12px - 1px;
      margin-right: 12px - 1px;
    }
  }

  .force-active
  {
  }

  .root-button
  {
    position: relative;

    width: 100%;
    height: 100%;

    background: var(--4ait-elements--button--primary-default-background-color);
    border: 1px solid var(--4ait-elements--button--primary-default-border-color);
    box-sizing: border-box;
    border-radius: 8px;

    color: var(--4ait-elements--button--primary-default-text-color);

    cursor: pointer;

    -webkit-tap-highlight-color: transparent;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;

    -webkit-appearance: none;

    &:focus
    {
      background: var(--4ait-elements--button--primary-focus-background-color);
      box-shadow: var(--4ait-elements--button--primary-focus-box-shadow);
      outline: none;
    }

    &:hover
    {
      background: var(--4ait-elements--button--primary-hover-background-color);
    }

    &:active,&.force-active
    {
      background: var(--4ait-elements--button--primary-active-background-color);
    }

    &.disabled
    {
      pointer-events: none;
      background: var(--4ait-elements--button--primary-disabled-background-color);
      color: var(--4ait-elements--button--primary-disabled-text-color);
      border-color: var(--4ait-elements--button--primary-disabled-border-color);

      transition: 0.4s ease-in-out background, 0.4s ease-in-out color;
    }
  }

  .content
  {
    display: flex;
    align-items: center;
    height: 100%;
    margin-left: 16px - 1px;
    margin-right: 16px - 1px;
    justify-content: center;
  }

  .icon-with-text
  {
    margin-right: 8px;
    vertical-align: middle;
    display: inline-block;
  }

  .icon-double
  {
    vertical-align: middle;
    display: inline-block;
  }

  .text
  {
    vertical-align: middle;
    display: inline-block;
  }

  .hidden-input
  {
    opacity: 0;
    pointer-events: none;
    position: absolute;
  }

  .secondary
  {
    background: var(--4ait-elements--button--secondary-default-background-color);
    color: var(--4ait-elements--button--secondary-default-text-color);
    border-color: var(--4ait-elements--button--secondary-default-border-color);

    &:hover
    {
      border-color: var(--4ait-elements--button--secondary-hover-border-color);
    }

    &:active,&.force-active
    {
      border-color: var(--4ait-elements--button--secondary-active-border-color);
    }

    &:focus
    {
      background: var(--4ait-elements--button--secondary-focus-background-color);
      color: var(--4ait-elements--button--secondary-focus-text-color);
      border-color: var(--4ait-elements--button--secondary-focus-border-color);
      box-shadow: var(--4ait-elements--button--secondary-focus-box-shadow);
    }

    &:hover
    {
      background: var(--4ait-elements--button--secondary-hover-background-color);
      color: var(--4ait-elements--button--secondary-hover-text-color);
    }

    &:active,&.force-active
    {
      background: var(--4ait-elements--button--secondary-active-background-color);
      color: var(--4ait-elements--button--secondary-active-text-color);
    }

    &.disabled
    {
      background: var(--4ait-elements--button--secondary-disabled-background-color);
      color: var(--4ait-elements--button--secondary-disabled-text-color);
      border-color: var(--4ait-elements--button--secondary-disabled-border-color);
    }
  }

  .tertiary
  {
    background: var(--4ait-elements--button--tertiary-default-background-color);
    color: var(--4ait-elements--button--tertiary-default-text-color);
    border-color: var(--4ait-elements--button--tertiary-default-border-color);

    &:focus
    {
      background: var(--4ait-elements--button--tertiary-focus-background-color);
      color: var(--4ait-elements--button--tertiary-focus-text-color);
      border-color: var(--4ait-elements--button--tertiary-focus-border-color);
      box-shadow: var(--4ait-elements--button--tertiary-focus-box-shadow);
    }

    &:hover
    {
      background: var(--4ait-elements--button--tertiary-hover-background-color);
      color: var(--4ait-elements--button--tertiary-hover-text-color);
      border-color: var(--4ait-elements--button--tertiary-hover-border-color);
    }

    &:active,&.force-active
    {
      background: var(--4ait-elements--button--tertiary-active-background-color);
      color: var(--4ait-elements--button--tertiary-active-text-color);
      border-color: var(--4ait-elements--button--tertiary-active-border-color);
    }

    &.disabled
    {
      background: var(--4ait-elements--button--tertiary-disabled-background-color);
      color: var(--4ait-elements--button--tertiary-disabled-text-color);
      border-color: var(--4ait-elements--button--tertiary-disabled-border-color);
    }
  }

  .large
  {
    height: 52px;

    .content
    {
      margin-left: 28px - 1px;
      margin-right: 28px - 1px;
    }

    &.root-with-icon
    {
      .content
      {
        margin-left: 24px - 1px;
        margin-right: 24px - 1px;
      }
    }

    &.root-with-icon-single
    {
      .content
      {
        margin-left: 18px - 1px;
        margin-right: 18px - 1px;
      }
    }

    &.root-with-icon-double
    {
      .content
      {
        margin-left: 12px - 1px;
        margin-right: 12px - 1px;
      }
    }
  }

  .small
  {
    height: 32px;

    .content
    {
      margin-left: 12px - 1px;
      margin-right: 12px - 1px;
    }

    &.root-with-icon
    {
      .content
      {
        margin-left: 8px - 1px;
        margin-right: 8px - 1px;
      }
    }

    &.root-with-icon-single
    {
      .content
      {
        margin-left: 12px - 1px;
        margin-right: 12px - 1px;
      }
    }

    &.root-with-icon-double
    {
      .content
      {
        margin-left: 8px - 1px;
        margin-right: 8px - 1px;
      }
    }

    .icon-with-text
    {
      margin-right: 4px;
    }

    @include setFont(font-4ait-elements, text-s);
  }
</style>

<template>
  <div :class="{
        [$style.root]: true,
        [$style['root-with-icon']]: $slots['icon-with-text'],
        [$style['root-with-icon-single']]: $slots['icon-single'],
        [$style['root-with-icon-double']]: $slots['icon-double1'],
        [$style.large]: typeSize === 'L',
        [$style.small]: typeSize === 'S'
      }">
    <div ref="main" :tabindex="disabledBoolean ? '' : '0'" @click="onClick" :class="{
        [$style['root-button']]: true,
        [$style.disabled]: disabledBoolean,
        [$style.secondary]: typeColor === 'Secondary',
        [$style.tertiary]: typeColor === 'Tertiary',
        [$style['force-active']]: forceActive
      }">
      <div :class="$style.content">
        <template v-if="$slots['icon-single']">
          <div :class="$style['icon-single']">
            <slot name="icon-single"></slot>
          </div>
        </template>
        <template v-else-if="$slots['icon-double1']">
          <div :class="$style['icon-double']">
            <slot name="icon-double1"></slot>
          </div>
          <div :class="$style['icon-double']">
            <slot name="icon-double2"></slot>
          </div>
        </template>
        <template v-else>
          <div v-if="$slots['icon-with-text']" :class="$style['icon-with-text']">
            <slot name="icon-with-text"></slot>
          </div>
          <div :class="$style.text">
            <slot>{{value}}</slot>
          </div>
        </template>
      </div>
    </div>
    <input v-if="type" ref="input" :type="type" :name="name" :value="value" :class="$style['hidden-input']" />
  </div>
</template>

<script>
    import { Options, Vue } from "vue-class-component";

    @Options({
        props: {
          type: String,
          value: String,
          name: String,
          typeColor: {
            type: String,
            default: "Primary"
          },
          typeSize: {
            type: String,
            default: "M"
          },
          disabled: {
            type: [String, Boolean],
            default: false
          },
          forceActive: {
            type: Boolean,
            default: false
          }
        },
        components: {
        },
        computed: {
          disabledBoolean: function () {
            return this.disabled === true || this.disabled === 'true';
          }
        },
        watch: {
          disabledBoolean: function () {
            if(this.disabledBoolean)
            {
              this.$refs.main.blur();
            }
          }
        },
        emits: [ 'click' ]
    })
    export default class ButtonComponent extends Vue {

      onClick()
      {
        if(this.disabledBoolean)
        {
          return;
        }

        if(this.type)
        {
          this.$refs.input.click();
        }

        this.$emit('click');
      }

    }
</script>