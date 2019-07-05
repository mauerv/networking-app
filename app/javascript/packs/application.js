import Vue from 'vue/dist/vue.esm'

import App from '../components/app.vue'
import Profile from '../components/profile.vue'
import Feed from '../components/feed.vue'
import RequestManager from '../components/request_manager.vue'
import RequestListItem from '../components/request_list_item.vue'
import ProfileListItem from '../components/profile_list_item.vue'

Vue.component('app', App)
Vue.component('profile', Profile)
Vue.component('feed', Feed)
Vue.component('request-manager', RequestManager)
Vue.component('request-list-item', RequestListItem)
Vue.component('profile-list-item', ProfileListItem)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: "[data-behavior='vue']"
  })
})
