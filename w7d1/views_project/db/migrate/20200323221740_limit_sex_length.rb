 class LimitSexLength < ActiveRecord::Migration[5.2]
  def change

    drop_table :cats
  
      create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.text :description, null: false
      t.timestamps
    end
  end
end

a = Cat.new(birth_date: '2015/01/20', color: 'brown', name: 'grumpy',sex: 'f' ,description: 'Cartoon cat, always hungry')