<script lang="ts">
export default {
  name: 'MainScreen',
  data() {
    return {
      actions: [
        {
          text: '4x4',
          value: 16,
          level: 'Easy'
        },
        {
          text: '6x6',
          value: 36,
          level: 'Normal'
        },
        {
          text: '8x8',
          value: 64,
          level: 'Hard'
        },
        {
          text: '10x10',
          value: 100,
          level: 'Master'
        }
      ]
    }
  },
  methods: {
    onStart(value: number) {
      this.$emit('onStart', { totalBlock: value })
    }
  }
}
</script>

<template>
  <div class="screen">
    <h1 class="screen__title">POKEMON MEMORIES</h1>
    <h3 class="screen__select"></h3>
    <div class="screen__actions" v-for="action in actions" :key="action.text">
      <button class="action__button" @click="onStart(action.value)">
        <span class="action__text">{{ action.text }}</span
        ><span class="action__level">{{ action.level }}</span>
      </button>
    </div>
  </div>
</template>

<style></style>
