<template>
  <div class="screen">
    <h1 class="screen__title">POKEMON MEMORIES</h1>
    <h3 class="screen__select"></h3>
    <div class="screen__actions">
      <button class="action__button"><span>4x4</span><span>Easy</span></button>
      <button class="action__button"><span>6x6</span><span>Normal</span></button>
      <button class="action__button"><span>8x8</span><span>Hard</span></button>
      <button class="action__button"><span>10x10</span><span>Master</span></button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MainScreen',
  data() {
    return {
      actions: [
        {
          text: '4x4',
          level: 'Easy'
        },
        {
          text: '4x4',
          level: 'Easy'
        },
        {
          text: '4x4',
          level: 'Easy'
        },
        {
          text: '4x4',
          level: 'Easy'
        }
      ]
    }
  }
}
</script>

<style></style>
