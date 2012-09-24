require "spec_helper"

describe User do

  subject { @user }
  before { @user = User.new(email: "john.doe@sv.cmu.edu", username: "JohnDoe", password: "just4now", password_confirmation: "just4now") }

  it { should respond_to(:username) }
  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when username is too short" do
    before { @user.username = "john" }
    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before {
      user_duplicates = @user.dup
      user_duplicates.username = @user.username.upcase
      user_duplicates.save
    }
    it { should_not be_valid }
  end

end