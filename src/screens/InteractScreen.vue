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
  computed: {
    style() {
      let style = {
        width: '0px',
        height: '90vh'
      }

      style.width = `calc((((90vh - 64px) / ${Math.sqrt(this.cardsContext.length)} - 16px) * 3/4 + 16px) * ${Math.sqrt(this.cardsContext.length)} )`

      return style
    }
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
      
      if (this.rules.length === 2 && this.rules[0].value === this.rules[1].value) {
        // @ts-ignore
        this.$refs[`card-${this.rules[0].index}`][0].onDisabledCard()
        // @ts-ignore
        this.$refs[`card-${this.rules[1].index}`][0].onDisabledCard()

        this.rules = []

        const elementDisabled = document.querySelectorAll('.screen .card.disabled')

        if (elementDisabled && elementDisabled.length === this.cardsContext.length - 2) {
          setTimeout(() => this.$emit('onFinished'), 800)
        }
      } else if (this.rules.length === 2 && this.rules[0].value !== this.rules[1].value) {
        setTimeout(() => {
          // @ts-ignore
          this.$refs[`card-${this.rules[0].index}`][0].onFlipBackCard()
          // @ts-ignore
          this.$refs[`card-${this.rules[1].index}`][0].onFlipBackCard()

          this.rules = []
        }, 720)
      } else return false
    }
  }
}
</script>

<template>
  <div class="screen">
    <div class="screen__inner" :style="style">
      <card-flip
        v-for="(card, index) in cardsContext"
        :key="index"
        :ref="`card-${index}`"
        :card="{ index: index, value: card }"
        @onFlip="checkRule"
        :count="cardsContext.length"
        :isCheckEnabled="rules.length === 2"
      />
    </div>
  </div>
</template>

<style lang="css" scoped>
.screen {
  width: 100%;
  height: 100vh;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2;
  background-color: var(--dark);
  color: var(--light);
}

.screen__inner {
  width: 800px;
  display: flex;
  flex-wrap: wrap;
  margin: 2rem auto;
}
</style>
