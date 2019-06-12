export const withdrawReq = (req_id, cb) => {
  $.ajax({ 
    url: `/request-manager/withdraw/${req_id}`,
    type: 'DELETE',
    success: data => cb(data),
    error: err => console.log(err)
  })
}

export const declineReq = (req_id, cb) => {
  $.ajax({
    url: `/request-manager/${req_id}`,
    type: 'DELETE',
    success: data => cb(data),
    error: err => console.log(err)
  })
}

export const acceptReq = (req_id, cb) => {
  $.ajax({
    url: `/request-manager/${req_id}`,
    type: 'PATCH',
    success: data => cb(data),
    error: err => console.log(err)
  })
} 	   
