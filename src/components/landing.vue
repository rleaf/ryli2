<template>
   <div id="landing">
         <p id="landingText">Hi, I'm Ryan Lin</p>
      <div id="canvas">
         <three id="three"/>
      </div>
   </div>
</template>

<script>
// import three from '@/components/three.vue'
import three from './three2.vue'


export default {
   components: {
      three,
   }
}
</script>

<style>

#landing {
   width: 100vw;
   height: 100vh;
   display: block;
   background-color: #296fb4;
}

#canvas {
   width:100vw;
   height: 100vh;
   position: absolute;
}

#landingText {
   z-index: 10;
}



</style>