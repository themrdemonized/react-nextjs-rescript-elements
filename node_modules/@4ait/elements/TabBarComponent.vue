<style module lang="scss">
    @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

    .root {
        height: 56px;
    }

    .tabs
    {
        height: 100%;
        position: relative;

        overflow-x: auto;
        overflow-y: hidden;

        padding: 0 32px;

        @include setFont(font-4ait-elements, text-m);
    }

    .tabs-container
    {
        display: flex;
        gap: 20px;
    }

    .tab {
        padding: 19px 0px 13px 0px;

        display: flex;
        align-items: center;
        gap: 4px;

        color: var(--4ait-elements--tab-bar--tab-default-text-color);
    }
    .hover-tab {
        cursor: pointer;

        &:active {
            color: var(--4ait-elements--tab-bar--tab-active-text-color);
        }

        &:hover {
            color: var(--4ait-elements--tab-bar--tab-hover-text-color);
        }
    }

    .disable-tab {
        color: var(--4ait-elements--tab-bar--tab-disable-text-color);
    }

    .active-tab {
        cursor: pointer;

        color: var(--4ait-elements--tab-bar--tab-active-text-color);
    }

    .content
    {
        user-select: none;
        white-space: nowrap;
    }

    .gradient-area {
        position: absolute;
        top: 0px;

        width: 32px;
        height: 100%;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-end;

        background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.7) 40.63%, #FFFFFF 100%);

        color: var(--4ait-elements--tab-bar--tab-default-text-color);
    }

    .left-gradient
    {
        left: 0px;
        transform: matrix(-1, 0, 0, 1, 0, 0);
    }

    .right-gradient
    {
        right: 0px;
    }

    .slider
    {
        position: absolute;
        bottom: 0;

        height: 2px;

        border-radius: 2px;

        transition: all 0.4s;
        transition-timing-function: cubic-bezier(0.44, 0.96, 0.5, 1);

        background: var(--4ait-elements--tab-bar--slider-color);
    }

    .horizontal-bottom-divider
    {
        bottom: 0;

        width: 100%;
        height: 0;

        border-bottom: 1px solid var(--4ait-elements--tab-bar--horizontal-bottom-divider);
    }

    .gradient_area_icon
    {
        margin-right: 4px;

        transform: rotate(-90deg);
    }
</style>
<template>
    <div
        :class="{
          [$style.root]: true
        }"
        ref="root"
    >
        <div style="position: relative;">
            <div
                :class="{
                [$style.tabs]: true
            }"
                ref="tabs"
            >
                <div style="position: relative; width: fit-content">
                    <div
                        ref="tabsContainer"
                        :class="$style['tabs-container']">
                        <div
                            :class="{
                            [$style.tab]: true,
                            [$style['active-tab']]: tab === componentActiveTab && !componentDisableTabs.includes(tab),
                            [$style['hover-tab']]: tab !== componentActiveTab && !componentDisableTabs.includes(tab),
                            [$style['disable-tab']]: componentDisableTabs.includes(tab)
                        }"
                            v-for="tab in countTabs"
                            :ref="'tab_' + tab"
                            @click="onTabClick(tab)"
                        >
                            <slot :name="'tab_left_icon_'+tab"></slot>
                            <div
                                :class="{
                        [$style.content]: true
                    }"
                            >
                                <slot :name="'tab_'+tab"></slot>
                            </div>
                            <slot :name="'tab_right_icon_'+tab"></slot>
                        </div>
                    </div>
                    <div
                        :class="{
                        [$style.slider]: true
                    }"
                        :style="{ transform: `translateX(${this.sliderLeftOffset}px)`, width: `${this.sliderWidth}px`  }"
                        ref="slider"
                    ></div>
                </div>
            </div>
            <div
                :class="{
                [$style['gradient-area']]: true,
                [$style['left-gradient']]: true
            }"
                ref="leftGradientArea"
            ></div>
            <div
                :class="{
                [$style['gradient-area']]: true,
                [$style['right-gradient']]: true
            }"
                ref="rightGradientArea"
            ></div>
        </div>
        <div
            :class="{
                [$style['horizontal-bottom-divider']] : true
            }"
            v-if="horizontalBottomDivider"
        ></div>
    </div>
