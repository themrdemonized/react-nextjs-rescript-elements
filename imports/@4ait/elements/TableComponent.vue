<style module lang="scss">
    .table-wrapper
    {
      display: grid;
      isolation: isolate; //create new context for z-index property
      box-sizing: border-box;
      position: relative;
    }

    .header
    {
      border-bottom: 1px solid var(--4ait-elements--table--header-border-bottom-divider);
      background-color: var(--4ait-elements--table--header-background);
      position: -webkit-sticky; /* Safari */
      position: sticky;
      top: 0;
      z-index: 3;

      &.checkbox_background {
        z-index: 4;
      }
    }

    .header_cell
    {
      padding: 12px 0 12px 20px;
    }

    .header_cell_sticky
    {
      z-index: 4;
      position: -webkit-sticky; /* Safari */
      position: sticky;
    }

    .checkbox
    {
      padding: 10px 0 10px 10px;
    }

    .checkbox_background
    {
      position: -webkit-sticky; /* Safari */
      position: sticky;
      background: var(--4ait-elements--table--cell-background);
      left: 0;
      z-index: 2;
    }

    .cell_background
    {
      background: var(--4ait-elements--table--cell-background);
      position: relative;
    }

    .cell_background-row_hovered
    {
      width: 100%;
      height: 100%;
      background: var(--4ait-elements--table--row-hover-background);
    }

    .cell_background-row_checked
    {
      width: 100%;
      height: 100%;
      background: var(--4ait-elements--table--row-checked-default);
    }

    .cell_background-row_checked_hovered
    {
      width: 100%;
      height: 100%;
      background: var(--4ait-elements--table--row-checked-hovered);
    }

    .cell
    {
      padding: 10px 20px 10px 20px;
    }

    .cell-sticky
    {
      position: -webkit-sticky; /* Safari */
      position: sticky;
      left: 0;
      right: 0;
      z-index: 2;
    }

    .cell-sticky-anchor
    {
      position: absolute;
      width: 20px;
      height: 1px;
      top: 0;
    }

    .cell-hider
    {

    }

    .cell-sticky-shadow_left
    {
      z-index: 1;
      background: linear-gradient(-90deg, rgba(0, 0, 0, 0.04) 0%, rgba(0, 0, 0, 0.0152) 53.65%, rgba(0, 0, 0, 0) 100%);
      width: 12px;
      height: 100%;
      position: absolute;
      top: 0;
      left: -12px;
      border-right: 1px solid var(--4ait-elements--table--cell-shadow-border);
    }

    .cell-sticky-shadow_right
    {
      z-index: 1;
      background: linear-gradient(90deg, rgba(0, 0, 0, 0.04) 0%, rgba(0, 0, 0, 0.0152) 53.65%, rgba(0, 0, 0, 0) 100%);
      width: 12px;
      transform: translateX(12px);
      height: 100%;
      position: absolute;
      top: 0;
      right: 0;
      border-left: 1px solid var(--4ait-elements--table--cell-shadow-border);
    }

    .without-overflow_hidden
    {
      overflow: visible;
    }

    .checkbox-anchor {
      position: absolute;
      width: 1px;
      height: 1px;
      top: 0;
      left: -1px;
    }

    .table-shadow-enter-active {
      transition: all 0.3s ease-out;
    }
    .table-shadow-leave-active {
      transition: all 0.3s ease-out;
    }
    .table-shadow-enter-from,
    .table-shadow-leave-to {
      opacity: 0;
    }
</style>

