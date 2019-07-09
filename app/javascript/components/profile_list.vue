<template>
  <div>
    <profile-list-item
      v-for='profile in profiles'
      :key='profile.id'
      :profile='profile'
      :user='currentUser'
      @create-request='updateRequestReceiverId'
    >
    </profile-list-item>
    <request-modal @send-request='sendRequest'></request-modal>
  </div>
</template>

<script>
export default {
  props: {
    profiles: {
      type: Array,
      required: true
    },
    user: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      requestReceiverId: null,
      currentUser: this.user
    }
  },
  methods: {
    sendRequest(message) {
      let data = {
        connection_request: {
          "request_message": message,
          "profile_id": this.currentUser.id,
          "contact_id": this.requestReceiverId
        }
      }

      $.ajax({
        url: `/request-manager`,
        type: 'post',
        data: data,
        success: data => {
          this.currentUser.profile.receivers.push({ id: this.requestReceiverId })
          this.requestReceiverId = null
          $('#modal-window').modal('toggle')
          this.$emit('new-notice', 'Request sent.')
        },
        error: err => console.log(err)
      })
    },
    updateRequestReceiverId(id) {
      this.requestReceiverId = id
    }
  }
}
</script>
