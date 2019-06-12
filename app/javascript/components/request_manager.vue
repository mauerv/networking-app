<script>
	export default {
		props: ['requestor_relationships', 'receiver_relationships'],
		data: function() {
			return {
				receivedRequests: this.requestor_relationships,
				sentRequests: this.receiver_relationships,
				notice: ''
			}
		},
	  watch: {
	  	notice: function() {
	  		return setTimeout(() => this.notice = '', 2000)
	  	}
	  },
		methods: {
	    declineRequest(request_id) {
	      $.ajax({
	        url: `/request-manager/${request_id}`,
	        type: 'DELETE',
	        success: data => {
	        	this.receivedRequests = this.receivedRequests.filter(e => e.id !== request_id)
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
	        	this.receivedRequests = this.receivedRequests.filter(e => e.id !== request_id)
	          this.notice = "Request accepted"  
	        },
	        error: err => console.log(err)
	      })
	    },
	    withdrawRequest(request_id) {
	      $.ajax({ 
	        url: `/request-manager/withdraw/${request_id}`,
	        type: 'DELETE',
	        success: data => {
	          this.sentRequests = this.sentRequests.filter(e => e.id !== request_id)
	          this.notice = "Request withdrawn."
	        },
	        error: err => console.log(err)
	      })
	    }
		}
	}
</script>

<style>
</style>