class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :price
      t.timestamps
    end
  end
end
