require 'rails_helper'

RSpec.describe UserMoviesController, type: :controller do
  describe "POST /create" do
    it "creates user movie record" do
      user = User.create(email: "example@example.com", password: "password")
      movie = Movie.create(title: "Example Movie", director: "Director")
      post :create, params: { user_movie: { movie_id: movie.id, score: 5 } }, session: { user_id: user.id }
      
      expect(response).to redirect_to(movies_path)
      expect(user.movies.count).to eq(1)
      expect(movie.users.count).to eq(1)
    end
  end
  
  describe "PATCH /update" do
    it "updates user movie record" do
      user = User.create(email: "example@example.com", password: "password")
      movie = Movie.create(title: "Example Movie", director: "Director")
      user_movie = UserMovie.create(user_id: user.id, movie_id: movie.id, score: 5)
      patch :update, params: { id: user_movie.id, user_movie: { movie_id: movie.id, score: 4 } }, session: { user_id: user.id }
      
      expect(response).to redirect_to(movies_path)
      expect(user_movie.reload.score).to eq(4)
    end
  end
end
