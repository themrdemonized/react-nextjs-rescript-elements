<style module lang="scss">
  @import '~@4ait/scss_fonts_expansion/fonts_declare';

  .pagination {
    list-style-type: none;

    display: flex;

    padding: 0;
    height: 40px;

  }
  .pagination-item {
    display: inline-block;
    background: var(--trade-style-palette_light_background_primary);
    font-family: Roboto,serif;
    font-size: 14px;
  }
  .button-next-left{
    width: 32px;
    height: 38px;
    background-color: var(--trade-style-palette_light_background_primary);
    border: 1px solid #E1E1E5;
    border-right: none;
    outline: none;
    border-radius: 6px 0 0 6px;
    color: rgba(47, 48, 64, 0.6);
    transition: all .2s;
    cursor: pointer;

    &:hover{
      background-color: rgba(96, 99, 115, 0.08);
      color: var(--trade-style-palette_light_label_primary);
    }
    &:active{
      background: rgba(144, 209, 46, 0.12);
      color: var(--trade-style-palette_tint_green_50);
    }
    &.disable{
      color: rgba(47, 48, 64, 0.12);
      cursor: default;
      background: none;
    }
  }
  .button-next-right{
    width: 32px;
    height: 38px;
    background-color: var(--trade-style-palette_light_background_primary);
    border: 1px solid #E1E1E5;
    border-left: none;
    outline: none;
    border-radius: 0 6px 6px 0;
    color: rgba(47, 48, 64, 0.6);
    transition: all .2s;
    cursor: pointer;

    &:hover{
      background-color: rgba(96, 99, 115, 0.08);
      color: black;
    }
    &:active{
      background: rgba(144, 209, 46, 0.12);
      color: var(--trade-style-palette_tint_green_40);
    }
    &.disable{
      color: rgba(47, 48, 64, 0.12);
      cursor: default;
      background: none;
    }
  }
  .button-item{
    background-color: var(--trade-style-palette_light_background_primary);
    padding: 9px 12px;
    height: 38px;
    border: 1px solid #E1E1E5;
    border-right: none;
    border-left: none;
    outline: none;
    color: rgba(47, 48, 64, 0.6);
    font-size: 14px;
    transition: all .25s;
    cursor: pointer;

    &:hover{
      background-color: rgba(96, 99, 115, 0.08);
      color: black;
    }
    &.active {
      color: var(--trade-style-palette_tint_green_40);
      border-bottom: 2px solid var(--trade-style-palette_tint_green_40);
      border-radius: 1px;
      background-color: var(--trade-style-palette_light_background_primary);
      cursor: default;
    }
  }
  .modal-btn{
    background-color: var(--trade-style-palette_light_background_primary);
    padding: 9px 12px;
    height: 38px;
    border: 1px solid #E1E1E5;
    border-right: none;
    border-left: none;
    outline: none;
    color: rgba(47, 48, 64, 0.6);
    font-size: 14px;
    transition: all .25s;
    cursor: pointer;

    &:hover{
      background-color: rgba(96, 99, 115, 0.08);
      color: black;
    }
    &.active {
      background: rgba(144, 209, 46, 0.12);
      color: var(--trade-style-palette_tint_green_40);
    }
  }

</style>

<template>
  <div>
    <ul v-if="totalPages > 0"
        :class="{ [$style['pagination']]: true }">

      <li :class="{ [$style['pagination-item']]: true }">
        <button type="button"
                @click="onClickPreviousPage"
                :disabled="isInFirstPage"
                :class="{ [$style['disable']]: isInFirstPage,
                          [$style['button-next-left']]: true}"
        >
          <icon-chevron-compact-down style="transform: rotate(90deg)"/>
        </button>
      </li>

      <template v-if="isFirstElement">
        <li :class="{ [$style['pagination-item']]: true }">
          <button :class="{ [$style['button-item']]: true }"
                  type="button"
                  :disabled="isInFirstPage"
                  @click="onPageNumber(1)">
            1
          </button>
        </li>
      </template>

      <template v-if="isLeftDotsVisible">
        <li>
          <button :class="{ [$style['modal-btn']]: true,
                            [$style['active']]: openedTwo }"
                  type="button"
                  ref="btnT"
                  @click="openTwo">
            <pagination-page-selector-component v-model:enabled="openedTwo"
                                                :attach-to="attachElementTwo"
                                                attach-x="center"
                                                anchor-x="center"
                                                :offset-y="5"
                                                :totalPages="totalPages"

                                                @update:totalElements="onTotalElements"
                                                @page="onPageNumber"/>
            <icon-ellipsis-vertical style="transform: rotate(90deg)"/>
          </button>
        </li>
      </template>

      <!-- Visible Buttons Start -->

      <li :class="{ [$style['pagination-item']]: true }"
          v-for="page in pages"
          :key="page"
      >
       <button type="button"
               @click="onClickPage(page)"
                :disabled="page.isDisabled"
                :class="{ [$style['active']]: isPageActive(page),
                         [$style['button-item']]: true }"
        >
          {{ page }}
       </button>
      </li>

      <!-- Visible Buttons End -->

      <template v-if="isRightDotsVisible">
       <li :class="{ [$style['pagination-item']]: true }">
          <button :class="{ [$style['modal-btn']]: true,
                            [$style['active']]: opened }"
                  type="button"
                  ref="btnO"
                  @click="open">
            <pagination-page-selector-component v-model:enabled="opened"
                                                :attach-to="attachElement"
                                                attach-x="center"
                                                anchor-x="center"
                                                :offset-y="5"
                                                :totalPages="totalPages"

                                                @update:totalElements="onTotalElements"
                                                @page="onPageNumber"/>
           <icon-ellipsis-vertical style="transform: rotate(90deg)"/>
          </button>
        </li>

    </template>

    <template v-if="isLastElement">
      <li>
        <button :class="{ [$style['button-item']]: true }"
                type="button"
                :disabled="isInLastPage"
                @click="onPageNumber(totalPages)">
          {{ totalPages }}
        </button>
      </li>
    </template>

    <li :class="{ [$style['pagination-item']]: true }">
      <button type="button"
              @click="onClickNextPage"
              :disabled="isInLastPage"
              :class="{ [$style['disable']]: isInLastPage,
                        [$style['button-next-right']]: true}"
      >
        <icon-chevron-compact-down style="transform: rotate(-90deg)"/>
      </button>
    </li>

    </ul>
  </div>
