<template>
  <div id='modal-window' class="modal hide fade" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" >
    <div class="modal-dialog" role='document'>
      <div class="modal-content">
        <div class="modal-header">
          <h4 id='myModalLabel' class='modal-title'>Send Request</h4>
          <button type="button" class='close' data-dismiss='modal'>x</button>
        </div>
        <div class="modal-body">
          <div class="form">
            <div class="form-group">
              <label>Add Optional Message</label>
              <textarea class='form-control' v-model='requestMessage'></textarea>
            </div>
            <button class='btn btn-primary' @click='$emit("send-request", requestMessage)'>Send</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      requestMessage: ''
    }
  }
}
</script>
