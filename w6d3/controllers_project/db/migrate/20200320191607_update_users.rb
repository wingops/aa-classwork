class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    
    create_table :users do |t|
      t.string :username, null: false, unique: true
    end
  end
end