</template>

<script>
  import IconChevronCompactDown from "@4ait/icons_system/icons/IconChevronCompactDown"
  import IconEllipsisVertical from "@4ait/icons_system/icons/IconEllipsisVertical"
  import PaginationPageSelectorComponent from "@4ait/trade_elements/PaginationPageSelectorComponent";
  import Overlay from "@4ait/overlay/Overlay"
  import Attach from  "@4ait/attach/Attach"

  import {Options, Vue} from "vue-class-component"

  const Component = Options;
  @Component({
    props: {
      maxVisibleButtons: {
        type: Number,
        required: false,
        default: 3
      },
      totalPages: {
        type: Number,
        required: true
      },
      currentPage: {
        type: Number,
        required: true
      }
    },
    emits: ['pageChanged', 'update:totalElements'],
    components: {
      IconChevronCompactDown,
      IconEllipsisVertical,
      PaginationPageSelectorComponent,
      Overlay,
      Attach
    },
    watch: {},
    computed: {
      startPage() {
        if (this.currentPage === 1) {
          return 1;
        }

        if (this.totalPages === 2) {
          if (this.currentPage === this.totalPages) {
            return this.totalPages - this.maxVisibleButtons + 2;
          }
        } else {
          if (this.currentPage === this.totalPages) {
            return this.totalPages - this.maxVisibleButtons + 1;
          }
        }

        return this.currentPage - 1;
      },
      endPage() {
        return Math.min(this.startPage + this.maxVisibleButtons - 1, this.totalPages)
      },
      pages() {
        const range = [];

        for (
            let i = this.startPage;
            i <= this.endPage;
            i++
        ) {
          range.push(i);
        }

        return range;
      },
      isInFirstPage() {
        return this.currentPage === 1;
      },
      isInLastPage() {
        return this.currentPage === this.totalPages;
      },
      isLeftDotsVisible () {
        if (this.totalPages > 4) {
          return this.currentPage > 3
        }
      },
      isRightDotsVisible () {
        if (this.totalPages > 4) {
          return (this.totalPages - this.currentPage) > 2
        }
      },
      isFirstElement () {
        if (this.totalPages > 3) {
          return this.currentPage > 2
        }
      },
      isLastElement () {
        if (this.totalPages > 3) {
          return (this.totalPages - this.currentPage) >= 2
        }
      }
    },
    methods: {
      isPageActive(page) {
        return this.currentPage === page;
      },
      onClickPreviousPage() {
        this.onPageNumber(this.currentPage - 1);
      },
      onClickPage(page) {
        this.onPageNumber(page);
      },
      onClickNextPage() {
        this.onPageNumber(this.currentPage + 1);
      },
      onPageNumber (pageNumber) {
        this.$emit("pageChanged", pageNumber)
      },
      onTotalElements (val) {
        this.$emit('update:totalElements', val)
      }
    }
  })export default class PaginationComponent extends Vue{
    opened = false;
    openedTwo = false;
    widthContextMenu = 276;
    attachElement = null;
    attachElementTwo = null;

    open()
    {
      let rect = this.$el.getBoundingClientRect();
      this.widthContextMenu = rect.width;
      this.attachElement = this.$refs.btnO;
      this.opened = true;
    }
    openTwo()
    {
      let rect = this.$el.getBoundingClientRect();
      this.widthContextMenu = rect.width;
      this.attachElementTwo = this.$refs.btnT;
      this.openedTwo = true;
    }
  }
</script>