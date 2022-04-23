require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET index" do
    it "assigns @recipes" do
      get :index
      expect(assigns(:recipes)).to eq([])
    end
  end
end