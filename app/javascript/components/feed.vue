<script>
import { declineReq, acceptReq } from '../util/helperFunctions'

export default {
	props: ['requests', 'contacts'],
	data() {
		return {
			connectionRequests: this.requests
		}
	},
	computed: {
		visibleRequests() {
			return this.connectionRequests.slice(0, 3)
		},
		contactsNum() {
			return this.contacts.length
		},
		requestsNum() {
			return this.connectionRequests.length
		}
	},
	methods: {
    declineRequest(req_id) {
  		declineReq(req_id, () => {
      	this.connectionRequests = this.connectionRequests.filter(e => e.id !== req_id)
      	this.$emit('new-notice', "Request declined")
    	})
    },
    acceptRequest(req_id) {
  		acceptReq(req_id, () => {
      	this.connectionRequests = this.connectionRequests.filter(e => e.id !== req_id)
      	this.$emit('new-notice', "Request accepted")
    	})
    }
	}
}
</script>
