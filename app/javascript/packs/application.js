import Vue from 'vue/dist/vue.esm'
import Profile from '../components/profile.vue'
import Feed from '../components/feed.vue'

Vue.component('profile', Profile)
Vue.component('feed', Feed)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: "[data-behavior='vue']"
  })
})

