<script lang="ts">
import JSConfetti from 'js-confetti'
import { defineComponent } from 'vue'

const confetti = new JSConfetti()

export default defineComponent({
  props: {
    timer: { type: Number, required: true }
  },
  setup() {
    return {}
  },
  mounted() {
    this.showConfetti()
  },
  methods: {
    showConfetti() {
      confetti.addConfetti()
    },
    startAgain() {
      this.$emit('startAgain')
    }
  }
})
</script>

<template>
  <div class="screen">
    <div class="screen__inner">
      <h1 @click="showConfetti">🎉 Congratulations!</h1>
      <p>{{ Math.round(timer / 1000) }} seconds</p>
      <button @click="startAgain">Start Again</button>
    </div>
  </div>
</template>

<style lang="css" scoped>
.screen {
  width: 100%;
  height: 100vh;
  background-color: var(--dark);
  color: var(--light);
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2;
}

.screen__inner {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 80vh;
}

h1 {
  text-align: center;
  cursor: pointer;
  margin-top: 3em;
  font-size: 3rem;
}

p {
  font-size: 2rem;
  padding: 1.5rem;
}

button {
  width: 200px;
  height: 70px;
  background-color: var(--dark);
  border: unset;
  outline: unset;
  color: var(--light);
  box-shadow: 0 3px 10px 3px rgba(0, 0, 0, 0.2);
}
</style>
