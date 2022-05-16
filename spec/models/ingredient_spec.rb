require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "when archiving ingredient" do
    let(:ingredient) { create(:ingredient) }

    it "should set archived to true" do
      ingredient.archive
      expect(ingredient.archived).to eq(true)
    end
  end
end
