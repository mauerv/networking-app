<script>
import {  withdrawReq, acceptReq, declineReq } from '../util/helperFunctions'

export default {
	data() {
		return {
			currentUser: this.user,
			requestMessage: '',
			connectionRequest: this.request,
		}
	},
	props: ['request', 'profile', 'user'],
  computed: {
    isContact() {
      return this.currentUser.profile.contacts.filter(e => e.id === this.profile.id).length !== 0
    },
    isRequestor() {
      return this.currentUser.profile.requestors.filter(e => e.id === this.profile.id).length !== 0
    },
    isReceiver() {
      return this.currentUser.profile.receivers.filter(e => e.id === this.profile.id).length !== 0
    }
  },
  methods: {
    sendRequest(message) {
      let data = {
        connection_request: {
          "request_message": message,
          "profile_id": this.currentUser.id ,
          "contact_id": this.profile.id
        }
      }

      $.ajax({
        url: `/request-manager`,
        type: 'post',
        data: data,
        success: data => {
          this.connectionRequest = { id: data.id }
          this.currentUser.profile.receivers.push(this.profile)
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
          this.connectionRequest = null
          this.currentUser.profile.contacts = this.currentUser.profile.contacts.filter(e => e.id !== this.profile.id)
          this.$emit('new-notice', 'Contact removed.')
        },
        error: (err) => console.log(err)
      })
    },
    withdrawRequest(req_id) {
      withdrawReq(req_id, () => {
        this.currentUser.profile.receivers = this.currentUser.profile.receivers.filter(e => e.id !== this.profile.id)
          this.$emit('new-notice', 'Request withdrawn.')
      })
    },
    declineRequest(req_id) {
      declineReq(req_id, () => {
        this.currentUser.profile.requestors = this.currentUser.profile.requestors.filter(e => e.id !== this.profile.id)
        this.$emit('new-notice', 'Request declined')
      })
    },
    acceptRequest(req_id) {
      acceptReq(req_id, () => {
        this.currentUser.profile.requestors = this.currentUser.profile.requestors.filter(e => e.id !== this.profile.id)
        this.currentUser.profile.contacts.push(this.profile)
        this.$emit('new-notice', 'Request accepted.')
      })
    }
  }
}
</script>
