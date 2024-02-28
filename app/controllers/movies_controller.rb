class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def import    
    # Obtém os dados JSON do parâmetro :json_data
    json_data = params[:json_data]
  
    # Verifica se os dados JSON foram fornecidos
    if json_data.present?
      # Converte os dados JSON em um array de objetos
      movies_data = JSON.parse(json_data)
  
      # Loop no array
      movies_data.each do |movie_data|
        # Acessa os campos 'title' e 'director' de cada objeto de filme
        title = movie_data['title']
        director = movie_data['director']

        # Cria um novo filme com os dados do JSON
        @movie = Movie.create(title: title, director: director)

  
        # Verifica se houve erro ao criar o filme
        if @movie.errors.any?
          # Se ocorrer um erro ao criar o filme, exibe a mensagem de erro
          puts "Erro ao criar o filme '#{movie_data['title']}': #{@movie.errors}"
        else
          # Se o filme for criado com sucesso, exibe uma mensagem de sucesso
          puts "Filme '#{movie_data['title']}' criado com sucesso!"
        end
      end
    else
      puts "Nenhum dado JSON fornecido"
    end
  end
  

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
