require "rails_helper"

RSpec.describe "users songs" do
  let(:user) {User.create(
  first_name: "Andrew",
  last_name: "Carmer",
  username: "ajcarmer",
  password: "password",
  password_confirmation: "password"
  )}

  let!(:users_songs) do
    user.songs.create(
    title: "Song1",
    artist: "Artist1",
    user_id: user.id
    )
    user.songs.create(
      title: "Song2",
      artist: "Artist2",
      user_id: user.id
      )
    end


  context "when user has songs" do

    it "shows users songs" do
      #logged in
      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      expect(current_path).to eq(login_path)
      click_button("Login")

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.songs.first.title)
      expect(page).to have_content(user.songs.last.artist)

    end
  end
end
