/*
EXAMPLE USAGE

items: {
create: {
type: "button",
text: "Создать",
active: true,
selectable: false
},

delete: {
type: "button",
text: "Удалить",
icon: true,
iconClasses: ['best-dick'],
textClasses: ['bad-dick']
},
divider1: {
type: "divider"
}
}
*/

<style module lang="scss">
@import "~@4ait/trade_fonts/mixin_trade_font";

.root
{
  width: 240px;
}

.context-menu
{
  height: 100%;
  overflow-y: auto;

  background: var(--4ait-elements--context-menu--default-background-color);
  border: 1px solid var(--4ait-elements--context-menu--default-border-color);
  border-radius: 16px;
  box-shadow: var(--4ait-elements--context-menu--default-box-shadow);
  padding: 8px;

  @include setFont(font-4ait-elements,context-menu-main-font);
}

.divider
{
  height: 8px;
  display: flex;
  justify-content: center;
  align-items: center;

  padding: 0 16px;
}

.divider-line
{
  height: 1px;
  background-color: var(--4ait-elements--context-menu--divider-line-background-color);
  width: 100%;
}

.button
{
  display: flex;
  justify-items: center;
  align-items: center;
  gap: 8px;

  border-radius: 8px;

  padding: 8px 16px;
}

.button-selectable
{
  &:hover
  {
    background: var(--4ait-elements--context-menu--button-selectable-hover-background-color);
    cursor: pointer;
  }
}

.button-text
{
  flex-grow: 1;
  color: var(--4ait-elements--context-menu--button-text-color);
  user-select: none;
}

.button-icon
{
  color: var(--4ait-elements--context-menu--button-icon-color);
}

.button-active
{
  background-color: var(--4ait-elements--context-menu--button-active-background-color);
}

.button-text-active
{
  color: var(--4ait-elements--context-menu--button-text-active-color);
}

.button-icon-active
{
  color: var(--4ait-elements--context-menu--button-icon-active-color);
}

.text
{
  display: flex;
  justify-items: center;
  align-items: center;

  border-radius: 8px;
  padding: 8px 16px;

  color: var(--4ait-elements--context-menu--button-text-color);
}

.text-with-hover
{
  &:hover
  {
    background: var(--4ait-elements--context-menu--button-selectable-hover-background-color);
  }
}
</style>

<template>
  <div :class="$style.root">
    <div :class="$style['context-menu']">
      <template v-for="(valueElement, nameElement) in itemsDecl" :key="nameElement">
        <template v-if="valueElement.type === 'divider'">
          <div :class="$style.divider">
            <div :class="$style['divider-line']"/>
          </div>
        </template>
        <template v-else-if="valueElement.type === 'button'">
          <div :class="{
                [$style.button]: true,
                [$style['button-active']]: valueElement.active,
                [$style['button-selectable']]: valueElement.selectable !== false
              }"
               @click="clickItem(nameElement, valueElement)"

          >
            <div
                :class="mergeClassesItem({
                  [$style['button-text']]: true,
                  [$style['button-text-active']]: valueElement.active
                }, valueElement.textClasses)"
            >
              <slot name="button-element" :element="valueElement">{{valueElement.text}}</slot>
            </div>
            <div v-if="valueElement.icon"
                 :class="mergeClassesItem({
                    [$style['button-icon']]: true,
                    [$style['button-icon-active']]: valueElement.active
                 }, valueElement.iconClasses)"
            >
              <slot :name="'icon-' + nameElement" />
            </div>
          </div>
        </template>
        <template v-else-if="valueElement.type === 'text'">
          <div :class="$style.text">
            <slot name="text-element" :element="valueElement">{{valueElement.text}}</slot>
          </div>
        </template>
      </template>
    </div>
  </div>
</template>

<script>
import { Options, Vue } from "vue-class-component"
import {onMounted} from "vue";

const Component = Options;
@Component({
  props: {
    itemsDecl: {
      type: Object
    }
  },
  components: {
  },
  emit: ['clickItem']
})
export default class ContextMenuComponent extends Vue {
  mergeClassesItem(baseClasses, userClasses)
  {
    if(userClasses)
    {
      for(let userClass of userClasses)
      {
        baseClasses[userClass] = true;
      }
    }

    return baseClasses;
  }

  clickItem(name, value)
  {
    if(value.selectable !== false)
    {
      this.$emit('clickItem', { name: name, value: value } );
    }
  }
}


</script>