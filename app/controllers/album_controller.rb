
class AlbumController < ApplicationController
  def show
    @album = Album.find_by_id(params[:album_id])
    @album_listeners = Album.find(params[:album_id]).users(:limit => 5, :order => "RANDOM()")
  end

  def create
    authenticate_user!
    logger.debug(params[:album]);
    if (Album.find_all_by_mbid(params[:mbid]).count == 0)
      current_user.albums.create(artist: params[:artist], album_name: params[:album], img_url: params[:img_url], mbid: params[:mbid])

    elsif (current_user.albums.find_all_by_mbid(params[:mbid]).count == 0)
      current_user.albums << Album.find_by_mbid(params[:mbid])
    end
    render :nothing => true
  end

  def destroy
    authenticate_user!
    if(Album.find_by_mbid(params[:mbid]).users.find_by_id(current_user) != nil)
      Album.find_by_mbid(params[:mbid]).users.delete(current_user);
    end
    render :nothing => true
  end
end
