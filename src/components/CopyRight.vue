<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'CopyRight',
  setup() {
    return {}
  }
})
</script>

<template>
  <h1>Copy Right By Dev2000</h1>
</template>

<style lang="css" scoped>
h1 {
  color: white;
  position: absolute;
  z-index: 3;
  bottom: 2.5rem;
  left: 50%;
  transform: translateX(-50%);
}
</style>
