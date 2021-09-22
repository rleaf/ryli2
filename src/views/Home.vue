<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <!-- <three /> -->
    <landing />
    <next />
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
  </div>
</template>

<script>
// @ is an alias to /src
import landing from '@/components/landing.vue'
import next from '@/components/next.vue'
// import { gsap } from "gsap";
// import { ScrollTrigger } from "gsap/ScrollTrigger.js";



export default {

  name: 'Home',
  components: {
    landing,
    next,

  },
  data() {

  },
  methods: {

  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Inconsolata&display=swap');
@import url('https://fonts.googleapis.com/css?family=Lora&display=swap');
@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,400&display=swap');
@import url('https://fonts.googleapis.com/css?family=Amiri&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Koh+Santepheap:wght@100;300;400;700;900&display=swap');


html, body {
  background-color:#181818;
  margin: 0;
}

p {
font-family: 'Koh Santepheap', sans-serif;
/* font-family: 'Lora', Helvetica, Arial, sans-serif; */
font-size: 100px;
font-weight: bold;
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
position: absolute;
text-align: center;
color: #8f959b;
margin: 0;
} 

</style>
