class PeopleController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index 
  	people = People.joins(:school).where(school: current_user.school)
  	render json: people
  end

  def create
  	people = People.new(people_params)
  	people.school = current_user.school
  	if people.save 
  		render json: people, status: :ok
  	else
  		render  json: {errors: people.errors}, status: :forbidden
  	end
  end

  def show 
    people = People.joins(:school).where(school: current_user.school, id: params[:id]).take
    if people
      render json: people, status: :ok
    else
      render json: {error: 'not found'}, status: :not_found
    end
  end

  def update 
    people = People.joins(:school).where(id: params[:id], school: current_user.school).take
    if people.update(people_params)
      render json: people
    else
      render json: {errors: people.errors}, status: :forbidden
    end
  end

  def people_params
  	params.require(:people).permit(:names, :last_names, :ci, :place_birth, :birth, :address, :sex)
  end

end
