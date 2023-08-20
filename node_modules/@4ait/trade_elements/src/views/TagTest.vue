<style module lang="scss">
    .inline
    {
        display: inline;
        margin: 5px;
    }
    .inlineblock
    {
        display: inline-block;
        margin: 5px;
    }
</style>

<template>

  <tag-component :class="[$style.inlineblock]" modelValue="Текст" />
  <tag-component withIcon="true" :class="[$style.inline]" modelValue="Текст" > <icon-bell/> </tag-component>
  <tag-component withXmark="true" :class="[$style.inline]" modelValue="Текст" > <icon-bell/> </tag-component>
  <tag-component withIcon="true" withXmark="true" :model-is-active="modelIsActive" :class="[$style.inline]" modelValue="Текст" > <icon-bell/> </tag-component>
 
  <br>

  <tag-component isError="true" :class="[$style.inlineblock]" modelValue="Текст" />
  <tag-component isError="true" withIcon="true" :class="[$style.inline]" modelValue="Текст" > <icon-star-fill/> </tag-component>
  <tag-component isError="true" withXmark="true" isEditable="true" :class="[$style.inline]" modelValue="Текст" > <icon-star-fill/> </tag-component>
  <tag-component isError="true" withIcon="true" withXmark="true" :model-is-active="modelIsActive" @update:model-on-click-xmark="onClickClose" :class="[$style.inline]" modelValue="Текст" > <icon-star-fill/> </tag-component>

</template>

<script>
  import { Options, Vue } from "vue-class-component";

  import IconStarFill from "@4ait/icons_system/icons/IconStarFill"
  import IconBell from "@4ait/icons_system/icons/IconBell"
  import TagComponent from '../../TagComponent'

  @Options({
    components: {
      TagComponent,
      IconStarFill,
      IconBell
    },
    props: {

    },
    computed: {

    }
  })
  export default class TagTest extends Vue {
    modelIsActive = true;
    onClickClose(e) {
      window.console.log("I clicked this bullshit");
    }
  }
</script>