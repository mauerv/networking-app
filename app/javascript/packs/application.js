import Vue from 'vue/dist/vue.esm'

import App from '../components/app.vue'
import Profile from '../components/profile.vue'
import Feed from '../components/feed.vue'
import RequestManager from '../components/request_manager.vue'

Vue.component('app', App)
Vue.component('profile', Profile)
Vue.component('feed', Feed)
Vue.component('request-manager', RequestManager)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: "[data-behavior='vue']"
  })
})

