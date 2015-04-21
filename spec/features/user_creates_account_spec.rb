require 'rails_helper'

RSpec.describe "account creation" do
  context "with valid attributes" do
    it "creates a new account" do
      visit new_user_path
      fill_in "First name", with: "Andrew"
      fill_in "Last name", with: "Carmer"
      fill_in "Username", with: "ajcarmer"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content("Welcome ajcarmer!")
    end
  end
  context "with missing fields" do
    it "does not create account if no first name" do
      visit new_user_path
      fill_in "First name", with: nil
      fill_in "Last name", with: "Carmer"
      fill_in "Username", with: "ajcarmer"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content("First name can't be blank")
    end

    it "does not create account if no last name" do
      visit new_user_path
      fill_in "First name", with: "Andrew"
      fill_in "Last name", with: nil
      fill_in "Username", with: "ajcarmer"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content("Last name can't be blank")
    end

    it "does not create account if no username" do
      visit new_user_path
      fill_in "First name", with: "Andrew"
      fill_in "Last name", with: "Carmer"
      fill_in "Username", with: nil
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content("Username can't be blank")
    end

    it "does not create account if no password" do
      visit new_user_path
      fill_in "First name", with: "Andrew"
      fill_in "Last name", with: "Carmer"
      fill_in "Username", with: "ajcarmer"
      fill_in "Password", with: nil
      fill_in "Password confirmation", with: "password"
      click_button "Create User"

      expect(page).to have_content("Password can't be blank")
    end

    it "does not create account if no password confirmation" do
      visit new_user_path
      fill_in "First name", with: "Andrew"
      fill_in "Last name", with: "Carmer"
      fill_in "Username", with: "ajcarmer"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: nil
      click_button "Create User"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
