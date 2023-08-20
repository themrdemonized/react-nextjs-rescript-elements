<style module lang="scss">

</style>

<template>
    <text-field-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </text-field-component>
</template>

<script>
    import TextFieldComponent from "@4ait/elements/TextFieldComponent"
    import './src/styles/templates/text-field.scss'

    export default {
        components: {
          TextFieldComponent
        }
    };
</script>