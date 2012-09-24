class StaticController < ApplicationController
  # before_filter :authenticate_user!

  def home
    if(!Album.all.empty?)
      @random_album = Album.first(:order => "RANDOM()")
    end
  end

  def help

  end

  def about

  end
end
