class CreateUserAlbumTable < ActiveRecord::Migration
  def self.up
    create_table :albums_users, :id => false do |t|
      t.references :album
      t.references :user
    end
    add_index :albums_users, [:user_id, :album_id]
    add_index :albums_users, [:album_id, :user_id]
  end

  def self.down
    drop_table :albums_users
  end
end
