<style module lang="scss">

</style>

<template>
    <button-m-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
        <slot :name="name" v-bind="slotData" />
      </template>
    </button-m-component>
</template>

<script>
    import ButtonMComponent from "@4ait/elements/ButtonMComponent"
    import "./src/styles/templates/button.scss";

    /**
     * @deprecated
     */
    export default {
        components: {
          ButtonMComponent
        }
    };
</script>