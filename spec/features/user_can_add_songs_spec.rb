require "rails_helper"

RSpec.describe "user adds songs" do
  let(:user) {User.create(
  first_name: "Andrew",
  last_name: "Carmer",
  username: "ajcarmer",
  password: "password",
  password_confirmation: "password"
  )}

end
