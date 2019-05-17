import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#app',
    data: {
      isActive: false
    },
    methods: {
    	onMenuToggle() {
    		this.isActive = !this.isActive
    	}
    }
  })
})