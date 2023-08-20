<template>
  <popover-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
          <slot :name="name" v-bind="slotData" />
      </template>
  </popover-component>
</template>

<script>
import PopoverComponent from "@4ait/elements/PopoverComponent"
import "./src/styles/templates/popover.scss";

export default {
  components: {
      PopoverComponent
  }
};
</script>
