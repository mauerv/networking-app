import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  let element = document.querySelector('#profile')
  if (element != null) {
    var app = new Vue({
      el: element,
      data: {
        notice: '',
        connection_request: JSON.parse(element.dataset.request),
        profile: JSON.parse(element.dataset.profile),
        current_user: JSON.parse(element.dataset.user)
      },
      computed: {
        isContact: function() {
          return this.current_user.profile.contacts.filter(e => e.id === this.profile.id).length !== 0
        },
        isRequestor: function() {
          return this.current_user.profile.requestors.filter(e => e.id === this.profile.id).length !== 0
        },
        isReceiver: function() {
          return this.current_user.profile.receivers.filter(e => e.id === this.profile.id).length !== 0
        }
      },
      methods: {
        removeContact(profile_id) {
          $.ajax({
            url: `/contacts/${profile_id}`,
            type: 'DELETE',
            success: data => {
              this.current_user.profile.contacts = this.current_user.profile.contacts.filter(e => e.id !== this.profile.id)
              this.notice = "Contact removed."
            },
            error: (err) => console.log(err)
          })
        },
        withdrawRequest(request_id) {
          $.ajax({ 
            url: `/request-manager/withdraw/${request_id}`,
            type: 'DELETE',
            success: data => {
              this.current_user.profile.receivers = this.current_user.profile.receivers.filter(e => e.id !== this.profile.id)
              this.notice = "Request withdrawn."
            },
            error: err => console.log(err)
          })
        },
        declineRequest(request_id) {
          $.ajax({
            url: `/request-manager/${request_id}`,
            type: 'DELETE',
            success: data => {
              this.current_user.profile.requestors = this.current_user.profile.requestors.filter(e => e.id !== this.profile.id)              
              this.notice = "Request declined"
            },
            error: err => console.log(err)
          })
        },
        acceptRequest(request_id) {
          $.ajax({
            url: `/request-manager/${request_id}`,
            type: 'PATCH',
            success: data => {
              this.current_user.profile.requestors = this.current_user.profile.requestors.filter(e => e.id !== this.profile.id)
              this.current_user.profile.contacts.push(this.profile)           
              this.notice = "Request accepted"  
            },
            error: err => console.log(err)
          })
        }
      }
    })    
  }
})