require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#last_ten_recipes' do
    context 'when there are no recipes' do
      it 'returns an empty array' do
        expect(Recipe.last_ten_recipes).to eq([])
      end
    end

    context 'when there less than ten recipes' do
      before do
        create_list(:recipe, 3)
      end

      it 'returns all recipes' do
        expect(Recipe.last_ten_recipes.count).to eq(3)
      end
    end

    context 'when there are more than ten recipes' do
      before do
        create_list(:recipe, 15)
      end

      it 'returns the last ten recipes' do
        expect(Recipe.last_ten_recipes.count).to eq(10)
      end
    end
  end

  describe '#search' do
    context 'when there are no recipes' do
      it 'returns an empty array' do
        expect(Recipe.search('chocolate')).to eq([])
      end
    end

    context 'when there are recipes' do
      before do
        create_list(:recipe, 2)
        create(:recipe, ingredients: '50ml of Milk, 100g of butter and 300g of chocolate 70%')
      end

      it 'returns the recipes that match the query' do
        expect(Recipe.search('chocolate').count).to eq(1)
      end
    end

  end
end
