<script>
	export default {
		data: function() {
			return {
				notice: '',
				connection_requests: this.requests
			}
		},
		props: ['requests', 'contacts'],
		computed: {
			visibleRequests: function() {
				return this.connection_requests.slice(0, 3)
			},
			contactsNum: function() {
				return this.contacts.length
			},
			requestsNum: function() {
				return this.connection_requests.length
			}
		},
		methods: {
	    declineRequest(request_id) {
	      $.ajax({
	        url: `/request-manager/${request_id}`,
	        type: 'DELETE',
	        success: data => {
	        	this.connection_requests = this.connection_requests.filter(e => e.id !== request_id)
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
	        	this.connection_requests = this.connection_requests.filter(e => e.id !== request_id)   
	          this.notice = "Request accepted"  
	        },
	        error: err => console.log(err)
	      })
	    }
		}
	}
</script>

<style>
</style>