<style module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';
</style>

<template>
    <text-field-component type-size="M">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </text-field-component>
</template>

<script>
    import { Options, Vue } from "vue-class-component";
    import TextFieldComponent from "./TextFieldComponent";

    @Options({
        props: {
        },
        components: {
          TextFieldComponent
        }
    })
    /**
     * @deprecated
     */
    export default class TextFieldMComponent extends Vue {

    }
</script>