require "spec_helper"

describe Album do

  subject { @album }
  let(:user) { FactoryGirl.create(:user) }
  before { @album = Album.new(artist: "Muse", album_name: "New Born", mbid: "aabbccdd") }

  it { should respond_to(:artist) }
  it { should respond_to(:album_name) }
  it { should respond_to(:mbid) }
  it { should respond_to(:img_url) }
  it { should be_valid }

  describe "when artist is not present" do
    before { @album.artist = " " }
    it { should_not be_valid }
  end

  describe "when album name is not present" do
    before { @album.album_name = " " }
    it { should_not be_valid }
  end

  describe "when music brain id is already taken" do
    before {
      album_duplicates = @album.dup
      album_duplicates.save
    }
    it { should_not be_valid }
  end
end