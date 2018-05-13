require 'rails_helper'

RSpec.describe UsersController do
  describe "POST create" do
    it "creates an user" do
      post :create, params: { user: { email: "test@email.com", password: "password", full_name: "Full Name", username: "testuser" } }

      expect(response.status).to eq(200)

      expect(User.count).to eq(1)
      user = User.last
      expect(user.email).to eq("test@email.com")
      expect(user.full_name).to eq("Full Name")
      expect(user.username).to eq("testuser")
    end
  end
end
