<style module lang="scss">

</style>

<template>
    <text-field-m-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </text-field-m-component>
</template>

<script>
    import TextFieldMComponent from "@4ait/elements/TextFieldMComponent"
    import './src/styles/templates/text-field.scss'

    export default {
        components: {
          TextFieldMComponent
        }
    };
</script>