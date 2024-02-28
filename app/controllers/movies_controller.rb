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
    puts "Chamou import"
    
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
  
        # Imprime o nome do filme e do diretor
        puts "Filme: #{title}, Diretor: #{director}"
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
