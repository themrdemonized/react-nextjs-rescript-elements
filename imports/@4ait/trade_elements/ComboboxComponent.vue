<style module lang="scss">

</style>

<template>
    <combobox-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </combobox-component>
</template>

<script>
    import ComboboxComponent from "@4ait/elements/ComboboxComponent"
    import './src/styles/templates/combobox.scss'
    import './src/styles/templates/tag-component.scss'

    export default {
        components: {
          ComboboxComponent
        }
    };
</script>