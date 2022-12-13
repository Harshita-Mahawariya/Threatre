class MoviesController < ApplicationController
  include ActiveStorage::Blob::Analyzable
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @p = ProductionCompany.find_by(id: @movie[:production_company_id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      redirect_to movies_path
    else
      flash[:flash] = 'Something went wrong.'
      render 'new'
    end
  end

  def destroy
  	@movie = Movie.find_by(id: params[:id])
  	if @movie.destroy
      redirect_to movies_path
    else
      flash[:danger] = 'Could not be deleted'
    end
  end

  def edit
  	@movie = Movie.find_by(id: params[:id])
  end

  def update
  	@movie = Movie.find_by(id: params[:id])
  	@movie.update(movie_params)
  	if @movie.save
      redirect_to movies_path
    else
      # flash[:danger] = @movie.errors.full_messages
      flash[:danger] = 'Something went wrong.'
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :duration, :budget, :production_company_id, :poster, casts_attributes:[:id, :name, :mobile_number, :experience, :number_of_movies, :profile_image, :_destroy])
  end

end
