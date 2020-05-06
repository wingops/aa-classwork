class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, presence: true, unique: true, index: true

      t.timestamps
    end
  end
end
