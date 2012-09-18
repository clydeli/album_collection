class StaticController < ApplicationController
  # before_filter :authenticate_user!

  def home

  end

  def help
    authenticate_user!
  end

  def about

  end
end
