<script lang="ts">
import MainScreen from './screens/MainScreen.vue'
import InteractScreen from './screens/InteractScreen.vue'
import ResultScreen from './screens/ResultScreen.vue'
import CopyRight from './components/CopyRight.vue'
import { shuffled } from './utils/array'
export default {
  name: 'App',
  components: {
    MainScreen,
    InteractScreen,
    ResultScreen,
    CopyRight
  },
  data() {
    return {
      settings: {
        totalBlock: 0,
        cardsContext: [] as Array<number>,
        startedAt: 0
      },
      statusMatch: 'default',
      timer: 0
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

      this.statusMatch = 'match'
    },
    onGetResult() {
      this.timer = new Date().getTime() - this.settings.startedAt
      this.statusMatch = 'result'
    },
    startAgain() {
      this.statusMatch = 'match'
    }
  }
}
</script>

<template>
  <!-- <main-screen v-if="statusMatch === 'default'" @onStart="onHandleBeforeStart($event)" />
  <interact-screen
    v-if="statusMatch === 'match'"
    :cardsContext="settings.cardsContext"
    @onFinished="onGetResult"
  /> -->
  <result-screen v-if="statusMatch === 'default'" :timer="timer" @startAgain="startAgain" />
  <copy-right/>
</template>

<style scoped></style>
