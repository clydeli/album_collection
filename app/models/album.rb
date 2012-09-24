class Album < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :artist, :album_name, :img_url, :mbid

  validates_presence_of :artist, :album_name, :mbid
  validates_uniqueness_of :mbid
end