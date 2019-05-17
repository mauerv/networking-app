class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :title
      t.string :country
      t.text :description
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
