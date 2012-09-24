require 'spec_helper'

describe AlbumController do

  let(:user){ FactoryGirl.create(:user) }
  let(:album){ FactoryGirl.create(:album) }
  subject {page}
  describe "Show Random User on Album Page" do
    before {
      user.albums << album
      visit 'album/1'
    }

    it { should have_content(album.artist) }
    it { should have_content(album.album_name) }
    it { should have_content(user.username) }
  end

end
