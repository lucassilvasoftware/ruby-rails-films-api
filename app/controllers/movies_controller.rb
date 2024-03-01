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
    user_id = current_user.id
    json_data = params[:file].read
    job_id = ImportJob.perform_async(user_id, json_data)

    loop do
      data = Sidekiq::Status::get_all job_id
      puts data["status"]
      sleep 1
      break if data["status"] == "complete"
    end

    redirect_to movies_path, notice: "Importação de filmes concluída."
  end  
  
  def exclude
    json_data = params[:file].read
    job_id = DeleteJob.perform_async(json_data)

    loop do
      data = Sidekiq::Status::get_all job_id
      puts data["status"]
      sleep 1
      break if data["status"] == "complete"
    end

    redirect_to movies_path, notice: "Exclusão de filmes iniciada."
  end

  def submit_score
    json_data = params[:file].read
      user_id = current_user.id
      job_id = ScoreJob.perform_async(user_id, json_data)
      
      loop do
        data = Sidekiq::Status::get_all job_id
        puts data["status"]
        sleep 1
        break if data["status"] == "complete"
      end
  
      redirect_to movies_path, notice: "Classificações enviadas com sucesso!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
