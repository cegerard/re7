require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "POST #archive" do
    context 'when the ingredient is not archived' do
      let(:ingredient) { create(:ingredient) }

      it "archive the ingredient" do
        post :archive, params: { id: ingredient.id }

        ingredient.reload
        expect(ingredient.archived).to eq(true)
      end
    end

    context 'when the ingredient is already archived' do
      let(:ingredient) { create(:ingredient, archived: true) }

      it "keep the archive field to true" do
        post :archive, params: { id: ingredient.id }

        ingredient.reload
        expect(ingredient.archived).to eq(true)
      end
    end
    
    context 'when the ingredient does not exist' do

      it "returns a not found status" do
        post :archive, params: { id: 'not found' }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end