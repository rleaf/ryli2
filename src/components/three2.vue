<template>
   <keep-alive>
      <canvas id="three"></canvas>
   </keep-alive>
</template>

<script>
// import { World } from './worlds/World.js'
import * as THREE from 'three';
// import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
// import { gsap } from 'gsap'

export default {

   mounted() {

      const threeCanvas = document.querySelector('#three')
      const cursor = {x: 0, y: 0}

      const sizes = {
         width: window.innerWidth,
         height: window.innerHeight
      }

      // Scene
      const scene = new THREE.Scene()

      // Light
      const ambientLight = new THREE.AmbientLight(0xffffff, 0.5)
      const pointLight = new THREE.PointLight(0x3e8edf, 0.5)
      scene.add(ambientLight, pointLight)
      pointLight.position.y = -.5

      // Material
      const basicMaterial = new THREE.MeshBasicMaterial({ color: 0xff0000})
      const standardMesh = new THREE.MeshStandardMaterial()

      // Object
      const mesh = new THREE.Mesh(new THREE.BoxGeometry(1, 1, 1), basicMaterial)
      const cylinder = new THREE.Mesh(new THREE.CylinderGeometry(.3, .3, 1, 20), standardMesh)
      
      const plane = new THREE.Mesh(new THREE.PlaneGeometry(5, 5), standardMesh)
      plane.rotation.x = - Math.PI * 0.5
      plane.position.y = -0.65
      scene.add(cylinder, plane)

      // Resize
      window.addEventListener('resize', () =>
      {
         // Update sizes
         sizes.width = window.innerWidth
         sizes.height = window.innerHeight

         // Update camera
         // camera.aspect(sizes.width / sizes.height)
         camera.aspect = sizes.width / sizes.height
         camera.updateProjectionMatrix()

         // Update renderer
         renderer.setSize(sizes.width, sizes.height)
         // renderer.render(scene, camera)
         renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
      })

      window.addEventListener('mousemove', () => {
         cursor.x = event.clientX / sizes.width - 0.5
         cursor.y =  event.clientY / sizes.height - 0.5

      })


      // Camera
      const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height, .1, 1000)
      camera.position.z = 3
      camera.lookAt(mesh.position)
      scene.add(camera)

      // const controls = new OrbitControls(camera, threeCanvas)
      // controls.enableDamping = true

      // Renderer
      const renderer = new THREE.WebGLRenderer({
         canvas: threeCanvas
      })
      renderer.setSize(sizes.width, sizes.height)

      // gsap.to(mesh.position, { duration: 1, delay: 1, x: 2})
      const clock = new THREE.Clock()

      const tick = () => {
         
         // Time
         const elapsedTime = clock.getElapsedTime()

         // Update
         mesh.rotation.y = elapsedTime
         camera.rotation.x = - (cursor.y * 0.2)
         camera.rotation.y = - (cursor.x * 0.2)
         // controls.update()

         renderer.render(scene, camera)
         window.requestAnimationFrame(tick)
      };

      tick()


      
      // function main() {
      // // Get a reference to the container element
      // const container = document.querySelector('#three');

      // // 1. Create an instance of the World app
      // const world = new World(container);

      // // 2. Render the scene
      // world.render();
      // }

      // main();

   }
}
</script>

<style>
 #three {
    position: fixed;
    top: 0;
    left: 0;
    outline: none;
 }
</style>