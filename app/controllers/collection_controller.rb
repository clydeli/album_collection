class CollectionController < ApplicationController

  def show
    if (User.find_all_by_username(params[:username]).empty? )
      redirect_to root_path
    else
      @user = User.find_by_username(params[:username])
      @user_collection = User.find_by_username(params[:username]).albums.sort_by {|x|[x.artist, x.album_name]}
      respond_to do |format|
        format.html
        format.xml  { render :xml => @user_collection }
        format.json { render :json => @user_collection }
      end
    end
  end

  def edit
    authenticate_user!
    @user_collection = User.find_by_username(current_user.username).albums.sort_by {|x|[x.artist, x.album_name]}
  end


end
