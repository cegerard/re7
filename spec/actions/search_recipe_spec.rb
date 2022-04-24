require 'rails_helper'

RSpec.describe SearchRecipe do
  subject(:search_recipe) { described_class.new(Recipe) }

  context 'when there are no recipes' do
    it 'returns an empty array' do
      expect(search_recipe.from('ingredient')).to eq([])
    end
  end

  context 'when there are recipes' do
    let!(:chocolate_white) { create(:recipe, ingredients: '1kg white chocolate and a spoon of vanilla') }
    let!(:chocolate_milk) { create(:recipe, ingredients: '1kg milk chocolate and a spoon of vanilla') }
    let!(:chocolate_black) { create(:recipe, ingredients: '1kg black chocolateand 1cinnamon') }

    context 'when the ingredients match all recipes' do
      it 'returns the recipes' do
        expect(search_recipe.from('chocolate')).to eq([chocolate_white, chocolate_milk, chocolate_black])
      end
    end

    context 'when the ingredients match only one recipe' do
      it 'returns matching recipes' do
        expect(search_recipe.from('white chocolate')).to eq([chocolate_white])
      end
    end

    context 'when the ingredients do not match' do
      it 'returns an empty array' do
        expect(search_recipe.from('ingredient')).to eq([])
      end
    end

    context 'when there are two ingredients with a space after coma' do
      let(:query) { 'black chocolate, cinnamon' }
      
      it'returns the recipes that match a multiple ingredients query' do
        expect(search_recipe.from(query)).to eq([chocolate_black])
      end
    end

    context 'when there are two ingredients with a space before coma' do
      let(:query) { 'black chocolate ,cinnamon' }
      
      it'returns the recipes that match a multiple ingredients query' do
        expect(search_recipe.from(query)).to eq([chocolate_black])
      end
    end

    context 'when there are two ingredients with both spaces before and after coma' do
      let(:query) { 'black chocolate , cinnamon' }
      
      it'returns the recipes that match a multiple ingredients query' do
        expect(search_recipe.from(query)).to eq([chocolate_black])
      end
    end

    context 'when there are two ingredients with mutiple spaces after coma' do
      let(:query) { 'black chocolate,    cinnamon' }
      
      it'returns the recipes that match a multiple ingredients query' do
        expect(search_recipe.from(query)).to eq([chocolate_black])
      end
    end

    context 'when there are two ingredients with mutiple spaces before coma' do
      let(:query) { 'black chocolate   ,cinnamon' }
      
      it'returns the recipes that match a multiple ingredients query' do
        expect(search_recipe.from(query)).to eq([chocolate_black])
      end
    end

    context 'when there are spaces before and afer' do
      let(:query) {'   chocolate   '}

      it 'returns the recipes that match a single ingredient query' do
        expect(search_recipe.from(query)).to eq([chocolate_white, chocolate_milk, chocolate_black])
      end
    end
  end
end