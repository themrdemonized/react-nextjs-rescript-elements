<template>
  <tab-bar-component class="foura__trade_elements__elements_palette">
      <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
          <slot :name="name" v-bind="slotData" />
      </template>
  </tab-bar-component>
</template>

<script>
import TabBarComponent from "@4ait/elements/TabBarComponent"
import "./src/styles/templates/tab_bar.scss";

export default {
  components: {
    TabBarComponent
  }
};
</script>