<template>
    <div>
      <div v-if="countColumns < 1">
        <slot name="emptyHeader" >Invalid columns: {{countColumns}}</slot>
      </div>
      <div :class="{
              [$style['table-wrapper']]: true,
            }"
           :style="gridComputedStyle"
           v-else
           ref="tableWrapper"
           @mouseleave="setHoveredRow(0)"
      >
        <div
            v-if="withCheckbox"
            :class="{
                      [$style['checkbox_background']]: true,
                      [$style['header']]: true
                    }"
        >
          <div
              :class="{
                      [$style['checkbox-anchor']]: true
                    }"
              ref="checkboxAnchor"
          ></div>
          <div :class="{
                          [$style['checkbox']]: true
                       }">
            <checkbox-component type="S" v-model="headerCheckboxValue" :mode="'parted'"/>
            <Transition
                :enter-active-class="$style['table-shadow-enter-active']"
                :leave-active-class="$style['table-shadow-leave-active']"
                :enter-from-class="$style['table-shadow-enter-from']"
                :leave-to-class="$style['table-shadow-leave-to']"
            >
              <div
                  :class="{
                      [$style['cell-sticky-shadow_right']]: stickyColumnsShadows.left === 'checkbox'
                  }"
                  v-if="stickyColumnsShadows.left === 'checkbox'"
              ></div>
            </Transition>
          </div>
        </div>
        <template v-for="(cell, index) in countColumns" :key="index">
          <template v-if="!isHeaderCellConsumed['column_'+cell]">
            <div :class="{
                  [$style['header_cell_sticky']]: isColumnSticky['column_'+cell],
                  [$style['header']]: true
                }"
                 :style="headerCellsStyles['column_'+cell]"
                 @click="onHeaderIconClick(cell)">
              <Transition
                  :enter-active-class="$style['table-shadow-enter-active']"
                  :leave-active-class="$style['table-shadow-leave-active']"
                  :enter-from-class="$style['table-shadow-enter-from']"
                  :leave-to-class="$style['table-shadow-leave-to']"
              >
                <div
                    :class="{
                      [$style['cell-sticky-shadow_left']]: stickyColumnsShadows.right === 'column_'+cell
                  }"
                    v-if="isColumnSticky['column_'+cell] && stickyColumnsShadows.right === 'column_'+cell"
                ></div>
              </Transition>
              <slot :name="'outer_header_cell_'+cell">
                <div :class="{
                      [$style['header_cell']]: true
                    }">
                  <slot :name="'header_cell_'+cell"></slot>
                </div>
              </slot>
              <Transition
                  :enter-active-class="$style['table-shadow-enter-active']"
                  :leave-active-class="$style['table-shadow-leave-active']"
                  :enter-from-class="$style['table-shadow-enter-from']"
                  :leave-to-class="$style['table-shadow-leave-to']"
              >
                <div
                    :class="{
                      [$style['cell-sticky-shadow_right']]: leftStickyHeaderShadows === 'column_'+cell
                  }"
                    v-if="isColumnSticky['column_'+cell] && leftStickyHeaderShadows === 'column_'+cell"
                ></div>
              </Transition>
            </div>
          </template>
        </template>
        <template v-if="countRows < 1">
          <div style="grid-column: 1 / -1">
            <slot name="emptyBody" >Invalid rows: {{countRows}}</slot>
          </div>
        </template>
        <template v-else>
          <template v-for="row in countRows" :key="row">
            <div v-if="withCheckbox"
                 :class="{
                      [$style['checkbox_background']]: true
                    }"
            >
              <div :class="{
                  [$style['cell_background-row_hovered']]: currentHoveredRow === row,
                  [$style['cell_background-row_checked']]: withCheckbox && currentCheckedRows[row-1],
                  [$style['cell_background-row_checked_hovered']]: withCheckbox && currentCheckedRows[row-1] && currentHoveredRow === row
               }">
                <div :class="{
                      [$style['checkbox']]: true
                   }"
                     @mouseenter="setHoveredRow(row)"
                >
                  <checkbox-component type="S" v-model="currentCheckedRows[row-1]"/>
                  <Transition
                      :enter-active-class="$style['table-shadow-enter-active']"
                      :leave-active-class="$style['table-shadow-leave-active']"
                      :enter-from-class="$style['table-shadow-enter-from']"
                      :leave-to-class="$style['table-shadow-leave-to']"
                  >
                    <div :class="{[$style['cell-sticky-shadow_right']]: stickyColumnsShadows.left === 'checkbox'}"
                         v-if="stickyColumnsShadows.left === 'checkbox'"
                    ></div>
                  </Transition>

                </div>
              </div>
            </div>

            <template v-for="cell in countColumns" :key="cell">
              <div :class="{
                  [$style['cell_background']]: true,
                  [$style['without-overflow_hidden']]: disableOverflowHidden['column_'+cell],
                  [$style['cell-sticky']]: isColumnSticky['column_'+cell]
               }"
                   :style="stickyOffsets['column_'+cell]"
                   @mouseenter="setHoveredRow(row)"
                   :ref="el => {
                   if (row === 1)
                     {
                        columnsRef['column_'+cell] = el;
                        columnsMap.set(el, 'column_'+cell);
                     }
                 }">
                <div
                    v-if="isColumnSticky['column_'+cell] && row === 1"
                    :class="{
                              [$style['cell-sticky-anchor']]: true
                            }"

                    :style="leftAnchorsOffsets['column_'+cell]"
                ></div>
                <div :class="{
                  [$style['cell_background-row_hovered']]: currentHoveredRow === row,
                  [$style['cell_background-row_checked']]: withCheckbox && currentCheckedRows[row-1],
                  [$style['cell_background-row_checked_hovered']]: withCheckbox && currentCheckedRows[row-1] && currentHoveredRow === row
               }">
                  <Transition
                      :enter-active-class="$style['table-shadow-enter-active']"
                      :leave-active-class="$style['table-shadow-leave-active']"
                      :enter-from-class="$style['table-shadow-enter-from']"
                      :leave-to-class="$style['table-shadow-leave-to']"
                  >
                    <div
                        :class="{
                                  [$style['cell-sticky-shadow_left']]: stickyColumnsShadows.right === 'column_'+cell
                                }"
                        v-if="isColumnSticky['column_'+cell] && stickyColumnsShadows.right === 'column_'+cell"
                    ></div>
                  </Transition>
                  <slot :name="'outer_row_'+row+'_cell_'+cell">
                    <div :class="{
                                    [$style['cell']]: true,
                                    [$style['cell-sticked']]: true
                                  }">
                      <slot :name="'row_'+row+'_cell_'+cell"></slot>
                    </div>
                  </slot>
                  <Transition
                      :enter-active-class="$style['table-shadow-enter-active']"
                      :leave-active-class="$style['table-shadow-leave-active']"
                      :enter-from-class="$style['table-shadow-enter-from']"
                      :leave-to-class="$style['table-shadow-leave-to']"
                  >
                  <div
                        :class="{
                                  [$style['cell-sticky-shadow_right']]: stickyColumnsShadows.left === 'column_'+cell
                                }"
                        v-if="isColumnSticky['column_'+cell] && stickyColumnsShadows.left === 'column_'+cell"
                    ></div>
                  </Transition>
                </div>
              </div>
            </template>
          </template>
        </template>
      </div>
    </div>
