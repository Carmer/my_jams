require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(first_name: "Andrew", last_name: "Carmer", username: "ajcarmer", password: "password", password_confirmation: "password")}

  it "is valid" do
      expect(user).to be_valid
  end

  it "is invalid without first name" do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it "is invalid without last name" do
    user.last_name = nil
    expect(user).not_to be_valid
  end

  it "is invalid without username" do
    user.username = nil
    expect(user).not_to be_valid
  end

  it "is invalid without password" do
    user.password = nil
    expect(user).not_to be_valid
  end

end
