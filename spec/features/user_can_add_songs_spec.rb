require "rails_helper"

RSpec.describe "user adds songs" do
  let(:user) {User.create(
  first_name: "Andrew",
  last_name: "Carmer",
  username: "ajcarmer",
  password: "password",
  password_confirmation: "password"
  )}

  context "when logged in" do
    it "can add a song to user page" do
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      expect(current_path).to eq(login_path)
      click_button("Login")

      visit user_path(user)
      click_link "Add Jam"
      expect(current_path).to eq(new_song_path)
      fill_in "Title", with: "NewExample1"
      fill_in "Artist", with: "Artist1"
      click_button "Add that Jam!"
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.username)
      expect(page).to have_content(user.songs.first.title)
      expect(page).to have_content(user.songs.first.artist)
    end
  end
end
