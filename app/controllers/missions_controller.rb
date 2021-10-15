class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def new
    
  end

  def create
    
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
end
