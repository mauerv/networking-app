class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
    	t.integer :profile_id
    	t.integer :contact_id
      t.timestamps
    end
  end
end
