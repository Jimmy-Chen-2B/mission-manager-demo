require 'rails_helper'

RSpec.describe "Missions", type: :request do
  describe "GET /index" do
    it "assigns @missions and render template" do
      mission1 = FactoryBot.create(:mission)
      mission2 = FactoryBot.create(:mission)

      get :index

      expect(assigns[:missions]).to eq([mission1, mission2]) 
      expect(responds).to render_template("index") 
    end

  end
end
