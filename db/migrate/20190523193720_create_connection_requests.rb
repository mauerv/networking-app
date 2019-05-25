class CreateConnectionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :connection_requests do |t|
    	t.integer :profile_id
    	t.integer :contact_id
      t.string :request_message
      t.timestamps 
    end
  end
end
