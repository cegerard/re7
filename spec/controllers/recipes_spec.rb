require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET index" do
    it "render the index template" do
      get :index

      expect(response).to render_template(:index)
    end

    context 'when there are no recipes' do
      it "assigns @recipes" do
        get :index

        expect(assigns(:recipes)).to eq([])
      end
    end

    context 'when there are recipes' do
      let!(:recipes) { create_list(:recipe, 2) }

      it "assigns @recipes" do
        get :index

        expect(assigns(:recipes)).to eq(recipes)
      end
    end
  end

  describe "GET search" do
    let(:search_recipe) { instance_double(SearchRecipe, from: []) }

    before do
      allow(SearchRecipe).to receive(:new).and_return(search_recipe)
    end

    it "render the search result template" do
      get :search

      expect(response).to render_template(:search_results)
    end

    context 'when there are no query' do
      it "assigns @recipes" do
        get :search

        expect(assigns(:found_recipes)).to eq([])
      end
    end

    context 'when there are no recipes' do
      it "assigns @recipes" do
        get :search, params: { query: 'love' }

        expect(assigns(:found_recipes)).to eq([])
      end
    end

    context 'when there are recipes' do
      let(:recipes) { create_list(:recipe, 2) }
      let(:search_recipe) { instance_double(SearchRecipe, from: recipes) }
      let(:recipes) { create_list(:recipe, 2) }

      it "assigns @recipes" do
        get :search, params: { query: 'love' }

        expect(assigns(:found_recipes)).to eq(recipes)
      end
    end
  end
end