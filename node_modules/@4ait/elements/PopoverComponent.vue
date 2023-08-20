<style module lang="scss">
    @import 'imports/@4ait/scss_fonts_expansion/fonts_declare';

    .root
    {
        width: fit-content;
        max-width: 341px;
    }

    .root-with-tools
    {
        max-width: 348px;
    }

    .root-popover
    {
        width: 100%;
        height: 100%;

        display: flex;
        justify-content: space-between;
        gap: 12px;

        padding: 5px 7px;

        background: var(--4ait-elements--popover--default-background-color);
        border: 1px solid var(--4ait-elements--popover--default-border-color);
        box-sizing: border-box;
        border-radius: 4px;
    }

    .content
    {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;

        user-select: none;

        color: var(--4ait-elements--popover--default-text-color);
        @include setFont(font-4ait-elements, content-font);
    }

    .tools
    {
        height: 20px;

        display: flex;
        flex-direction: row;
        align-items: center;

        color: var(--4ait-elements--popover--default-tools-color);
    }

    .tool
    {
        padding: 4px;

        cursor: pointer;

        &:hover
        {
            color: var(--4ait-elements--popover--hover-tool-color)
        }
    }

    .divider-line
    {
        width: 1px;
        background-color: var(--trade-style-palette_light_divider_opaque);
        height: 100%;
    }
</style>
<template>
    <div
        :class="{
            [$style.root]: true,
            [$style['root-with-tools']]: tools.length > 0
        }"
    >
        <div
            :class="$style['root-popover']"
        >
            <div :class="$style.content">
                <slot></slot>
            </div>
            <template v-if="tools.length > 0">
                <div :class="$style.tools">
                    <template v-for="tool in toolsWithDividers" :key="tool">
                        <template v-if="tool === 'divider'">
                            <div :class="$style['divider-line']"/>
                        </template>
                        <template v-else>
                            <div
                                :class="$style.tool"
                                @click="onClick(tool)"
                            >
                                <slot :name="'icon-' + tool"/>
                            </div>
                        </template>
                    </template>
                </div>
            </template>
        </div>
    </div>
</template>
<script>
    import {Options, Vue} from "vue-class-component"

    @Options({
        props: {
            tools: {
                type: Array,
                default: []
            }
        },
        components: {},
        emits: [
            'click-tool'
        ]
    })

    export default class PopoverComponent extends Vue
    {
        get toolsWithDividers()
        {
            let toolsArrayWithDividers = this.tools.flatMap((tool) => ['divider', tool]).slice(1);
            return toolsArrayWithDividers;
        }

        onClick(tool)
        {
            this.$emit('click-tool', tool);
        }
    }
</script>
