class MissionsController < ApplicationController
  
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
    @mission = Mission.find(params[:id])
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])

    if @mission.update(mission_params)
      redirect_to mission_path(@mission)
    else  
      render :edit  
    end
  end

  def destroy
    
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :start_at, :finish_at)
  end
end