</template>

<script setup>
//imports
import {computed, onMounted, onUnmounted, ref, watch, nextTick, toRef, readonly, watchEffect} from "vue";
import CheckboxComponent from "@4ait/elements/CheckboxComponent";

//defines
const props = defineProps({
  countRows: {
    type: Number,
    default: 1
  },
  countColumns: {
    type: Number,
    default: 1
  },
  withCheckbox: {
    type: Boolean,
    default: false
  },
  horizontalDividerRow: {
    type: Boolean,
    default: false
  },
  columnsSizes: {
    type: [Array, Object],
    default: []
  },
  rowSize: {
    type: String,
    default: '40px'
  },
  forceUseHiders: {
    type: Boolean,
    default: false
  },
  checkedRows: {
    type: Array,
    default: []
  },
  forceDisableHiders: {
    type: Boolean,
    default: false
  },
  disableOverflowHidden: {
    type: Object,
    default: {}
  },
  columnsSticky: {
    type: [String, Number, Array],
    default: null
  },
  columnsExpand: {
    type: Object,
    default: {}
  }
});
const emit = defineEmits(['headerIconClickCell', 'updateCheckedRows', 'update:checkedRows']);

//variables
const refCheckedRows = toRef(props, "checkedRows");
const cellHiders = ref({});
const gridTemplatePattern = '(^\\d{1,}\\.?\\d*$)|(^auto$)|(^\\d{1,}\\.?\\d*%$)|(^\\d{1,}\\.?\\d*(px|fr|em|rem|vh|vw|vmim|vmax)$)';
const columnsWidth = ref({});
const columnsResizeObserver = ref(null);
const stickyColumnsIntersectionObserver = ref(null);
const leftStackedColumns = ref([])
const rightStackedColumns = ref([])
const currentHoveredRow = ref(0);
const columnsMap = ref(new Map);
const checkboxIntersectionObserver = ref(null);
const isCheckboxStuck = ref(false)
const refColumnsExpand = readonly(toRef(props, 'columnsExpand'));
const refColumnsSticky = readonly(toRef(props, 'columnsSticky'));
const refCountRows = readonly(toRef(props, 'countRows'));
const refCountColumns = readonly(toRef(props, 'countColumns'));
const refWithCheckbox = readonly(toRef(props, 'withCheckbox'));

