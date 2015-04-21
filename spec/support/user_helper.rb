class UserHelper

  def create_user
    User.create(
    first_name: "Andrew",
    last_name: "Carmer",
    username: "ajcarmer",
    password: "password",
    password_confirmation: "password"
    )
  end

  def login
    visit login_path
    fill_in "Username", with: create_user.username
    fill_in "Password", with: create_user.password
    expect(current_path).to eq(login_path)
    click_button("Login")
  end

end
