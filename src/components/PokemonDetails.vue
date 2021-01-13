<template>
  <v-container
        fluid
        fill-height
  >
  <v-row align="center"
    class='pt-5'
  >
  <v-card
    class="mx-auto"
    width="100%"
    height='100vh'
    align='center'
  >
    <!-- <v-img
     width="500px"
    :src="pokemonInfoCPT.img"
    ></v-img> -->
   <template slot="progress">
      <v-progress-linear
        color="deep-purple"
        height="10"
        indeterminate
      ></v-progress-linear>
    </template>

    <v-img
      height="250"
      width="300px"
      :src="pokemonInfoCPT.img"
    ></v-img>

    <v-card-title>
      <v-row
        justify="center"
        class="mx-0"
      >
      {{pokemonInfoCPT.name}}
      </v-row>
    </v-card-title>

    <v-card-text>
      <v-row
        align="center"
         justify="center"
        class="mx-0"
      >
       <v-col cols=3>
         Peso {{pokemonInfoCPT.weight}}
       </v-col>
       <v-col cols=3>
         Altura {{pokemonInfoCPT.height}}
       </v-col>

       <v-col cols=12>
         <v-row
        align="center"
         justify="center"
        class="mx-0"
      >
        <v-chip-group
          column
          >
        <v-chip v-for="(element, index) in pokemonInfoCPT.type"
          :key='`type-${index}`'
        >{{element}}</v-chip>

        <!-- <v-chip>7:30PM</v-chip>

        <v-chip>8:00PM</v-chip>

        <v-chip>9:00PM</v-chip> -->
      </v-chip-group>
         </v-row>
       </v-col>
      </v-row>
<!--
      <div class="my-4 subtitle-1">
        $ • Italian, Cafe
      </div>

      <div>Small plates, salads & sandwiches - an intimate setting with 12
        indoor seats plus patio seating.</div> -->
    </v-card-text>

    <v-divider class="mx-4"></v-divider>

    <v-card-title>Debilidades</v-card-title>
    <!-- <v-card-subtitle class="my-2 subtitle-1">Debilidades</v-card-subtitle> -->

    <v-card-text justify='center'>
      <v-chip-group
        column
      >
        <v-chip v-for="(weaknesse, index) in pokemonInfoCPT.weaknesses"
          :key='`weak-${index}`'
        >{{weaknesse}}</v-chip>

        <!-- <v-chip>7:30PM</v-chip>

        <v-chip>8:00PM</v-chip>

        <v-chip>9:00PM</v-chip> -->
      </v-chip-group>
    </v-card-text>

  </v-card>
  </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'PokemonList',
  props: {
    value: {
      type: Object,
      required: false,
    },
  },
  data: () => ({
    pokemonSelected: 0,
    pokemonList: [],
  }),

  // created() {},
  computed: {
    pokemonInfoCPT: {
      get() {
        return this.value;
      },
      set(value) {
        this.$emit('onchange', value);
      },
    },
    pokemonSelectedCPT: {
      get(): number {
        return this.value && this.value.selected;
      },
      set(value: number) {
        this.value.selected = value;
      },
    },
    pokemonListCPT() {
      return this.value && this.value.pokemonList;
    },
  },
  methods: {

  },
});
</script>

<style lang="scss">
</style>
