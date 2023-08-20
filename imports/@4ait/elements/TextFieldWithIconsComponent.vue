<style module lang="scss">
@import "~@4ait/trade_fonts/mixin_trade_font";
@import 'imports/@4ait/scss_fonts_expansion/fonts_declare';
.root
{
  @include setFont(font-4ait-elements,text-field-with-icons-main-font);
  display: flex;
  background: var(--4ait-elements--text-field-with-icons--default-background-color);
  width: 224px;
  height: 40px;
  align-items:center;
  border: 1px solid var(--4ait-elements--text-field-with-icons--default-border-color);
  border-radius: 8px;
  &:hover{
    border: 1px solid var(--4ait-elements--text-field-with-icons--default-hover-border-color);
  }
}
.with-content-size{
  width: fit-content;
}
.focused
{
  border: 1px solid var( --4ait-elements--text-field-with-icons--focused-border-color);
  box-shadow:var(--4ait-elements--text-field-with-icons--focused-box-shadow-color);
  &:hover{
    border: 1px solid var( --4ait-elements--text-field-with-icons--focused-hover-border-color);
  }
}
.input
{
  border: 1px solid var(--4ait-elements--text-field-with-icons--input-border-color);
  outline: none;
  margin: 8px 5px 8px 10px;

  height: 24px;

}


.left-icon
{
  width: 14px;
  height: 14px;
  margin-left: 13px;
}
.right-icon
{

  width: 14px;
  height: 14px;
  margin-right: 13px;
}

.disabled
{
  background:var(--4ait-elements--text-field-with-icons--disabled-background-color);
  color:var(--4ait-elements--text-field-with-icons--disabled-color);
  .input{
    background: transparent;
    color:var(--4ait-elements--text-field-with-icons--input-disabled-color);
    border: 0;

  }


}

</style>

<template>

  <div
      @focus="onFocusDiv()"
      @focusout="unFocusDiv()"
      tabindex="0"
      :class="{
   [$style.root]:true,
   [$style.focused]:focused,
   [$style.disabled]: disabled === true || disabled === 'true',
   [$style['with-content-size']]:(iconsLeftCount+iconsRightCount) > 2
      }"

  >

    <template v-for="items in iconsLeftCount" :key="items">
      <div  :class="mergeClassesItem({
                  [$style['left-icon']]: true
                }, iconLeftClasses[items-1])"
            v-if="$slots['icon-left-' + items]">
        <slot :name="'icon-left-' + items"></slot>
      </div>
    </template>

    <input
        v-on:keyup.enter="unFocusDiv"
        name="rootInput"
        :class="{'font-4ait-elements_text': true, [$style.input]: true}"
        :style="currentWithInput"
        :disabled="disabled === true || disabled === 'true'"

        @focus="onFocus()"
        @blur="onBlur()"
        @change="onChange($event)"
        @input="onInput($event)"
        @keyup="onKeyUp($event)"


        :type="'text'"
        :value="currentValue"
        placeholder="Поиск"
    />

    <template v-for="items in iconsRightCount" :key="items">
      <div :class="mergeClassesItem({
                  [$style['right-icon']]: true
                }, iconRightClasses[items-1])"
           v-if="$slots['icon-right-' + items]"
      >
        <slot :name="'icon-right-' + items"></slot>
      </div>
    </template>

  </div>

</template>

<script setup>
import {ref,computed,watch} from "vue";


const emit = defineEmits(['input', 'update:modelValue', 'focus', 'blur', 'keyUp']);

const props = defineProps({
  disabled:{
    type:[String,Boolean],
    default:false
  },
  modelValue:{
    type: String,
    default: ""
  },
  iconsLeftCount:{
    type:Number,
    default: 0
  },
  iconsRightCount:{
    type:Number,
    default: 0
  },
  iconLeftClasses:{
    default:['']
  },
  iconRightClasses:{
    default:['']
  }

})

const focused = ref(false)
const currentValue = ref(props.modelValue)

const withInput = ref(224)
const currentWithInput = computed(()=>{
  let generic = {}
  if((props.iconsLeftCount+props.iconsRightCount)===0) {
    generic['width'] = withInput.value -(10+5) + 'px '
  }
  else if(props.iconsLeftCount===1 && props.iconsRightCount===0){
    generic['width'] = withInput.value-(13+14+10+5) + 'px '
  }
  else if(props.iconsLeftCount===0 && props.iconsRightCount===1){
    generic['width'] = withInput.value-(10+5+14+13) + 'px '
  }
  else {
    generic['width'] = withInput.value-(13+14+10+5+14+13) + 'px' //-(marginLeftIconLeft+heightIconLeft+marginLeftInput + marginRightInput + heightIconRight + marginRightIconRight)
  }
  return generic
})

function onFocusDiv() {
  document.getElementsByName('rootInput')[0].focus();
  focused.value = true;

}
function unFocusDiv() {
  document.getElementsByName('rootInput')[0].blur();
  focused.value = false
}
function mergeClassesItem (baseClasses, userClasses)
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
function onKeyUp(event){
  emit('keyUp',event)

}
function onInput(event){
  emit('input',event)
}
function onChange(event){
  const value =event.target.value;
  if (value === undefined) return;
  currentValue.value = value;
  emit('update:modelValue',currentValue.value)
}
function onFocus(){
  focused.value = true
  emit('focus')
}

function onBlur(){
  focused.value = false
  emit('blur')

}
watch(()=>{return props.modelValue

}, (newValue)=>{
  currentValue.value = newValue
})
</script>


