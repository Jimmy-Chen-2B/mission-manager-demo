require 'rails_helper'

RSpec.describe MissionsController do
  describe "GET /index" do
    it "assigns @missions and render" do
      mission1 = FactoryBot.create(:mission)
      mission2 = FactoryBot.create(:mission)

      get :index

      expect(assigns[:missions]).to eq([mission1, mission2]) 
    end

    it "render template" do
      mission1 = FactoryBot.create(:mission)
      mission2 = FactoryBot.create(:mission)

      get :index

      expect(response).to render_template("index") 
    end
  end

  describe "GET show" do
    it "assigns @course" do
    mission =  FactoryBot.create(:mission)

    get :show, params: { id: mission.id }

    expect(assigns[:mission]).to eq(mission)
    end

    it "assigns @course" do
      mission =  FactoryBot.create(:mission)
  
      get :show, params: { id: mission.id }
  
      expect(response).to render_template("show")
    end
  end
end
