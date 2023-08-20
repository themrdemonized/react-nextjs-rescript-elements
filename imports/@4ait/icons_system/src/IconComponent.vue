<style module lang="scss">
  .icon
  {
    width: 16px;
    height: 16px;

    svg
    {
      display: block;
    }
  }
</style>

<template>
  <div :class="$style.icon">
    <slot></slot>
  </div>
</template>

<script>
  export default {};
</script>