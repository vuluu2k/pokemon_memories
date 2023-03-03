<script lang="ts">
import type { PropType } from 'vue'

export default {
  props: {
    card: { type: [String, Number, Object] as PropType<{ index: Number; value: Number }> },
    count: { type: Number, default: 0 }
  },
  name: 'CardFlip',
  data() {
    return {
      isDisabled: false as Boolean,
      isFlipped: false
    }
  },
  computed: {
    image() {
      return `src/assets/images/${this.card?.value}.png`
    }
  },
  mounted(){
    console.log(Math.sqrt(this.count));
    
  },
  methods: {
    onToggleFlipCard() {
      if (this.isDisabled) return false

      this.isFlipped = !this.isFlipped

      if (this.isFlipped) this.$emit('onFlip', this.card)
    },
    onFlipBackCard() {
      this.isFlipped = false
    },
    onDisabledCard() {
      this.isDisabled = true
    }
  }
}
</script>

<template>
  <div
    class="card"
    :class="{ disabled: isDisabled }"
    @click="onToggleFlipCard"
    :style="{
      height: `calc((90vh - 64px) / ${Math.sqrt(count)} - 16px)`,
      width: `calc(((90vh - 64px) / ${Math.sqrt(count)} - 16px) * 3/4 )`
    }"
  >
    <div class="card__inner" :class="{ 'is-flipped': isFlipped }">
      <div class="card__face card__face--front">
        <div class="card__content"></div>
      </div>
      <div class="card__face card__face--back">
        <div
          class="card__content"
          :style="{
            'background-image': 'url(' + image + ')',
            width: '100%',
            height: '100%',
            'background-size': 'contain',
            'background-repeat': 'no-repeat',
            'background-position': 'center center'
          }"
        ></div>
      </div>
    </div>
  </div>
</template>

<style lang="css" scoped>
.card {
  display: inline-block;
  margin-right: 1rem;
  margin-bottom: 1rem;
  width: 90px;
  height: 120px;
}

.card__inner {
  width: 100%;
  height: 100%;
  transition: transform 1s;
  transform-style: preserve-3d;
  cursor: pointer;
  position: relative;
}

.card__inner.is-flipped {
  transform: rotateY(-180deg);
}

.card__face {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  overflow: hidden;
  border-radius: 1rem;
  padding: 1rem;
  box-shadow: 0 3px 10px 3px rgba(0, 0, 0, 0.2);
}

.card.disabled {
  cursor: default;
}

.card__face--front .card__content {
  background-image: url('../assets/images/icon_back.png');
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center center;
  width: 100%;
  height: 100%;
}

.card__face--back {
  background-color: var(--light);
  transform: rotateY(-180deg);
}

/* .card + .card {
  margin-left: 1rem;
} */
</style>
