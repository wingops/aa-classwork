class DropUrlTableAddCorrectName < ActiveRecord::Migration[5.2]
  def change
    drop_table :shortened_ur_ls
    create_table :shortened_urls do |t|
      t.string :shortened_url, 
    end
  end
end
