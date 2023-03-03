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
    <div class="screen__inner">
      <h1 class="screen__title">POKEMON MEMORIES</h1>
      <h3 class="screen__select">Select Play Game Now !</h3>
      <div class="screen__actions">
        <button
          class="action__button"
          v-for="action in actions"
          :key="action.text"
          @click="onStart(action.value)"
        >
          <div class="action__text">{{ action.text }}</div>
          <div class="action__level">{{ action.level }}</div>
        </button>
      </div>
    </div>
  </div>
</template>

<style lang="css" scoped>
.screen {
  width: 100%;
  height: 100vh;
  background-color: var(--dark);
  color: var(--light);
}

.screen__inner {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 90vh;
}

.screen__actions {
  margin-top: 2rem;
  display: flex;
}

.action__button {
  width: 150px;
  height: 150px;
  background-color: var(--dark);
  color: var(--light);
  outline: none;
  border: 1px solid var(--light);
  border-radius: 8px;
  box-shadow: 0 3px 10px 3px rgba(0, 0, 0, 0.2);
}

.action__button + .action__button {
  margin-left: 1rem;
}
</style>
