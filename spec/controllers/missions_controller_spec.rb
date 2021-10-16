require 'rails_helper'

RSpec.describe MissionsController do
  describe "GET index" do
    it "assigns @missions and render" do
      mission1 = create(:mission)
      mission2 = create(:mission)

      get :index

      expect(assigns[:missions]).to eq([mission2, mission1]) 
    end

    it "render template" do
      mission1 = create(:mission)
      mission2 = create(:mission)

      get :index

      expect(response).to render_template("index") 
    end
  end

  describe "GET show" do
    it "assigns @mission" do
    mission = create(:mission)

    get :show, params: { id: mission.id }

    expect(assigns[:mission]).to eq(mission)
    end

    it "render template" do
      mission = create(:mission)
  
      get :show, params: { id: mission.id }
  
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns @mission" do
      mission = build(:mission)

      get :new

      expect(assigns[:mission]).to be_a_new(Mission)
    end

    it "render template" do
      mission = build(:mission)
  
      get :new
  
      expect(response).to render_template("new")
    end
  end

  describe "POSt create" do
    it "create a new mission record" do
      mission = build(:mission)

      expect do
        post :create, params: { mission: attributes_for(:mission) }
      end. to change{ Mission.count }.by(1)
    end

    it "redirect to missions_path" do
      mission = build(:mission)

      post :create, params: { mission: attributes_for(:mission) }
  
      expect(response).to redirect_to missions_path
    end

    it "doesn't create a record when mission dosen't have a title, start time or finish time" do
      mission = build(:mission)

      expect do
        post :create, params: { mission: { description: "foobar" } }
      end. to change{ Mission.count }.by(0)
    end

    it "create a new mission record" do
      mission = build(:mission)

      post :create, params: { mission: { description: "foobar" } }

      expect(response).to render_template("new")
    end

    expect(assigns[:mission]).to eq(mission)
    end

    it "assigns @course" do
      mission =  FactoryBot.create(:mission)
  
      get :show, params: { id: mission.id }
  
      expect(response).to render_template("show")
    end
  end
end
