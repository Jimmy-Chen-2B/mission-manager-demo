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
    
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :start_at, :finish_at)
  end
end
