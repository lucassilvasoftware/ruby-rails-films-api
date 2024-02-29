require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST /create" do
    it "creates a new user" do
      post :create, params: { user: { email: "example@example.com", password: "password" } }
      
      expect(response).to redirect_to(movies_path)
      expect(User.count).to eq(1)
    end
  end
end
