class PeriodsController < ApplicationController

  before_action :authenticate_user!
  respond_to :json
  # GET /periods
  # GET /periods.json
  def index
    periods = current_user.school.periods.all

    render json: periods
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    period = current_user.school.periods.find(params[:id])
    render json: period
  end

  # POST /periods
  # POST /periods.json
  def create
    period = current_user.school.periods.create(period_params)

    if period.save
      render json: period, status: :created, location: period
    else
      render json: {errors: period.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    period = current_user.school.periods.find(params[:id])

    if period.update(period_params)
      render json: period, status: :accepted
    else
      render json: {errors: period.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period.destroy

    head :no_content
  end

  private

    def set_period
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:year)
    end
end
