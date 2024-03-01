class ScoreJob
  include Sidekiq::Job
  include Sidekiq::Status::Worker # enables job status tracking


  def perform(user_id, json_data)
    if json_data.present?
      ratings_data = JSON.parse(json_data)

      ratings_data.each do |rating_data|
        title = rating_data['title']
        director = rating_data['director']
        rating = rating_data['rating'].to_i

        if rating.present? # Verifica se há uma classificação presente
          # Encontra o filme pelo título e diretor
          movie = Movie.find_by(title: title, director: director)

          if movie.present?
            # Encontra ou inicializa a relação do usuário com o filme
            user_movie = UserMovie.find_or_initialize_by(user_id: user_id, movie_id: movie.id)
            # Atualiza a classificação do usuário para o filme
            user_movie.update(score: rating)
          else
            puts "Filme '#{title}' dirigido por '#{director}' não encontrado."
          end
        else
          puts "Classificação não encontrada para o filme '#{title}' dirigido por '#{director}'."
        end
      end

    else
      puts "Nenhum dado JSON fornecido"
    end
  end

end
