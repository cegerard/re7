require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'GET search' do
    it('render the search template') do
      get '/recipes/search'
      expect(response).to render_template('search_results')
    end
  end
end