//elements
const tableWrapper = ref(null);
const columnsRef = ref({});
const checkboxAnchor = ref(null);

//computed
const headerComputedStyle = computed(() => {
  let generic = {}
  let templateColumnsValue = '';
  if (props.columnsSizes.length === 0) {
    templateColumnsValue = "repeat("+props.countColumns+", minmax(150px, 1fr))";
  } else {
    let isWarn = false;
    for (let i = 0; i < props.countColumns; i++) {
      if (!(props.columnsSizes[i] == null || props.columnsSizes[i].length === 0)) {
        const result = isValidGridTemplateSize(props.columnsSizes[i]);
        if (result) {
          if (!isNaN(result)) {
            templateColumnsValue = templateColumnsValue + props.columnsSizes[i] + 'px ';
          } else {
            templateColumnsValue = templateColumnsValue + result + " ";
          }
        } else {
          isWarn = true;
          templateColumnsValue = templateColumnsValue + '1fr ';
        }
      } else {
        templateColumnsValue = templateColumnsValue + '1fr ';
      }
    }
    if (isWarn)
    {
      console.warn("An error occurred during parsing columns sizes. Ensure that all data is correct");
    }
  }
  generic['grid-template-columns'] = '';
  if (props.withCheckbox) {
    generic['grid-template-columns'] = '40px ';
  }
  generic['grid-template-columns'] = generic['grid-template-columns'] + templateColumnsValue;

  return generic;
});
const bodyComputedStyle = computed(() => {
  let generic = {}
  let finalRowsSize = "";

  if(isValidGridTemplateSize(props.rowSize))
  {
    finalRowsSize = isValidGridTemplateSize(props.rowSize);
    if (!isNaN(finalRowsSize))
    {
      finalRowsSize = finalRowsSize + "px";
    }
  }

  let templateRowsValue = "";
  if (finalRowsSize === 'auto')
  {
    templateRowsValue = finalRowsSize;
  } else {
    templateRowsValue = "repeat("+props.countRows+", "+templateRowsValue+")"
  }
  generic['grid-template-rows'] = "";
  generic['grid-template-rows'] = generic['grid-template-rows'] + templateRowsValue;
  return generic;
});
const gridComputedStyle = computed(() => {
  return {
    'grid-template-columns': headerComputedStyle.value['grid-template-columns'],
    'grid-template-rows': bodyComputedStyle.value['grid-template-rows']
  }
});
const stickyOffsets = computed(() => {
  const result = {};
  for (const stickyColumn in isColumnSticky.value) {
    const currentNumber = Number.parseInt(stickyColumn.slice(7))
    const body = {
      left: 0,
      right: 0
    }
    for (const entry in isColumnSticky.value) {
      const columnNumber = Number.parseInt(entry.slice(7))
      const width = columnsWidth.value[entry]
      if (columnNumber < currentNumber)
      {
        body.left += width;
      } else if (columnNumber > currentNumber)
      {
        body.right += width;
      }
    }
    if (props.withCheckbox) body.left += 40
    body.left += 'px';
    body.right += 'px'
    result[stickyColumn] = body;
  }
  return result;
})
const stickyHeadersOffsets = computed(() => {
  const result = {};
  for (const entry in stickyOffsets.value)
  {
    const columnNumber = Number.parseInt(entry.slice(7))
    result[entry] = {}
    result[entry].left = stickyOffsets.value[entry].left
    let rightOffset = Number.parseFloat(stickyOffsets.value[entry].right.slice(0, stickyOffsets.value[entry].right.length-2))
    additionalStickyColumns.value.forEach((value, key) => {
      if (value === entry)
      {
        const currentNumber = Number.parseInt(key.slice(7))
        if (currentNumber > columnNumber)
        {
          const width = columnsWidth.value[key]
          rightOffset -= width
        }
      }

    })

    result[entry].right = rightOffset+'px'
  }
  return result
})
const leftAnchorsOffsets = computed(() => {
  const result = {};
  for (const entry in stickyColumnsRefs.value) {
    const stickyNumber = Number.parseInt(entry.slice(7))
    const body = {
      left: -10
    }
    for (let j = 1; j <= props.countColumns; j++)
    {
      const columnWidth = columnsWidth.value['column_'+j];
      if (j < stickyNumber) {
        body.left -= columnWidth;
      }
    }
    if (props.withCheckbox)  body.left -= 40
    body.left += 'px'
    result[entry] = body;
  }
  return result;
})
const stickyColumnsRefs = computed(() => {
  const result = {};
  for (const entry in isColumnSticky.value) {
    if (result.hasOwnProperty(entry)) continue;
    result[entry] = columnsRef.value[entry]
  }
  return result;
})
const additionalStickyColumns = computed(() => {
  const result = new Map;
  for (const entry in refColumnsExpand.value)
  {
    const consumedColumnsCount = refColumnsExpand.value[entry]
    const expandedColumnNumber = Number.parseInt(entry.slice(7));
    if (Number.isNaN(expandedColumnNumber) ||  expandedColumnNumber < 1) continue
    for (let i = 1; i < consumedColumnsCount; i++) {
      const additionalStickyColumnNumber = expandedColumnNumber+i
      result.set('column_'+additionalStickyColumnNumber,'column_'+expandedColumnNumber)
    }
  }
  return result
})
const stickyColumnsShadows = computed(() => {
  const result = {
    left: null,
    right: null
  };
  let temp;
  if (leftStackedColumns.value.length > 1)
  {
    temp = Number.parseInt(leftStackedColumns.value[0].slice(7));
    result.left = leftStackedColumns.value[0]
    for (let i = 1; i < leftStackedColumns.value.length; i++)
    {
      const currCol = Number.parseInt(leftStackedColumns.value[i].slice(7));
      if (currCol > temp)
      {
        temp = currCol;
        result.left = leftStackedColumns.value[i]
      }
    }
  } else if (leftStackedColumns.value.length === 1)
  {
    result.left = leftStackedColumns.value[0]
  }

  if (result.left === null && isCheckboxStuck.value) {
    result.left = 'checkbox'
  }

  if (rightStackedColumns.value.length > 1)
  {
    temp = Number.parseInt(rightStackedColumns.value[0].slice(7));
    result.right = rightStackedColumns.value[0]
    for (let i = 1; i < rightStackedColumns.value.length; i++)
    {
      const currCol = Number.parseInt(rightStackedColumns.value[i].slice(7));
      if (currCol < temp)
      {
        temp = currCol;
        result.right = rightStackedColumns.value[i]
      }
    }
  } else if (rightStackedColumns.value.length === 1)
  {
    result.right = rightStackedColumns.value[0]
  }
  return result;
})
const leftStickyHeaderShadows = computed(() => {
  if (additionalStickyColumns.value.has(stickyColumnsShadows.value.left)) return additionalStickyColumns.value.get(stickyColumnsShadows.value.left)
  else return stickyColumnsShadows.value.left
})
const isHeaderCellConsumed = computed(() => {
  const result = {}
  for (const entry in refColumnsExpand.value)
  {
    const consumedColumnsCount = refColumnsExpand.value[entry]
    const expandedColumnNumber = Number.parseInt(entry.slice(7));
    if (Number.isNaN(expandedColumnNumber) ||  expandedColumnNumber < 1) continue
    for (let i = 1; i < consumedColumnsCount; i++) result['column_'+(expandedColumnNumber+i)] = true
  }
  return result
})
const expandedColumnsStyle = computed(() => {
  const result = {}
  for (const entry in refColumnsExpand.value)
  {
    if (result.hasOwnProperty(entry)) continue;
    const columnNumber = refWithCheckbox.value ?  Number.parseInt(entry.slice(7))+1 :  Number.parseInt(entry.slice(7))
    if (Number.isNaN(columnNumber) || columnNumber < 1) continue;
    result[entry] = {
      'grid-column': columnNumber + ' / ' + (columnNumber+refColumnsExpand.value[entry])
    }
  }
  return result
})
const currentCheckedRows = computed({
  get() {
    return refCheckedRows.value
  },
  set(value) {
    for (let i = 0; i < refCountColumns.value; i++)
    {
      if ((typeof value[i]) !== 'boolean') value[i] = false
    }
    emit('updateCheckedRows', value);
    emit('update:checkedRows', value);
  }
})
const headerCellsStyles = computed(() => {
  const result = {};
  for (const entry in stickyHeadersOffsets.value) {
    if (expandedColumnsStyle.value.hasOwnProperty(entry))
    {
      result[entry] = {...stickyHeadersOffsets.value[entry], ...expandedColumnsStyle.value[entry]}
    } else {
      result[entry] = stickyHeadersOffsets.value[entry];
    }
  }
  for (const entry in expandedColumnsStyle.value) {
    if (result.hasOwnProperty(entry)) continue
    else {
      result[entry] = expandedColumnsStyle.value[entry]
    }
  }
  return result
})
const isColumnSticky = computed(() => {
  const result = {};
  if (refCountRows.value  < 1) return result
  if (Array.isArray(refColumnsSticky.value))
  {
    for (const entry of refColumnsSticky.value)
    {
      const stickyColumn = Number.parseInt(entry);
      if (Number.isNaN(stickyColumn) || stickyColumn < 1 || stickyColumn > refCountColumns.value) continue;
      const key = 'column_'+stickyColumn
      if (result.hasOwnProperty(key)) continue;
      if (refColumnsExpand.value.hasOwnProperty(key)) {
        const consumedColumnsCount = refColumnsExpand.value[key]
        for (let i = 1; i < consumedColumnsCount; i++) result['column_'+(stickyColumn+i)] = true
      }
      result[key] = true
    }
  } else {
    const stickyColumn = Number.parseInt(refColumnsSticky.value);
    if (Number.isNaN(stickyColumn) || stickyColumn < 1 || stickyColumn > refCountColumns.value) return result
    const key = 'column_'+stickyColumn
    if (refColumnsExpand.value.hasOwnProperty(key)) {
      const consumedColumnsCount = refColumnsExpand.value[key]
      for (let i = 1; i < consumedColumnsCount; i++) result['column_'+(stickyColumn+i)] = true
    }
    result[key] = true
  }
  return result
})
const headerCheckboxValue = computed({
  get() {
    let result = currentCheckedRows.value[0];
    if (result === undefined) result = false;
    for (let i = 1; i < refCountRows.value; i++)
    {
      if (currentCheckedRows.value[i] === undefined && !result) continue;
      if (currentCheckedRows.value[i] === undefined && result) return 'parted';
      if (result === currentCheckedRows.value[i]) continue;
      else return 'parted'
    }
    return result
  },
  set(value) {
    const array = []
    for (let i = 0; i < refCountRows.value; i++)
    {
      array.push(value)
    }
    currentCheckedRows.value = array
  }
})

