<style module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';
</style>

<template>
    <button-component type-size="M">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </button-component>
</template>

<script>
    import { Options, Vue } from "vue-class-component";
    import ButtonComponent from "./ButtonComponent";

    @Options({
        props: {
        },
        components: {
          ButtonComponent
        }
    })
    /**
     * @deprecated
     */
    export default class ButtonMComponent extends Vue {

    }
</script>