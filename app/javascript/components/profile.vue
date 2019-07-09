<script>
import {  withdrawReq, acceptReq, declineReq } from '../util/helperFunctions'

export default {
	data() {
		return {
			current_user: this.user,
			request_message: '',
			connection_request: this.request,
		}
	},
	props: ['request', 'profile', 'user'],
  computed: {
    isContact() {
      return this.current_user.profile.contacts.filter(e => e.id === this.profile.id).length !== 0
    },
    isRequestor() {
      return this.current_user.profile.requestors.filter(e => e.id === this.profile.id).length !== 0
    },
    isReceiver() {
      return this.current_user.profile.receivers.filter(e => e.id === this.profile.id).length !== 0
    }
  },
  methods: {
    sendRequest() {
      let data = {
        connection_request: {
          "request_message": this.request_message,
          "profile_id": this.current_user.id ,
          "contact_id": this.profile.id
        }
      }

      $.ajax({
        url: `/request-manager`,
        type: 'post',
        data: data,
        success: data => {
          this.connection_request = { id: data.id }
          this.current_user.profile.receivers.push(this.profile)
          $('#modal-window').modal('toggle')
          this.$emit('new-notice', 'Request sent.')
        },
        error: err => console.log(err)
      })
    },
    removeContact(profile_id) {
      $.ajax({
        url: `/contacts/${profile_id}`,
        type: 'DELETE',
        success: data => {
          this.connection_request = null
          this.current_user.profile.contacts = this.current_user.profile.contacts.filter(e => e.id !== this.profile.id)
          this.$emit('new-notice', 'Contact removed.')
        },
        error: (err) => console.log(err)
      })
    },
    withdrawRequest(req_id) {
      withdrawReq(req_id, () => {
        this.current_user.profile.receivers = this.current_user.profile.receivers.filter(e => e.id !== this.profile.id)
          this.$emit('new-notice', 'Request withdrawn.')
      })
    },
    declineRequest(req_id) {
      declineReq(req_id, () => {
        this.current_user.profile.requestors = this.current_user.profile.requestors.filter(e => e.id !== this.profile.id)
        this.$emit('new-notice', 'Request declined')
      })
    },
    acceptRequest(req_id) {
      acceptReq(req_id, () => {
        this.current_user.profile.requestors = this.current_user.profile.requestors.filter(e => e.id !== this.profile.id)
        this.current_user.profile.contacts.push(this.profile)
        this.$emit('new-notice', 'Request accepted.')
      })
    }
  }
}
</script>