//watchers

watch(() => {
  return stickyColumnsRefs.value
}, () => {
  initIntersectionObserver()
})
watch(() => {
  return props.withCheckbox
}, (newVal) => {
  if (newVal)
  {
    initCheckboxIntersectionObserver();
  } else {
    if (checkboxIntersectionObserver.value != null) {
      checkboxIntersectionObserver.value.disconnect();
      checkboxIntersectionObserver.value = null;
    }
  }
})
watch(refCountRows, (newVal, oldVal) => {
  if (newVal < 1)
  {
    if (columnsResizeObserver.value != null)
    {
      columnsResizeObserver.value.disconnect()
      columnsResizeObserver.value = null
    }
    if (stickyColumnsIntersectionObserver.value != null)
    {
      stickyColumnsIntersectionObserver.value.disconnect();
      stickyColumnsIntersectionObserver.value = null
    }
  } else if (oldVal < 1 && newVal > 0) {
    initIntersectionObserver()
    initResizeObserver()
  }
})
watch(refCountColumns, (newVal) => {
  if (newVal < 1)
  {
    if (columnsResizeObserver.value != null)
    {
      columnsResizeObserver.value.disconnect()
      columnsResizeObserver.value = null
    }
    if (stickyColumnsIntersectionObserver.value != null)
    {
      stickyColumnsIntersectionObserver.value.disconnect();
      stickyColumnsIntersectionObserver.value = null
    }
  } else if (newVal > 0) {
    initIntersectionObserver()
    initResizeObserver()
  }
})

