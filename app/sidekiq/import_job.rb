class ImportJob
  include Sidekiq::Job

  def perform(json_data)
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
          end
        end
      end
    else
      puts "Nenhum dado JSON fornecido"
    end
  end
end

