<template>
  <table-component class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </table-component>
</template>

<script>
import TableComponent from "@4ait/elements/TableComponent"
import "./src/styles/templates/table.scss";

export default {
  components: {
    TableComponent
  }
}
</script>