//methods
function onHeaderIconClick(columnNumber) {
  emit('headerIconClickCell', columnNumber);
}
function isValidGridTemplateSize(value) {
  const str = value.toString();
  const matchResult = str.match(gridTemplatePattern);
  if (matchResult !== null) return matchResult[0];
  else return false;
}
async function initIntersectionObserver() {
  if (stickyColumnsIntersectionObserver.value != null)
  {
    stickyColumnsIntersectionObserver.value.disconnect();
    stickyColumnsIntersectionObserver.value = null;
  }
  const options = {
    root: tableWrapper.value,
    threshold: [0, 0.5, 1]
  }
  stickyColumnsIntersectionObserver.value = new IntersectionObserver((entries) => {
    for (let entry of entries)
    {
      const key = columnsMap.value.get(entry.target.parentNode)
      if (entry.intersectionRatio === 0)
      {
        rightStackedColumns.value.push(key);
      } else if (entry.intersectionRatio === 1)
      {
        leftStackedColumns.value.push(key)
      } else {
        rightStackedColumns.value = rightStackedColumns.value.filter(el => el !== key)
        leftStackedColumns.value = leftStackedColumns.value.filter(el => el !== key)
      }
    }
  }, options)
  await nextTick(); //await for anchor will be rendered
  for (const entry in stickyColumnsRefs.value) {
    const anchor = stickyColumnsRefs.value[entry].children[0];
    stickyColumnsIntersectionObserver.value.observe(anchor)
  }
}
function stuckAtLeft(columnNumber) {
  let result = false;
  for (let i = 0; i < leftStackedColumns.value.length; i++)
  {
    const number = Number.parseInt(leftStackedColumns.value[i].slice(7))
    result = result || number === columnNumber
  }
  return result
}
function stuckAtRight(columnNumber) {
  let result = false;
  for (let i = 0; i < rightStackedColumns.value.length; i++)
  {
    const number = Number.parseInt(leftStackedColumns.value[i].slice(7))
    result = result || number === columnNumber
  }
  return result
}
async function initCheckboxIntersectionObserver() {
  if (checkboxIntersectionObserver.value === null && props.withCheckbox)
  {
    const options = {
      root: tableWrapper.value,
      threshold: [0, 0.5, 1]
    }
    checkboxIntersectionObserver.value = new IntersectionObserver((entries) => {
      for (let entry of entries)
      {
        isCheckboxStuck.value = entry.intersectionRatio === 1;
      }
    }, options)
    await nextTick();
    checkboxIntersectionObserver.value.observe(checkboxAnchor.value)
  }
}

