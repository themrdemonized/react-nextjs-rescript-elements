<style  module lang="scss">
  @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

  .page-selector{
    width: 276px;
    height: 140px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04), 0 2px 24px rgba(0, 0, 0, 0.08);
    border-radius: 16px;
    padding: 12px;
    gap: 12px;
    display: flex;
    flex-direction: column;
    background-color: var(--trade-style-palette_light_background_primary);
  }
  .search-input{
    display: flex;

    flex-direction: row;
    width: 252px;
    height: 52px;
    gap: 8px;
  }
  .input{
    border: 1px solid rgba(120, 120, 128, 0.16);
    border-radius: 8px;
    font-size: 16px;
    line-height: 24px;
    color: rgba(47, 48, 64, 0.6);
    font-family: 'Roboto',serif;
  }
  .button-search{
    width: 52px;
    height: 52px;
    padding: 18px;
    gap: 4px;
    border-radius: 12px;
    align-items: center;
    background: var(--trade-style-palette_tint_green_40);
    outline: none;
    border: none;
    color: #FFFFFF;
    cursor: pointer;

    &:hover{
      background: #6BC624;
    }
    &:active{
      background: #26735E;
    }
  }
  .input-selector{
    height: 52px;
    width: 252px;
  }

  .back
  {
    position: fixed;
    width: 100vw;
    height: 100vh;
    top: 0;
    left: 0;
    //backdrop-filter: saturate(0.3) brightness(0.97) opacity(1);
    //transition: backdrop-filter 0.6s cubic-bezier(0.52, 0.16, 0.24, 1);
  }
</style>

<template>
  <div>
    <overlay :enabled="enabled">
      <div :class="$style.back" @click="$emit('update:enabled', false)"></div>
      <attach :attach-to="attachTo"
              :attach-x="attachX"
              :anchor-x="anchorX"
              :offset-y="offsetY">
        <div :class="[$style['page-selector']]">
          <div :class="[$style['search-input']]">
           <text-field-component v-model.number="page"
                                 type="number"
                                 :autoselect="true"
                                 :class="[$style['search-input']]"

                                 @keyup.enter="onSetCurrentPage()">
              Перейти на страницу
           </text-field-component>
            <button type="button"
                    :class="[$style['button-search']]"
                    @click="onSetCurrentPage()">
              <icon-return-left/>
            </button>
          </div>
          <combobox-component v-model="currentTotalElements"
                              :enabledAddButton="true"
                              :displayTextFunc="(item) => item.text"
                              :getIdItemFunc="(item) => item.id"
                              :class="[$style['input-selector']]"
                              :items="items"

                              @add-item="addItem"
                              @select-item="onTotalElements"
                              >
            <template #caption>Строк на странице</template>
          </combobox-component>
        </div>
      </attach>
    </overlay>
  </div>
</template>

<script>
  import {Options, Vue} from "vue-class-component"

  import TextFieldComponent from "@4ait/trade_elements/TextFieldComponent";
  import ComboboxComponent from "@4ait/trade_elements/ComboboxComponent";
  import Overlay from "@4ait/overlay/Overlay"
  import Attach from  "@4ait/attach/Attach"
  import IconReturnLeft from "@4ait/icons_system/icons/IconReturnLeft"

  const Component = Options;
  @Component({
    props: {
      enabled: {
        type: Boolean,
        default: false
      },
      attachX: {
        type: [String, Number],
        default: "left"
      },
      anchorX: {
        type: [String, Number],
        default: "left"
      },
      offsetY: {
        type: Number,
        default: 0
      },
      attachTo: {
        type: Object,
        default: null
      },
      totalPages: {
        type: Number,
      },
      totalElements: {
        type: Number,
        default: 20
      },
    },
    components: {
      TextFieldComponent,
      Overlay,
      Attach,
      ComboboxComponent,
      IconReturnLeft
    },
    watch: {
      totalElements(newVal) {
        if (this.isValueIsValidTotalElements(this.totalElements)) {
          this.currentTotalElements = {
            data: newVal,
            text: newVal
          }
        } else {
          this.currentTotalElements = {
            data: 20,
            text: 20
          }
        }
      }
    },
    computed: {},
    emits:['update:totalElements', 'page', 'update:enabled'],
    data () {
      return {
        currentTotalElements: null,
        page:  null,
          items: [
            {
              id: 1,
              text: 50,
            },
            {
              id:2,
              text: 75,
            },
            {
              id: 3,
              text: 100,
            }
          ]
      }
    },
    methods: {
      onSetCurrentPage() {
        if(this.page > 0 && this.page <= this.totalPages) {
          this.$emit('page', this.pages = this.page);
        } else if (this.page < 0) {
          this.$emit('page', this.pages = 1);
        }else if (this.page > this.totalPages) {
          this.$emit('page', this.pages = this.totalPages)
        }
      },
      onTotalElements() {
        this.$emit('update:totalElements', this.currentTotalElements.text)
      },
      onUpdateOverlayEnabled(value) {
        this.$emit('update:enabled', value)
      },
      isValueIsValidTotalElements(value) {
          return (!Number.isNaN(Number.parseInt(value)) && value > 0)
      },
      addItem (text) {
        let item = { data:  text, text: text};
        this.items.push(item);
      }
    },
    beforeMount() {
        if (this.isValueIsValidTotalElements(this.totalElements)) {
          this.currentTotalElements = {
            data: this.totalElements,
            text: this.totalElements
          }
        } else {
          this.currentTotalElements = {
            data: 20,
            text: 20
          }
        }
    }
  })export default class PaginationPageSelectorComponent extends Vue{
  }
</script>