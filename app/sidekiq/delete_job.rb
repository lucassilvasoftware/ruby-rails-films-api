class DeleteJob
  include Sidekiq::Job

  def perform(json_data)
    if json_data.present?
      movies_data = JSON.parse(json_data)

      movies_data.each do |movie_data|
        title = movie_data['title']
        director = movie_data['director']
        movie = Movie.find_by(title: title, director: director)
        movie.destroy if movie.present?
      end
    else
      puts "Nenhum dado JSON fornecido"
    end
  end
end
