class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :street_address, null: false
      t.text :city, null: false
      t.text :state, null: false
      t.text :country, null: false

      t.timestamps
    end
  end
end
