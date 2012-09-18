require 'spec_helper'

describe "StaticPages - Home" do
  describe "GET Homepage" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      # get static_index_path
      page.should have_content('me');
      # response.status.should be(200)
    end
  end
end
