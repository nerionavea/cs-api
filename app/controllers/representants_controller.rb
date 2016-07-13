class RepresentantsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
	def index 
		representants = Representant.joins(:people).where(people: {school: current_user.school})
		render json: representants, status: :ok
	end

	def create
		people = People.joins(:school).where(school: current_user.school, ci: people_params[:ci]).take
		if !people
			people = People.new(params_people)
			if people.save
				representant = Representant.new(representant_params)
				if representant.save
					render json: {people: people, representant: representant}
				else
					render json: {errors: representant.errors}
				end
			else
				render json: {errors: people.errors}
			end
		end
	end

	def representant_params 
		params.require(:representant).permit(:occupation, :bussines)
	end

	def people_params
		params.require(:people).permit(:names, :last_names, :ci, :place_birth, :birth, :address, :sex, presence: true)
	end
end
