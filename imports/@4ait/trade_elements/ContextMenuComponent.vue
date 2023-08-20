<template>
  <context-menu-component class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </context-menu-component>
</template>

<script>
import ContextMenuComponent from "@4ait/elements/ContextMenuComponent"
import "./src/styles/templates/context-menu.scss"


export default {
  components: {
    ContextMenuComponent
  }
}
</script>
