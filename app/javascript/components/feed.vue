<script>
import { declineReq, acceptReq } from '../util/helperFunctions'

export default {
	props: ['requests', 'contacts'],
	data() {
		return {
			connection_requests: this.requests
		}
	},
	computed: {
		visibleRequests() {
			return this.connection_requests.slice(0, 3)
		},
		contactsNum() {
			return this.contacts.length
		},
		requestsNum() {
			return this.connection_requests.length
		}
	},
	methods: {
    declineRequest(req_id) {
  		declineReq(req_id, () => {
      	this.connection_requests = this.connection_requests.filter(e => e.id !== req_id)
      	this.$emit('new-notice', "Request declined")
    	})
    },
    acceptRequest(req_id) {
  		acceptReq(req_id, () => {
      	this.connection_requests = this.connection_requests.filter(e => e.id !== req_id)
      	this.$emit('new-notice', "Request accepted")
    	})
    }
	}
}
</script>
