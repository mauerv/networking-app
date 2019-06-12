<script>
import { 
  withdrawReq,
  acceptReq,
  declineReq 
} from '../util/helperFunctions'

export default {
	props: ['requestor_relationships', 'receiver_relationships'],
	data() {
		return {
			receivedRequests: this.requestor_relationships,
			sentRequests: this.receiver_relationships
		}
	},
	methods: {
    declineRequest(req_id) {
      declineReq(req_id, () => {
        this.receivedRequests = this.receivedRequests.filter(e => e.id !== req_id)
        this.$emit('new-notice', 'Request declined')     
      })
    },
    acceptRequest(req_id) {
      acceptReq(req_id, () => {
        this.receivedRequests = this.receivedRequests.filter(e => e.id !== req_id)
        this.$emit('new-notice', 'Request accepted.')   
      })
    },
    withdrawRequest(req_id) {
    	withdrawReq(req_id, () => {
        this.sentRequests = this.sentRequests.filter(e => e.id !== req_id)
        this.$emit('new-notice', 'Request withdrawn.')	    		
    	})
    }
	}
}
</script>
