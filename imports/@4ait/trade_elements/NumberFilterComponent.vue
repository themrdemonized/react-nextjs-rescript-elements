<template>
  <number-filter-component style="width: 380px" class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </number-filter-component>
</template>

<script>
import NumberFilterComponent from "@4ait/elements/NumberFilterComponent"
import "./src/styles/templates/number-filter.scss"
import "./src/styles/templates/text-field.scss"
import "./src/styles/templates/SegmentedTabs.scss"
import "./src/styles/templates/checkbox.scss"



export default  {
  components: {
    NumberFilterComponent
  }
}
</script>