const columnsResizeObserverEntries = ref(null);

async function initResizeObserver() {
  if (columnsResizeObserver.value != null)
  {
    columnsResizeObserver.value.disconnect()
    columnsResizeObserver.value = null;
  }
  columnsResizeObserver.value = new ResizeObserver((entries) => {
    columnsResizeObserverEntries.value = entries;
  });
  await nextTick();
  for (const entry in columnsRef.value)
  {
    const column = columnsRef.value[entry]
    columnsResizeObserver.value.observe(column)
  }
}

watchEffect(() => {
  if(columnsResizeObserverEntries.value)
  {
    const entries = columnsResizeObserverEntries.value;
    columnsResizeObserverEntries.value = null;

    for (const entry of entries) {
      const key = columnsMap.value.get(entry.target);
      columnsWidth.value[key] = entry.borderBoxSize[0].inlineSize;
    }
  }
});

function setHoveredRow(row) {
  if (currentHoveredRow.value !== row) {
    currentHoveredRow.value = row
  }
}

//lifeCycle hooks
onMounted(() => {
  initResizeObserver()
  initIntersectionObserver()
  initCheckboxIntersectionObserver()
})
onUnmounted(() => {
  if (columnsResizeObserver.value != null)
  {
    columnsResizeObserver.value.disconnect()
  }
  if (stickyColumnsIntersectionObserver.value != null)
  {
    stickyColumnsIntersectionObserver.value.disconnect();
  }
  if (checkboxIntersectionObserver.value != null) {
    checkboxIntersectionObserver.value.disconnect();
  }
});
</script>