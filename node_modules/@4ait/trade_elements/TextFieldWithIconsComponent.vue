<template>
  <TextFieldWithIconsOnTheSidesComponent class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </TextFieldWithIconsOnTheSidesComponent>
</template>

<script>
import TextFieldWithIconsOnTheSidesComponent from "@4ait/elements/TextFieldWithIconsComponent"
import "./src/styles/templates/text-field-with-icons.scss"


export default {
  components: {
    TextFieldWithIconsOnTheSidesComponent
  }
}
</script>
