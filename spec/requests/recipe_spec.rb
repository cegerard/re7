require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'GET search' do
    it('render the search template') do
      get '/recipes/search'
      expect(response).to render_template('search_results')
    end
  end

  describe 'GET show' do
    let(:recipe) { create(:recipe) }
    it('render the show template') do
      get "/recipes/#{recipe.id}"
      
      expect(response).to render_template(:show)
    end
  end
end
