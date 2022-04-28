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

      it "assigns @recipes" do
        get :search, params: { query: 'love' }

        expect(assigns(:found_recipes)).to eq(recipes)
      end
    end
  end

  describe "GET show" do
    context 'when the recipe does not exists' do
      it "returns a 404 status" do
        get :show, params: { id: 'not-found' }

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the recipe exists' do
      let(:recipe) { create(:recipe) }

      it "renders the recipe template" do
        get :show, params: { id: recipe.id }

        expect(response).to render_template(:show)
      end

      it "assigns @recipe" do
        get :show, params: { id: recipe.id }

        expect(assigns(:recipe)).to eq(recipe)
      end
    end
  end
end