<style module lang="scss">

</style>


<template>
  <button-component class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </button-component>
</template>

<script>
  import ButtonComponent from "@4ait/elements/ButtonComponent"
  import "./src/styles/templates/button.scss";

  export default {
    components: {
      ButtonComponent
    }
  }
</script>
