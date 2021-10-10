<template>
   <keep-alive>
      <canvas id="three"></canvas>
   </keep-alive>
</template>

<script>
// import { World } from './worlds/World.js'
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import testVertexShader from '@/assets/shaders/vertex.glsl'
import testFragmentShader from '@/assets/shaders/fragment.glsl'
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





      // Material
      const basicMaterial = new THREE.MeshBasicMaterial({ color: 0xffff00})
      const standardMaterial = new THREE.MeshStandardMaterial()
      const shader = new THREE.ShaderMaterial({
            vertexShader: testVertexShader,
         fragmentShader: testFragmentShader,
         // transparent: true,
         // fog: true,
         uniforms: {
         
            }
      })

      // Mesh
      const mesh = new THREE.Mesh(new THREE.BoxGeometry(1, 1, 1), basicMaterial)
      mesh.position.set(5, 5, 0)
      const sphere = new THREE.Mesh(new THREE.SphereGeometry(.7,32, 16), standardMaterial)
      sphere.position.y = .5

      const plane = new THREE.Mesh(new THREE.PlaneGeometry(20, 20), shader)
      plane.rotation.x = - Math.PI * 0.5
      plane.position.y = -0.65
      scene.add(mesh, sphere, plane)

      // Light
      // const ambientLight = new THREE.AmbientLight(0xffffff, 0.5)
      const pointLight = new THREE.PointLight(0x3e8edf, 1)
      const pointLight2 = new THREE.PointLight(0xdf84df, 1)
      scene.add(pointLight2, pointLight)
      pointLight.position.set(50, 50, 0)
      pointLight2.position.set(-50, 50, 0)
      pointLight.lookAt(mesh.position)
      pointLight2.lookAt(mesh.position)

      // Fog
      const fog = new THREE.Fog('#180202', 1, 10)
      scene.fog = fog


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

      const controls = new OrbitControls(camera, threeCanvas)
      controls.enableDamping = true

      // Renderer
      const renderer = new THREE.WebGLRenderer({
         canvas: threeCanvas
      })
      renderer.setSize(sizes.width, sizes.height)
      // renderer.setClearColor('#180202')

      // gsap.to(mesh.position, { duration: 1, delay: 1, x: 2})
      const clock = new THREE.Clock()

      const tick = () => {
         
         // Time
         const elapsedTime = clock.getElapsedTime()

         // Update
         mesh.rotation.y = elapsedTime
         camera.rotation.x = - (cursor.y * 0.2)
         camera.rotation.y = - (cursor.x * 0.2)
         controls.update()

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
    color: #186691;
 }
</style>