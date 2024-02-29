# spec/requests/movies_controller_spec.rb

require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  describe "POST /create" do
    context "when user is authenticated" do
      let!(:user) { User.create(email: "test@example.com", password: "password") }

      before do
        post sessions_path, params: { email: user.email, password: "password" }
      end

      it "creates a new movie and redirects to movies index" do
        post movies_path, params: { movie: { title: "Test Movie", director: "Test Director" } }

        expect(response).to redirect_to(movies_path)
        expect(Movie.last.title).to eq("Test Movie")
        expect(Movie.last.director).to eq("Test Director")
      end
    end

    context "when user is not authenticated" do
      it "does not create a new movie and redirects to login page" do
        post movies_path, params: { movie: { title: "Test Movie", director: "Test Director" } }

        expect(response).to redirect_to("/login")
        expect(Movie.count).to eq(0)
      end
    end
  end
end
