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
    startAgain(){
      this.$emit("startAgain")
    }
  }
})
</script>

<template>
  <div class="screen">
    <h1 @click="showConfetti">🎉 Congratulations!</h1>
    <p>{{ Math.round(timer / 1000) }} seconds</p>
    <button @click="startAgain">Start Again</button>
  </div>
</template>

<style lang="scss" scoped>
h1 {
  text-align: center;
  cursor: pointer;
  margin-top: 3em;
}
</style>
