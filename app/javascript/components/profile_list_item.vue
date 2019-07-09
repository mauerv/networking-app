<template>
  <div>
    <li class="list-group-item d-flex flex-md-row text-md-left flex-wrap border-right-0 border-left-0">
    	<div class="order-1 mr-auto mr-md-0">
        <a :href="`/profiles/${profile.id}`">
          <img v-if='profile.image_url' v-bind:src='profile.image_url' class='mb-2 avatar'>
          <template v-else>

          </template>
        </a>
    	</div>
    	<div class="order-3 order-md-2 mr-md-auto w-100 w-md-auto">
        <a :href="`/profiles/${profile.id}`" class='mb-0 text-primary font-weight-bold'>{{ profile.name }}</a>
    		<p class="mb-0 text-wrap">{{ profile.title }}	</p>
    		<small class="mt-0"><p>{{ profile.country }}</p></small>
    	</div>
    	<div class="order-2 order-md-3 align-self-center">
        <a
          v-if="current_user.id == profile.id"
          :href="`/profiles/${current_user.id}/edit`"
          class='btn btn-primary'
        > Edit Profile </a>
        <a
          v-else-if="isContact"
          class='btn btn-primary'
          href='#/'
        > Email </a>
        <button
          v-else-if="isReceiver"
          class='btn btn-primary disabled'
          href='#/'
        > Connect </button>
        <template v-else-if="isRequestor"></template>
        <button v-else class='btn btn-primary' data-target='#modal-window' data-toggle='modal' @click="$emit('create-request', profile.id)"> Connect </button>
    	</div>
    </li>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        current_user: this.user
      }
    },
    props: ['profile', 'user'],
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
    }
  }
</script>
