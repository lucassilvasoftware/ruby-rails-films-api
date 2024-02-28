class ScoreJob
  include Sidekiq::Worker

  def perform(json_data, user_id)
    scores_data = JSON.parse(json_data)
    
    scores_data.each do |score_data|
      title = score_data['title']
      director = score_data['director']
      rating = score_data['rating']
      
      movie = Movie.find_by(title: title, director: director)
      
      if movie.present?
        movie.user_movies.find_or_initialize_by(user_id: user_id).update(score: rating)
      else
        puts "Filme '#{title}' dirigido por '#{director}' não encontrado."
      end
    end
  end
end
