class ImportJob
  include Sidekiq::Worker

  def perform(user_id, json_data)
    if json_data.present?
      movies_data = JSON.parse(json_data)

      movies_data.each do |movie_data|
        title = movie_data['title']
        director = movie_data['director']
        existing_movie = Movie.find_by(title: title, director: director)

        if existing_movie.present?
          puts "O filme '#{title}' dirigido por '#{director}' já existe. Pulando a criação."
        else
          movie = Movie.create(title: title, director: director)
          if movie.errors.any?
            puts "Erro ao criar o filme '#{title}': #{movie.errors.full_messages.join(', ')}"
          else
            puts "Filme '#{title}' criado com sucesso!"
            # Verifica se há uma avaliação disponível e chama o ScoreJob para atualizar a nota do filme
            if movie_data['rating'].present?
              ScoreJob.perform_async(user_id, json_data)
              puts "Chamando ScoreJob para atualizar a nota do filme"
            end
          end
        end
      end
    else
      puts "Nenhum dado JSON fornecido"
    end
  end
end