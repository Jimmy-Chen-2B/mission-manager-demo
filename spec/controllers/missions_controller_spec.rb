require 'rails_helper'

RSpec.describe MissionsController do
  describe "GET index" do
    let(:user) { create(:user) }
    let!(:mission1) { create(:mission, user: user) }
    let!(:mission2) { create(:mission, user: user) }
    before do
      login(user)
      get :index
    end

    it "assigns @missions" do
      expect(assigns[:missions]).to eq([mission2, mission1])
    end

    it "renders template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    let(:user) { create(:user) }
    let(:mission) { create(:mission, user: user) }
    before do
      login(user)
      get :show, params: { id: mission.id }
    end

    it "assigns @mission" do
      expect(assigns[:mission]).to eq(mission)
    end

    it "renders template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    context "when a user login" do
      let(:user) { create(:user) }
      let(:mission) { build(:mission, user: user) }

      before do
        login(user)
        get :new
      end

      it "assigns @mission" do
        expect(assigns[:mission]).to be_a_new(Mission)
      end

      it "renders template" do
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
    let(:mission) { build(:mission, user: user) }
    before { login(user) }

    context "when @mission has required data" do
      it "creates a new mission record" do
        expect do
          post :create, params: { mission: attributes_for(:mission) }
        end. to change{ Mission.count }.by(1)
      end
  
      it "redirects to missions_path" do
        post :create, params: { mission: attributes_for(:mission) }
        expect(response).to redirect_to missions_path
      end      
    end

    context "when @mission dosen't have required data" do
      it "doesn't create a record" do
        expect do
          post :create, params: { mission: { description: "foobar" } }
        end. to change{ Mission.count }.by(0)
      end
  
      it "renders new template" do
        post :create, params: { mission: { description: "foobar" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET edit" do
    let(:user) { create(:user) }
    let(:mission) { create(:mission, user: user) }

    before do 
      login(user) 
      get :edit, params: { id: mission.id }
    end

    it "assigns @mission" do
      expect(assigns[:mission]).to eq(mission) 
    end

    it "renders template" do
      expect(response).to render_template("edit")
    end
  end
  
  describe "PATCH update" do
    let(:user) { create(:user) }
    let(:mission) { create(:mission, user: user) }
    before { login(user) }
    
    context "when @mission has required data" do
      before { patch :update, params: { id: mission.id, mission: { title: "This is a book", description: "The book that has magic power", started_at: "2021-10-17", finished_at: "2021-10-20" } } }

      it "assigns @mission" do
        expect(assigns[:mission]).to eq(mission) 
      end
  
      it "changes values" do
        expect(assigns[:mission].title).to eq("This is a book")
        expect(assigns[:mission].description).to eq("The book that has magic power")
      end
  
      it "redirects to mission_path" do
        expect(response).to redirect_to mission_path(mission)
      end  
    end
    
    context "when @mission dosen't have required data" do
      before { patch :update, params: { id: mission.id, mission: { title: "", description: "The book that has magic power", started_at: "", finished_at: "" } } }

      it "doesn't create a record" do
        expect(mission.description).not_to eq("The book that has magic power")
      end

      it "render edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:user) { create(:user) }
    let!(:mission) { create(:mission, user: user) }
    before { login(user) } 

    it "assigns @mission" do
      delete :destroy, params: { id: mission.id }

      expect(assigns[:mission]).to eq(mission) 
    end

    it "deletes a record" do
      expect{ delete :destroy, params: { id: mission.id } }.to change { Mission.count }.by(-1)
    end

    it "redirects to missions_path" do
      delete :destroy, params: { id: mission.id }

      expect(response).to redirect_to missions_path
    end
  end
end

