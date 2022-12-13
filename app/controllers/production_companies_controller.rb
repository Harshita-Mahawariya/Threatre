class ProductionCompaniesController < ApplicationController

  def index
    @production_companies = ProductionCompany.all
  end
	
  def create
    @production_company = ProductionCompany.new(production_company_params)
    if @production_company.save
    	# byebug
    	# @movie = Movie.where(production_company_id: @production_company.id)
      # render json: {production_company: @production_company, movies: @movie}, status: :created
    render json: @production_company, include: :movies
    else
      render json: {errors: @production_company.errors.full_messages}
    end
  end

  private 

  def production_company_params
		params.require(:production_company).permit(:name, :turnover, movies_attributes: [:name, :budget, :duration, :_destroy])
	end

end
