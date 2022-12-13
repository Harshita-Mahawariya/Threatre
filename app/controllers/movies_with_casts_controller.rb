class MoviesWithCastsController < ApplicationController
  include ActiveStorage::Blob::Analyzable
	# def new
  #   @movieswithcasts = MoviesWithCast.new
  # end

  # def create
  #   @movieswithcasts = MoviesWithCast.new(movies_with_cast_params)
    
  #   if @movieswithcasts.save
  #     redirect_to movies_path
  #   else
  #     flash[:danger] = 'Something went wrong.'
  #     render 'new'
  #   end
  # end
  def create
    @movieswithcasts = MoviesWithCast.new(movies_with_cast_params)
    if @movieswithcasts.save
      render json: {result: @movieswithcasts}, status: :created
    else 
      render json: {message: "Not saved"}, status: :unprocessable_entity
    end
  end

  private

  def movies_with_cast_params
    params.require(:movies_with_cast).permit!
  end

end
