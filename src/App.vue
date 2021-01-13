<template>
  <v-app>
    <v-main>
      <v-container fluid pa-0>
      <poke-dex/>
      </v-container>
    </v-main>
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue';
import PokeDex from './components/PokeDex.vue';

export default Vue.extend({
  name: 'App',

  components: {
    PokeDex,
  },

  data: () => ({
    //
  }),
});
</script>
