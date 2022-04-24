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
    subject(:search) { Recipe.search(query) }
    let(:query) { [] }

    context 'when there are no recipes' do
      it 'returns an empty array' do
        expect(search).to eq([])
      end
    end

    context 'when there are recipes' do
      let(:recipe) { create(:recipe, ingredients: '50ml of Milk, 100g of butter and 300g of chocolate 70%') }
      
      before do
        create_list(:recipe, 2)
        recipe
      end

      context 'when ingredients is nil' do
        let(:query) { nil }

        it 'returns no recipes' do
          expect(search).to eq([])
        end
      end

      context 'when there are no ingredients' do
        it 'returns no recipes' do
          expect(search).to eq([])
        end
      end

      context 'when there are one ingredients' do
        let(:query) { ['chocolate'] }

        it 'returns the recipes that match a single ingredient query' do
          expect(search).to eq([recipe])
        end

        it 'returns an empty array if no recipe match the ingredient' do
          expect(Recipe.search(['banana'])).to eq([])
        end
      end

      context 'when there are two ingredients in order' do
        let(:query) { ['butter','chocolate'] }

        it 'returns the recipes that match a multiple ingredients query' do
          expect(search).to eq([recipe])
        end
      end

      context 'when there are two ingredients out of order' do
        let(:query) { ['chocolate','butter'] }

        it 'returns the recipes that match a multiple ingredients query' do
          expect(search).to eq([recipe])
        end
      end
    end
  end
end
