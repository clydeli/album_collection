require 'spec_helper'

describe CollectionController do
  let(:user){ FactoryGirl.create(:user) }
  let(:album){ FactoryGirl.create(:album) }
  subject {page}
  describe "Show Random User/Album on Homepage" do
    before {
      user.albums << album
      visit root_path
    }

    it { should have_content(album.artist) }
    it { should have_content(album.album_name) }
    it { should have_content(user.username) }
  end

  describe "Show User Collection" do
    before {
      user.albums << album
      visit '/'+user.username
    }

    #it { should have_content(album.artist) }
    #it { should have_content(album.album_name) }
  end

end
