<template>
  <pagination-page-selector-component class="foura__trade_elements__elements_palette" >
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </pagination-page-selector-component>
</template>

<script>
import PaginationPageSelectorComponent from "@4ait/elements/PaginationPageSelectorComponent";

export default {
  components: {
    PaginationPageSelectorComponent
  },
  methods: {
  }
};
</script>