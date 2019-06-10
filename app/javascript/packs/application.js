import Vue from 'vue/dist/vue.esm'
import Profile from '../components/profile.vue'

Vue.component('profile', Profile)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: "[data-behavior='vue']"
  })
})