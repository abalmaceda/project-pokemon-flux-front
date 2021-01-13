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
    width="70%"
    max-width='500px'
    min-height='80vh'
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
     <v-sheet
      class="v-sheet--offset mx-auto"
      color="cyan"
      elevation="9"
      max-width="calc(100% - 32px)"
    >
    <v-img
      height="250"
      width="300px"
      :src="pokemonInfoCPT.img"
    ></v-img>

    </v-sheet>

    <v-card-title>
      <v-row
        justify="center"
        class="mx-0"
      >
     #{{pokemonInfoCPT.num}} {{pokemonInfoCPT.name}}
      </v-row>
    </v-card-title>

    <v-card-text>
      <!-- <v-row
        align="center"
        justify="center"
        class="mx-0"
      >
       <v-col cols=3
        class= 'text-right'
       >
         Peso
       </v-col>
       <v-col cols=3
        class= 'text-left'
       >
         {{pokemonInfoCPT.weight}}
       </v-col>
      </v-row>

      <v-row
        align="center"
        justify="center"
        class="mx-0"
      >
        <v-col cols=3
          class= 'text-right'
        >
          Altura
        </v-col>
        <v-col cols=3
          class= 'text-left'
        >
          {{pokemonInfoCPT.height}}
       </v-col>
      </v-row>
       <v-row
        align="center"
        justify="center"
        class="mx-0"
      >
        <v-col cols=4
          class= 'text-right'
        >
          Siguientes Evoluciónes
        </v-col> -->

        <!-- <v-col  v-for='evol in pokemonInfoCPT.next_evolution'
          :key='`evol-${pokemonInfoCPT.num}-${evol.num}`'
          cols=4
          class= 'text-left'
        >
          #{{evol.num}} {{evol.name}}
       </v-col> -->

      <!-- </v-row> -->

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
              color='success'
            >{{element}}</v-chip>

            </v-chip-group>
         </v-row>
       </v-col>
      <!-- </v-row> -->
<!--
      <div class="my-4 subtitle-1">
        $ • Italian, Cafe
      </div>

      <div>Small plates, salads & sandwiches - an intimate setting with 12
        indoor seats plus patio seating.</div> -->
    </v-card-text>

    <v-divider class="mx-4"></v-divider>

    <v-card-title justify='center'>Características</v-card-title>
    <!-- <v-card-subtitle class="my-2 subtitle-1">Debilidades</v-card-subtitle> -->

    <v-card-text justify='center' align='center'>
      <v-row no-gutters
        align="center"
        justify="center"
        class="mx-0"
      >
       <v-chip-group column>
        <v-chip v-if='pokemonInfoCPT.weight'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Peso: {{pokemonInfoCPT.weight}}
        </v-chip>

           <v-chip v-if='pokemonInfoCPT.height'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Altura: {{pokemonInfoCPT.height}}
        </v-chip>
        <v-chip v-if='pokemonInfoCPT.candy'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Candy: {{pokemonInfoCPT.candy}}
        </v-chip>

        <v-chip v-if='pokemonInfoCPT.egg'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Egg {{pokemonInfoCPT.egg}}
        </v-chip>

        <v-chip v-if='pokemonInfoCPT.candy_count'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Candy count: {{pokemonInfoCPT.candy_count}}
        </v-chip>

         <v-chip v-if='pokemonInfoCPT.spawn_chance'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Spawn Chance: {{pokemonInfoCPT.spawn_chance}}
        </v-chip>

        <v-chip v-if='pokemonInfoCPT.avg_spawns'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Avg. Spawn: {{pokemonInfoCPT.avg_spawns}}
        </v-chip>

        <v-chip v-if='pokemonInfoCPT.spawn_time'
          class="ma-2"
           color="indigo darken-3"
          outlined
        >
          Spawn Time: {{pokemonInfoCPT.spawn_time}}
        </v-chip>

       </v-chip-group>
      </v-row>

    </v-card-text>

     <v-card-title v-if='pokemonInfoCPT.prev_evolution'
        justify='center'
      >Pre evoluciones</v-card-title>
      <v-card-text justify='center' align='center'>
      <v-row no-gutters v-if='pokemonInfoCPT.prev_evolution'
        align="center"
         justify="center"
        class="mx-0"
      >
       <v-chip-group column>
        <v-chip v-for="evol in pokemonInfoCPT.prev_evolution"
          :key='`${pokemonInfoCPT.num}-${evol.num}`'
          class="ma-2"
          color="primary"
          outlined
        >
          #{{evol.num}} {{evol.name}}
        </v-chip>

       </v-chip-group>
      </v-row>

    </v-card-text>

      <v-card-title v-if='pokemonInfoCPT.next_evolution'
        justify='center'
      >Evoluciones</v-card-title>
      <v-card-text justify='center' align='center'>
      <v-row no-gutters v-if='pokemonInfoCPT.next_evolution'
        align="center"
         justify="center"
        class="mx-0"
      >
       <v-chip-group column>
        <v-chip v-for="evol in pokemonInfoCPT.next_evolution"
          :key='`${pokemonInfoCPT.num}-${evol.num}`'
          class="ma-2"
          color="deep-purple accent-4"
          outlined
        >
          #{{evol.num}} {{evol.name}}
        </v-chip>

       </v-chip-group>
      </v-row>

    </v-card-text>

    <v-card-title>Debilidades</v-card-title>
    <v-card-text justify='center'>
      <v-chip-group
        column
      >
        <v-chip v-for="(weaknesse, index) in pokemonInfoCPT.weaknesses"
          :key='`weak-${index}`'
          color='warning'
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
