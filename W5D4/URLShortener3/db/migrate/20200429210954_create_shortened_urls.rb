class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true, index: true, presence: true
      t.string :long_url, presence: true
      t.integer :submitter_id, presence: true, index: true

      t.timestamps
    end
  end
end