</template>
<script>
import {Options, Vue} from "vue-class-component"
import IconChevronDown from "@4ait/icons_system/icons/IconChevronDown"
import Scrollbar from 'smooth-scrollbar';
import TabBarSmoothScrollPlugin from "@4ait/npm_smooth_scrollbar_plugins/tab_bar_smooth_scroll_plugin";

const Component = Options;
@Component({
    props: {
        modelValue: {
            type: Number
        },
        countTabs: {
            type: Number,
            default: 1
        },
        disableTabs: {
            type: Array,
            default: []
        },
        horizontalBottomDivider: {
            type: Boolean,
            default: true
        }
    },
    components: {
        IconChevronDown,
        Scrollbar
    },
    watch: {
        disableTabs(newValue)
        {
            this.componentDisableTabs = this.prepareDisableTabsArray(newValue);
            this.componentActiveTab = this.getNotDisableTab(this.modelValue);
        },
        modelValue()
        {
            this.componentActiveTab = this.getNotDisableTab(this.modelValue);
        },
        componentActiveTab(newValue)
        {
            this.updateSlider();
            this.scrollToActiveTab();

            this.$emit('update:modelValue', newValue);
        }
    },
    emits: [
        'update:modelValue'
    ]
})

export default class TabBarComponent extends Vue
{
    componentActiveTab = 0;
    componentDisableTabs = [];

    sliderWidth = 0;
    sliderLeftOffset = 0;

    startAnimationScrollLeftPosition = 0;
    finishAnimationScrollLeftPosition = 0;

    startPositionForBezier = 0;
    finishPositionForBezier = 0;

    smoothScrollbar = null;

    beforeMount()
    {
        this.componentDisableTabs = this.prepareDisableTabsArray(this.disableTabs);
    }

    mounted()
    {
        if(this.modelValue !== undefined && this.modelValue !== null)
        {
            this.componentActiveTab = this.getNotDisableTab(this.modelValue);
        }
        else
        {
            this.componentActiveTab = this.getNotDisableTab(1);
        }

        Scrollbar.use(TabBarSmoothScrollPlugin);
        this.smoothScrollbar = Scrollbar.init(this.$refs.tabs, { damping: .1, plugins: {} });
        Scrollbar.detachStyle();
    }

    scrollToActiveTab()
    {
        let rootCenter = this.$refs.root.getBoundingClientRect().width/2;
        let tabCenter = this.$refs.tabsContainer.children[this.componentActiveTab-1].offsetLeft +
            (this.$refs.tabsContainer.children[this.componentActiveTab-1].getBoundingClientRect().width/2) +
            this.$refs.leftGradientArea.getBoundingClientRect().width/2 +
            this.$refs.rightGradientArea.getBoundingClientRect().width/2
        ;

        this.finishAnimationScrollLeftPosition = tabCenter - rootCenter;

        this.startPositionForBezier = this.startAnimationScrollLeftPosition;
        this.finishPositionForBezier = this.finishAnimationScrollLeftPosition;

        // --------smooth animation through smooth-scrollbar--------
        this.smoothScrollbar.scrollTo(this.finishAnimationScrollLeftPosition, 0, 400);
    }

    onTabClick(tab)
    {
        if(!this.componentDisableTabs.includes(tab))
        {
            this.componentActiveTab = tab;
        }
    }

    updateSlider()
    {
        this.sliderWidth = this.$refs.tabsContainer.children[this.componentActiveTab-1].getBoundingClientRect().width
        this.sliderLeftOffset = this.$refs.tabsContainer.children[this.componentActiveTab-1].offsetLeft
    }

    prepareDisableTabsArray(tabsArray)
    {
        return tabsArray.map((element) => {
            let tab = parseInt(element);

            if(Number.isNaN(tab))
            {
                return null;
            }
            else
            {
                if(tab > this.countTabs)
                {
                    return null;
                }

                return tab;
            }
        }).filter(n => n);
    }

    checkDisableTab(tab)
    {
        return this.componentDisableTabs.includes(tab)
    }

    getNotDisableTab(tab)
    {
        if(tab >= this.countTabs)
        {
            let checkedDisable = this.countTabs
            while(this.checkDisableTab(checkedDisable))
            {
                checkedDisable--;
            }
            return checkedDisable;
        }
        else
        {
            let checkedDisable = tab
            while(this.checkDisableTab(checkedDisable))
            {
                checkedDisable++;
            }
            return checkedDisable;
        }
    }
}
</script>
