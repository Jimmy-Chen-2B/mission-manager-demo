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
    context "when a user login" do
      let(:user) { create(:user) }
      let(:mission) { build(:mission) }

      before do
        login(user)
        get :new
      end

      it "assigns @mission" do
        expect(assigns[:mission]).to be_a_new(Mission)
      end

      it "render template" do
        expect(response).to render_template("new")
      end
    end

    context "when a user doesn't login" do
      it "redirects to login page" do
        get :new

        expect(response).to redirect_to login_path
      end
    end
  end

  describe "POST create" do
    let(:user) { create(:user) }
    before { login(user) }

    context "when mission has a title, start time and finish time" do
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
    end

    context "when mission dosen't have a title, start time or finish time" do
      it "doesn't create a record" do
        mission = build(:mission)
  
        expect do
          post :create, params: { mission: { description: "foobar" } }
        end. to change{ Mission.count }.by(0)
      end
  
      it "render new template" do
        mission = build(:mission)
  
        post :create, params: { mission: { description: "foobar" } }
  
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET edit" do
    it "assign @mission" do
      mission = create(:mission)

      get :edit, params: { id: mission.id }

      expect(assigns[:mission]).to eq(mission) 
    end

    it "render edit template" do
      mission = create(:mission)

      get :edit, params: { id: mission.id }

      expect(response).to render_template("edit")
    end
  end
  
  describe "PATCH update" do
    context "when mission has required data" do
      it "assign @mission" do
        mission = create(:mission)
  
        put :update, params: { id: mission.id, mission: { title: "This is a book", description: "The book that has magic power", started_at: "2021-10-17", finished_at: "2021-10-20" } }
  
        expect(assigns[:mission]).to eq(mission) 
      end
  
      it "change value" do
        mission = create(:mission)
  
        put :update, params: { id: mission.id, mission: { title: "This is a book", description: "The book that has magic power", started_at: "2021-10-17", finished_at: "2021-10-20" } }
  
        expect(assigns[:mission].title).to eq("This is a book")
        expect(assigns[:mission].description).to eq("The book that has magic power")
      end
  
      it "redirects to mission_path" do
        mission = create(:mission)
  
        put :update, params: { id: mission.id, mission: { title: "This is a book", description: "The book that has magic power", started_at: "2021-10-17", finished_at: "2021-10-20" } }
  
        expect(response).to redirect_to mission_path(mission)
      end  
    end
    
    context "when mission dosen't have required data" do
      it "don't create a record" do
        mission = create(:mission)
  
        put :update, params: { id: mission.id, mission: { title: "", description: "The book that has magic power", started_at: "", finished_at: "" } }
  
        expect(mission.description).not_to eq("The book that has magic power")
      end

      it "render edit template" do
        mission = create(:mission)
  
        put :update, params: { id: mission.id, mission: { title: "", description: "The book that has magic power", started_at: "", finished_at: "" } }
  
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "assign @mission" do
      mission = create(:mission)
      
      delete :destroy, params: { id: mission.id }
      
      expect(assigns[:mission]).to eq(mission) 
    end

    it "deletes a record" do
      mission = create(:mission)
      
      expect{ delete :destroy, params: { id: mission.id } }.to change { Mission.count }.by(-1)
    end

    it "redirects to missions_path" do
      mission = create(:mission)

      delete :destroy, params: { id: mission.id }

      expect(response).to redirect_to missions_path
    end
  end
end

