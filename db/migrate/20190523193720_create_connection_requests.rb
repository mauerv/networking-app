class CreateConnectionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :connection_requests do |t|
    	t.integer :requestor_id
    	t.integer :receiver_id
      t.string :request_message
      t.timestamps 
    end
    add_index :connection_requests, :requestor_id
    add_index :connection_requests, :receiver_id
    add_index :connection_requests, [:requestor_id, :receiver_id], unique: true
  end
end
