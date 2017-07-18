class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :listing
      t.date :check_in
      t.date :check_out
      t.timestamps
    end
  end
end
