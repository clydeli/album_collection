class Album < ActiveRecord::Base
  attr_accessible :artist, :album_name, :image_url, :mbid;
  has_and_belongs_to_many :users
end