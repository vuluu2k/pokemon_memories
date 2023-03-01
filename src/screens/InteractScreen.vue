<script lang="ts">
import type { PropType } from 'vue'
import CardFlip from '@/components/Card.vue'
export default {
  props: {
    cardsContext: { type: Array as PropType<Array<number>>, default: () => [] }
  },
  name: 'InteractScreen',
  components: {
    CardFlip
  }
}
</script>

<template>
  <div>
    <CardFlip v-for="(card, index) in cardsContext" :key="index" :card="card" />
  </div>
</template>

<style lang="scss" scoped></style>
