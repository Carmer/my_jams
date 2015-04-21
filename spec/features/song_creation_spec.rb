require 'rails_helper'

RSpec.describe 'User creates a song' do
  context 'with valid attributes' do
    it 'saves and displays the song title' do
      visit new_song_path
      fill_in "song[title]", with: "Song1"
      fill_in "song[artist]", with: "Artist1"
      click_link_or_button "Create Song"
      save_and_open_page
      expect(page).to have_content("Song1")
      expect(page).to have_content("Artist1")
    end
  end
end
