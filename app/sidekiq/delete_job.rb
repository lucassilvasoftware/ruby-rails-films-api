class DeleteJob
  include Sidekiq::Job

  def perform(json_data)
    if json_data.present?
      movies_data = JSON.parse(json_data)

      movies_data.each do |movie_data|
        title = movie_data['title']
        director = movie_data['director']
        movie = Movie.find_by(title: title, director: director)
        next unless movie.present? # Pula para o próximo filme se não encontrar o filme

        # Exclui as notas do filme da tabela user_movies
        UserMovie.where(movie_id: movie.id).destroy_all

        # Agora podemos excluir o filme
        movie.destroy
      end
    else
      puts "Nenhum dado JSON fornecido"
    end
  end
end
