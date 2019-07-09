<template>
	<li class='list-group-item d-flex flex-column flex-md-row text-center text-md-left flex-md-wrap align-items-center'>
		<div class='order-1'>
			<a :href="`/profiles/${req.profile_id}`">
				<img v-if='req.profile.image_url' v-bind:src="req.profile.image_url" class='mb-2 avatar'>
				<template v-else>

				</template>
			</a>
		</div>
		<div class='order-2 mr-md-auto'>
			<a :href="`/profiles/${req.profile.id}`">{{ req.profile.name }}</a>
			<p class='subtitle-small mb-0'>{{ req.profile.title }}</p>
			<small><p class='text-muted mb-0'>{{ req.profile.country }}</p></small>
		</div>
		<p v-if="req.request_message" class='order-3 order-md-4 w-100 bg-secondary p-3 rounded mt-md-2'>{{ req.request_message }}</p>
		<div class='mt-1 order-4 order-md-3'>
			<button class='btn btn-primary' @click="$emit('decline-request', req.id)">Ignore</button>
			<button class='btn btn-primary' @click="$emit('accept-request', req.id)">Accept</button>
		</div>
	</li>
</template>

<script>
	export default {
		props: {
			req: {
				type: Object,
				required: true
			}
		}
	}
</script>
