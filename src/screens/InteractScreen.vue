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
  },
  data: () => {
    return {
      rules: [] as Array<{ index: Number; value: Number }>
    }
  },
  methods: {
    checkRule(card: { index: Number; value: Number }) {
      if (this.rules.length === 2) return false

      this.rules.push(card)

      if (this.rules.length === 2 && this.rules[0] === this.rules[1]) {
        // @ts-ignore
        this.$refs[`card-${this.rules[0].index}`][0].onDisabledCard()
        // @ts-ignore
        this.$refs[`card-${this.rules[1].index}`][0].onDisabledCard()

        this.rules = []

        const elementDisabled = document.querySelectorAll('.screen .card.disabled')

        if (elementDisabled && elementDisabled.length === this.cardsContext.length - 2) {
          setTimeout(() => this.$emit('onFinished'), 800)
        }
      } else if (this.rules.length === 2 && this.rules[0] !== this.rules[1]) {
        setTimeout(() => {
          // @ts-ignore
          this.$refs[`card-${this.rules[0].index}`][0].onFlipBackCard()
          // @ts-ignore
          this.$refs[`card-${this.rules[1].index}`][0].onFlipBackCard()

          this.rules = []
        }, 1000)
      } else return false
    }
  }
}
</script>

<template>
  <div>
    <CardFlip
      v-for="(card, index) in cardsContext"
      :key="index"
      :ref="`card-${index}`"
      :card="{ index: index, value: card }"
      @onFlip="checkRule"
    />
  </div>
</template>

<style lang="scss" scoped></style>
