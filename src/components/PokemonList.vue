<template>

  <v-card
    class="mx-auto overflow-y-auto"
    width="100%"
    height='100vh'
  >
    <v-list two-line>
      <v-list-item-group
        v-model="pokemonSelectedCPT"
      >
        <template v-for="(item, index) in pokemonListCPT">
          <v-list-item v-if='item.num'
            :key="`pokemon-´${item.num}`">
            <template v-slot:default="{ active }">
              <v-list-item-avatar>
                <v-img
                  :src="item.img"

                ></v-img>
              </v-list-item-avatar>
              <v-list-item-content>
                <v-list-item-title v-text="item.name"></v-list-item-title>

                <v-list-item-subtitle
                  class="text--primary"
                  v-text="item.name.japanese"
                ></v-list-item-subtitle>

                <v-list-item-subtitle v-text="item.subtitle"></v-list-item-subtitle>
              </v-list-item-content>

              <v-list-item-action>
                <v-list-item-action-text v-text="item.num"></v-list-item-action-text>

                <v-icon
                  v-if="!active"
                  color="grey lighten-1"
                >
                  mdi-star-outline
                </v-icon>

                <v-icon
                  v-else
                  color="yellow darken-3"
                >
                  mdi-star
                </v-icon>
              </v-list-item-action>
            </template>
          </v-list-item>

          <v-divider
            v-if="index < pokemonListCPT.length - 1"
            :key="index"
          ></v-divider>
        </template>
      </v-list-item-group>
    </v-list>
  </v-card>
  <!-- <v-list shaped
    color="transparent">
    <v-subheader>Procesos </v-subheader>
      <v-list-item-group mandatory
        v-model="pokemonSelectedCPT"
        color="primary"
      >
        <v-list-item
          v-for="n in pokemonListCPT"
          :key="n.task_id"
          link
        >
          <v-list-item-content>
            <v-list-item-title>
              {{ n.name.english }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
  </v-list> -->
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'PokemonList',
  props: {
    value: {
      type: Object,
    },
  },
  data: () => ({
    pokemonSelected: 0,
    pokemonList: [],
  }),

  // created() {},
  computed: {
    valueCPT: {
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
