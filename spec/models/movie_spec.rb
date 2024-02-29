require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      movie = Movie.new(title: "Example Movie", director: "Director")
      expect(movie).to be_valid
    end

    it "is not valid without a title" do
      movie = Movie.new(director: "Director")
      expect(movie).not_to be_valid
    end
  end
end
