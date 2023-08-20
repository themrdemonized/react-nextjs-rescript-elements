<style module lang="scss">

</style>

<template>
    <button-component type-size="M" type-color="Tertiary">
      <template #icon-single>
        <slot></slot>
      </template>
    </button-component>
</template>

<script>
    import { Options, Vue } from "vue-class-component"
    import ButtonComponent from "./ButtonComponent.vue";

    /**
     * @deprecated
     */
    export default {
        props: {
        },
        components: {
          ButtonComponent
        }
    }
</script>