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

    context "with blank email" do
      it "returns an error" do
        post :create, params: { user: { email: "", password: "password", full_name: "Full Name", username: "testuser" } }

        expect(response.status).to eq(422)
        json = JSON.parse(response.body)
        expect(json["errors"]).to eq(["Email can't be blank"])
      end
    end

    context "with no parameter" do
      it "returns an error" do
        post :create

        expect(response.status).to eq(422)
        json = JSON.parse(response.body)
        expect(json["errors"]).to include("Email can't be blank")
      end
    end
  end
end
