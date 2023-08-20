<template>
  <checkbox-component class="foura__trade_elements__elements_palette">
    <slot></slot>
  </checkbox-component>
</template>

<script>
import CheckboxComponent from "@4ait/elements/CheckboxComponent"
import "./src/styles/templates/checkbox.scss";

export default {
  components: {
    CheckboxComponent
  }
};
</script>