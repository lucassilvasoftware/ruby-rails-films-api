require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  it "associates user with movie" do
    user = User.create(email: "example@example.com", password: "password")
    movie = Movie.create(title: "Example Movie", director: "Director")
    user_movie = UserMovie.create(user_id: user.id, movie_id: movie.id, score: 5)
    
    expect(user.movies.count).to eq(1)
    expect(movie.users.count).to eq(1)
    expect(user_movie.user).to eq(user)
    expect(user_movie.movie).to eq(movie)
  end
end
