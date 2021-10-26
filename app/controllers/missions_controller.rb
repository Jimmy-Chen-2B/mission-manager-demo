class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  
  def index
    @missions = current_user.missions.order(id: :desc)
  end

  def new
    @mission = current_user.missions.new
  end

  def create
    @mission = current_user.missions.new(mission_params)
    
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
    params.require(:mission).permit(:title, :description, :started_at, :finished_at)
  end

  def set_mission
    @mission = current_user.mission.find(params[:id])
  end
end
