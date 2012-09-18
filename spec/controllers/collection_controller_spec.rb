require 'spec_helper'

describe CollectionController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'data'" do
    it "returns http success" do
      get 'data'
      response.should be_success
    end
  end

end
