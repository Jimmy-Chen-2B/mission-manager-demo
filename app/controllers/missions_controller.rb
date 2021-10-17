class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  
  def index
    @missions = Mission.all.order(id: :desc)
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end  
  end

  def edit
  end

  def show
  end

  def update
    if @mission.update(mission_params)
      redirect_to mission_path(@mission)
    else  
      render :edit  
    end
  end

  def destroy
    @mission.destroy
    redirect_to missions_path
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :start_at, :finish_at)
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
