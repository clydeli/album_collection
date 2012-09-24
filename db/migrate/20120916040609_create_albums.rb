class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table(:albums) do |t|
      t.string :artist,                   :null => false, :default => ""
      t.string :album_name,               :null => false, :default => ""
      t.string :img_url,                  :null => false, :default => ""
      t.string :mbid,                     :null => false, :default => ""
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
