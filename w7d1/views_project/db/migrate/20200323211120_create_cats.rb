class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end

# a = Cat.new(birth_date: '2015/01/20', color: 'brown', name: 'grumpy',sex: 'mf' ,description: 'Cartoon cat, always hungry')

# Cat.create!(birth_date: '2013/01/20', color: 'black', name: 'smiley',sex: 'f' ,description: 'Cartoon cat, always hungry')

# Cat.create!(birth_date: '2011/01/20', color: 'blue', name: 'kitty',sex: 'f' ,description: 'Cartoon cat, always hungry')

# Cat.create!(birth_date: '2010/01/20', color: 'pink', name: 'frowney',sex: 'f' ,description: 'Cartoon cat, always hungry')