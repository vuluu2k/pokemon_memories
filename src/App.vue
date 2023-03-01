<script lang="ts">
import MainScreen from './screens/MainScreen.vue'
import InteractScreen from './screens/InteractScreen.vue'
import ResultScreen from './screens/ResultScreen.vue'
import { shuffled } from './utils/array'
export default {
  name: 'App',
  components: {
    MainScreen,
    InteractScreen,
    ResultScreen
  },
  data() {
    return {
      settings: {
        totalBlock: 0,
        cardsContext: [] as Array<number>,
        startedAt: 0
      },
      statusMatch: 'default',
    }
  },
  methods: {
    onHandleBeforeStart(config: { totalBlock: number }) {
      this.settings.totalBlock = config.totalBlock
      const firstCards = Array.from({ length: this.settings.totalBlock / 2 }, (_, i) => i + 1)
      const secondCards = [...firstCards]
      const cards = [...firstCards, ...secondCards]

      this.settings.cardsContext = shuffled(cards)
      this.settings.startedAt = new Date().getTime()

      console.log(cards)

      this.statusMatch = 'match'
    }
  }
}
</script>

<template>
  <MainScreen v-if="statusMatch === 'default'" @onStart="onHandleBeforeStart($event)" />
  <InteractScreen v-if="statusMatch === 'match'" :cardsContext="settings.cardsContext" />
  <ResultScreen />
</template>

<style scoped></style>
