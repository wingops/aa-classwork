class ChangeShortenedUrlObjectType < ActiveRecord::Migration[5.2]
  def change
    change_column :visits, :visited_short_url, 'integer USING CAST (visited_short_url AS integer)'
    
  end
end
