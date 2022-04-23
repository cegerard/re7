require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET index' do
    it('render the index template') do
      get '/'
      expect(response).to render_template('recipes/index')
    end
  end
end
