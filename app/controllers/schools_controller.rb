class SchoolsController < ApplicationController
	before_action :authenticate_user!
	respond_to :json
	
	def index 
		school = current_user.school
		render json: school, status: 200
	end
end
