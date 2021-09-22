<template>
   <keep-alive>
      <div id="three"></div>
   </keep-alive>
</template>

<script>
import { World } from './worlds/World.js'

export default {

   mounted() {
      function main() {
      // Get a reference to the container element
      const container = document.querySelector('#three');

      // 1. Create an instance of the World app
      const world = new World(container);

      // 2. Render the scene
      world.render();
      }

      main();

   }
}
</script>

<style>
 #three {
    width: 100vw;
    height: 100vh;
 }
</style>