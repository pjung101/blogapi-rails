require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST create" do
    it "returns JWT token" do
      create(:user, email: "test@email.com", password: "password")

      post :create, params: { user: { email: "test@email.com", password: "password" } }

      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json["token"]).to be
    end

    context "with invalid email" do
      it "returns an error" do
        create(:user, email: "test@email.com", password: "password")

        post :create, params: { user: { email: "invalid@email.com", password: "password" } }

        expect(response.status).to eq(422)
        json = JSON.parse(response.body)
        expect(json["errors"]).to eq(["Invalid email or password"])
      end
    end
  end
end
