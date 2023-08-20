<template>
  <segmented-tabs-component class="foura__trade_elements__elements_palette">
    <template v-for="(_, name) in $slots" v-slot:[name]="slotData">
      <slot :name="name" v-bind="slotData" />
    </template>
  </segmented-tabs-component>
</template>

<script>
import {Options, Vue} from "vue-class-component"
import SegmentedTabsComponent from "@4ait/elements/SegmentedTabsComponent"
import "./src/styles/templates/SegmentedTabs.scss"

const Component = Options;
@Component({
  props: {  },
  components: {
    SegmentedTabsComponent
  }
})

export default class SegmentedTabs extends Vue {
}
</script>
