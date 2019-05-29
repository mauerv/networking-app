require 'test_helper'

class ConnectionRequestTest < ActiveSupport::TestCase
  setup do
  	@mauro = profiles(:mauro)
  	@emi = profiles(:emi)
  end	

  test "Can't create a request that already exists" do
    ConnectionRequest.create(profile_id: @mauro.id, contact_id: @emi.id)
    request = ConnectionRequest.new(profile_id: @mauro.id, contact_id: @emi.id)
  	assert_not request.save
  end

 test "Can't create a request when the reciprocal exists" do
    ConnectionRequest.create(profile_id: @mauro.id, contact_id: @emi.id)
    request = ConnectionRequest.new(profile_id: @emi.id , contact_id: @mauro.id)
    assert_not request.save
 end

  test "Can't create a request to herself" do
    connection = ConnectionRequest.new(profile_id: @mauro.id, contact_id: @mauro.id)
    assert_not connection.save
 	end

 	test "Can't create a request to a contact" do
 		Connection.create(profile_id: @mauro.id , contact_id: @emi.id)	
 		Connection.create(profile_id: @emi.id , contact_id: @mauro.id)
 		request = ConnectionRequest.new(profile_id: @emi.id , contact_id: @mauro.id)
 		assert_not request.save
 	end
end
