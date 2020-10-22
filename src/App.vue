<template>
  <div id="app">
    <div>
      Select all <span class="bold">GIFs</span> to use
      <span class="facebook">Facebook</span>
    </div>
    <main class="main">
      <div v-for="image in images" :key="image">
        <img
          class="img"
          v-bind:class="{ selected: selected.some((s) => s === image) }"
          :src="require(`@/assets/${image}`)"
          v-on:click="
            selected = selected.some((s) => s === image)
              ? selected.filter((s) => s !== image)
              : [...selected, image]
          "
        />
      </div>
    </main>
    <a
      class="submit"
      v-on:click="
        passed =
          selected.length === gifs.length &&
          selected.every((s) => gifs.some((g) => g === s))
      "
    >
      Submit
    </a>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

const gifs = ["1.gif", "2.gif", "3.gif", "4.gif", "5.gif"];
const jpgs = ["1.jpg", "2.jpg", "3.jpg", "4.jpg"];

const images = [...gifs, ...jpgs].sort(() => Math.random() * 10 - 5);
console.log(images);

@Component({
  data: function() {
    return {
      gifs,
      images,
      selected: [],
      passed: null,
    };
  },
})
export default class App extends Vue {}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.bold {
  font-weight: 700;
}
.facebook {
  color: #1a77f2;
  font-weight: 800;
}
.main {
  padding: 20px;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
.img {
  width: 200px;
  height: 200px;
}
.selected {
  border: 5px solid #1a77f2;
}
.submit {
  cursor: pointer;
  border-radius: 2px;
  background-color: #1a77f2;
  color: white;
  padding: 1em 1.5em;
  text-decoration: none;
  text-transform: uppercase;
}
.submit:hover {
  text-decoration: underline;
}
</style>
