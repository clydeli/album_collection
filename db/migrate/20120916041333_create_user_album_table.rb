class CreateUserAlbumTable < ActiveRecord::Migration
  def self.up
    create_table :user_album, :id => false do |t|
      t.references :user
      t.references :album
    end
    add_index :user_album, [:user_id, :album_id]
    add_index :user_album, [:album_id, :user_id]
  end

  def self.down
    drop_table :user_album
  end
end
