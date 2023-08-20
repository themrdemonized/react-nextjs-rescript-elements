<template>
    <tag-component class="foura__trade_elements__elements_palette">
        <slot></slot>
    </tag-component>
</template>

<script>
    import TagComponent from "@4ait/elements/TagComponent"
    import "./src/styles/templates/tag-component.scss";

    export default {
        components: {
            TagComponent
        }
    };
</script>
