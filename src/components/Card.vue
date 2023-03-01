<script lang="ts">
export default {
  props: {
    card: { type: Number }
  },
  name: 'CardFlip',
  data() {
    return {
      isFlipped: false,
    }
  },
  setup(){
    const getImageUrl = (name: number | undefined) => {
      return new URL(`../assets/${name}.png`, import.meta.url).href
    }

    return {
      getImageUrl
    }
  },
  methods: {
    onToggleFlipCard() {
      this.isFlipped = !this.isFlipped
    }
  }
}
</script>

<template>
  <div class="card" @click="onToggleFlipCard">
    <div class="card__inner" :class="{ 'is-flipped': isFlipped }">
      <div class="card__face card__face--front">
        <div class="card__content"></div>
      </div>
      <div class="card__face card__face--back">
        <div class="card__content" :style="{ backgroundImage: `url(${getImageUrl(card)}` }"></div>
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
