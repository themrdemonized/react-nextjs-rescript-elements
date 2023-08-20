<template>
  <pagination-component
      class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </pagination-component>
</template>

<script>
import PaginationComponent from "@4ait/elements/PaginationComponent"

export default {
  components: {
    PaginationComponent
  }
}
</script>