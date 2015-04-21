require "rails_helper"

RSpec.describe "user can login" do

    let(:user) {User.create(
    first_name: "Andrew",
    last_name: "Carmer",
    username: "ajcarmer",
    password: "password",
    password_confirmation: "password"
    )}
    
  context "with valid credentials" do

    it "authenticates and sends user to dashboard" do
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      expect(current_path).to eq(login_path)
      click_button("Login")
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome ajcarmer!")
    end
  end

  context "does not have valid credentials" do

    it "alerts user and allows new login attempt when password doesnt match username" do
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: "pa$$word"
      expect(current_path).to eq(login_path)
      click_button("Login")
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Credentials!")
    end
  end
end
