<template>
  <div>
    <profile-list-item
      v-for='profile in visible_profiles'
      :key='profile.id'
      :profile='profile'
      :user='current_user'
      @create-request='updateContactId'
    >
    </profile-list-item>

    <div id='modal-window' class="modal hide fade" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" >
      <div class="modal-dialog" role='document'>
        <div class="modal-content">
          <div class="modal-header">
            <h4 id='myModalLabel' class='modal-title'>Send Request</h4>
            <button type="button" class='close' data-dismiss='modal'>x</button>
          </div>
          <div class="modal-body">
            <div class="form">
              <div class="form-group">
                <label>Add Optional Message</label>
                <textarea class='form-control' v-model='request_message'></textarea>
              </div>
              <button class='btn btn-primary' @click='sendRequest'>Send</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      visible_profiles: this.profiles,
      request_message: '',
      contact_id: null,
      current_user: this.user
    }
  },
  props: ['profiles', 'user'],
  methods: {
    sendRequest() {
      let data = {
        connection_request: {
          "request_message": this.request_message,
          "profile_id": this.current_user.id,
          "contact_id": this.contact_id
        }
      }

      $.ajax({
        url: `/request-manager`,
        type: 'post',
        data: data,
        success: data => {
          this.current_user.profile.receivers.push({ id: this.contact_id })
          this.contact_id = null
          $('#modal-window').modal('toggle')
          this.$emit('new-notice', 'Request sent.')
        },
        error: err => console.log(err)
      })
    },
    updateContactId(contact_id) {
      this.contact_id = contact_id
    }
  }
}
</script>
