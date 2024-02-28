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
    # Obtém o ID do usuário atual
    user_id = current_user.id
    json_data = params[:file].read
    ImportJob.perform_async(user_id, json_data)
    redirect_to movies_path, notice: "Importação de filmes iniciada."
  end
  
  def exclude
    json_data = params[:file].read
    DeleteJob.perform_async(json_data)
    redirect_to movies_path, notice: "Exclusão de filmes iniciada."
  end

  def submit_score
    json_data = params[:file].read
      # Obtém o ID do usuário atual
      user_id = current_user.id
      # Chama o ScoreJob para processar as classificações em massa
      ScoreJob.perform_async(user_id, json_data)
      redirect_to movies_path, notice: "Classificações enviadas com sucesso!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
