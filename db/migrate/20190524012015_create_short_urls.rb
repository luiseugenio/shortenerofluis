class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :title
      t.string :shortened_url
      t.integer :visit_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
