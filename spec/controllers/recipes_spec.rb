require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET index" do

    before do
      allow(SearchRecipe).to receive(:new).and_return(search_recipe)

      get :index
    end

    context 'when there are no recipes' do
      let(:search_recipe) { instance_double(SearchRecipe, from: []) }

      it "assigns @recipes" do
        expect(assigns(:recipes)).to eq([])
      end
    end

    context 'when there are recipes' do
      let(:search_recipe) { instance_double(SearchRecipe, from: recipes) }
      let(:recipes) { create_list(:recipe, 2) }

      it "assigns @recipes" do
        expect(assigns(:recipes)).to eq(recipes)
      end
    end
  end
end