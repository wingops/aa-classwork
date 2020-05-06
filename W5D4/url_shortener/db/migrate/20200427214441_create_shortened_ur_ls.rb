class CreateShortenedUrLs < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_ur_ls do |t|
      t.string :short_url, index: true, unique: true
      t.string :long_url
      t.integer :user_id, index: true
    end
  end
end
