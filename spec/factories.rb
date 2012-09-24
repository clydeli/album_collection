FactoryGirl.define do

  factory :user do
    email "john.doe@sv.cmu.edu"
    username "JohnDoe"
    password "just4now"
    password_confirmation "just4now"
  end

  factory :album do
    artist "ArtistName"
    album_name "AlbumName"
    mbid "aaa-bbb-ccc-ddd-eee"
    img_url "img.jpg"
  end

end