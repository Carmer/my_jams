require "rails_helper"

RSpec.describe "user logout" do

  let(:user) {User.create(
  first_name: "Andrew",
  last_name: "Carmer",
  username: "ajcarmer",
  password: "password",
  password_confirmation: "password"
  )}

  it "can log user out" do
  #login
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    expect(current_path).to eq(login_path)
    click_button("Login")
  #now logged in
    click_link "Logout"
    expect(current_path).to eq(login_path)
  end
end
