require 'test_helper'

class SongCreationTest <ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in "song[title]", with: "Song1"
    fill_in "song[artist]", with: "Artist1"
    click_link_or_button "Create Song"
    save_and_open_page
    assert page.has_content?("Song1")
    assert page.has_content?("Artist1")
  end
end
