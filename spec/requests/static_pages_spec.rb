require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Homepage" do
    before {
      #FactoryGirl.create(:album)
      visit root_path
    }
    it { should have_content('sign up') }
    it { should have_content('sign in') }
    it { should have_selector('h1', :text => "SHELV") }
    it { should have_selector('title', :text => '| Home')}

  end

  #describe "AboutPage" do

  #end
end
