<template>
  <!-- <div class="hello">
    hello pokemons
    <pokemon-list>
    </pokemon-list>
  </div> -->
  <v-row
    no-gutters
    fill-height
  >
        <v-col cols="4">
          <!-- <v-sheet rounded="lg"> -->
            <pokemon-list
              v-model="pokemonInfo"
            >
            </pokemon-list>
          <!-- </v-sheet> -->
        </v-col>

        <v-col cols=8 >
          <!-- <v-sheet
            height='100vh'
            rounded="lg"
          > -->
          <pokemon-details
            v-model="pokemonDetailCPT"
          >
          </pokemon-details>
          <!-- </v-sheet> -->
        </v-col>
      </v-row>
</template>

<script lang="ts">

import Vue from 'vue';
import axios from 'axios';
import PokemonList from './PokemonList.vue';
import PokemonDetails from './PokemonDetails.vue';

export default Vue.extend({
  name: 'PokeDex',
  components: {
    PokemonList,
    PokemonDetails,
  },
  props: {
    value: {
      type: Array,
    },
  },
  data: () => ({
    pokemonInfo: {
      selected: 0,
      pokemonList: [
        {
          name: 'mew',
        },
        {
          name: 'mewTwo',
        },
      ],
    },
  }),

  created() {
    this.getPokemons();
  },
  //  mounted() {},
  computed: {
    pokemonDetailCPT() {
      const { selected, pokemonList } = this.pokemonInfo;
      let pokeInfo = null;
      if (pokemonList && PokemonList.length > 0) {
        pokeInfo = pokemonList[selected];
      }
      return pokeInfo;
    },
  },
  methods: {
    getPokemons() {
      axios
        .get('http://localhost:8080/pokemon')
        .then(
          (response) => {
            this.pokemonInfo.pokemonList = response.data.pokemon;
            console.log(response);
          },
        );
    },
  },
});
</script>

<style lang="scss">
// @media (min-width: 1264px)
  // .container {
  //   max-width: 1185px;
  // }
</style>
