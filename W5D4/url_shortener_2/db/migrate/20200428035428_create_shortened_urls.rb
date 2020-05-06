class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true, index: true
      t.string :long_url
      t.integer :user_id, index: true
    end
  end
end
