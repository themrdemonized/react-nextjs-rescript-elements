<style module lang="scss">

</style>

<template>
    <button-m-tertiary-icon-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </button-m-tertiary-icon-component>
</template>

<script>
    import ButtonMTertiaryIconComponent from "@4ait/elements/ButtonMTertiaryIconComponent"
    import "./src/styles/templates/button.scss";

    /**
     * @deprecated
     */
    export default {
        components: {
          ButtonMTertiaryIconComponent
        }
    };
</script>