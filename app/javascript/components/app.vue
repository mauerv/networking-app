<script>
	export default {
		data() {
			return { notices: [] }
		},
		methods: {
			addNotice(text) {
				this.notices.push(text)
				setTimeout(() => this.notices.shift(), 2000)
			}
		}
	}
</script>
