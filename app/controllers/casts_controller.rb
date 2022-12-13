class CastsController < ApplicationController
	include ActiveStorage::Blob::Analyzable
	def index
    @casts = Cast.all
  end

	def show
		@cast = Cast.find_by(id: params[:id])
	end

	def new
		@cast = Cast.new
	end 

	def create
		@cast = Cast.new(cast_params)
		if @cast.save
			 # @c = MoviesWithCast.create(movie_id: , cast_id: Cast.last.id)
			redirect_to movies_path
		else
			flash[:danger] = 'Something went wrong.'
      render 'new'
		end
	end

	def edit
		@cast = Cast.find_by(id: params[:id])
	end

	def update
		@cast = Cast.find_by(id: params[:id])
		@cast.update(cast_params)
		if @cast.save
			redirect_to casts_path
		end
	end

	private
	def cast_params
    params.require(:cast).permit(:name, :mobile_number, :experience, :number_of_movies, :profile_image)
  end

end