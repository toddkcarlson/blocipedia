require 'spec_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
 # #2
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
 # #3
      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
 
    describe "WIKI create" do
 # #4
      it "increases the number of Wiki by 1" do
        expect{ wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Wiki,:count).by(1)
      end
 
 # #5
      it "assigns the new wiki to @wiki" do
        wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(assigns(:wiki)).to eq Wiki.last
      end
 
 # #6
      it "redirects to the new wiki" do
        wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(response).to redirect_to Wiki.last
      end
    end

end
