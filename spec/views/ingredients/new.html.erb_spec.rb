require 'rails_helper'

RSpec.describe "ingredients/new", type: :view do
  before(:each) do
    assign(:ingredient, Ingredient.new(
      name: "MyString",
      energy: 1,
      carbohydrate: 1.5,
      salt: 1.5,
      protein: 1.5,
      lipids: 1.5,
      sugar: 1.5,
      fibers: 1.5,
      saturated_fatty_acids: 1.5
    ))
  end

  it "renders new ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredients_path, "post" do

      assert_select "input[name=?]", "ingredient[name]"

      assert_select "input[name=?]", "ingredient[energy]"

      assert_select "input[name=?]", "ingredient[carbohydrate]"

      assert_select "input[name=?]", "ingredient[salt]"

      assert_select "input[name=?]", "ingredient[protein]"

      assert_select "input[name=?]", "ingredient[lipids]"

      assert_select "input[name=?]", "ingredient[sugar]"

      assert_select "input[name=?]", "ingredient[fibers]"

      assert_select "input[name=?]", "ingredient[saturated_fatty_acids]"
    end
  end
end
