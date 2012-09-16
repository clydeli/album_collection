class HomeController < ApplicationController
  # To change this template use File | Settings | File Templates.
  before_filter :authenticate_user!

  def index

  end
end