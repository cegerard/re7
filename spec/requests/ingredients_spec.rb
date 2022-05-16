require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/ingredients", type: :request do
  
  # Ingredient. As you add validations to Ingredient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Ingredient.create! valid_attributes
      get ingredients_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ingredient = Ingredient.create! valid_attributes
      get ingredient_url(ingredient)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ingredient_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      ingredient = Ingredient.create! valid_attributes
      get edit_ingredient_url(ingredient)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ingredient" do
        expect {
          post ingredients_url, params: { ingredient: valid_attributes }
        }.to change(Ingredient, :count).by(1)
      end

      it "redirects to the created ingredient" do
        post ingredients_url, params: { ingredient: valid_attributes }
        expect(response).to redirect_to(ingredient_url(Ingredient.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Ingredient" do
        expect {
          post ingredients_url, params: { ingredient: invalid_attributes }
        }.to change(Ingredient, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post ingredients_url, params: { ingredient: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ingredient" do
        ingredient = Ingredient.create! valid_attributes
        patch ingredient_url(ingredient), params: { ingredient: new_attributes }
        ingredient.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the ingredient" do
        ingredient = Ingredient.create! valid_attributes
        patch ingredient_url(ingredient), params: { ingredient: new_attributes }
        ingredient.reload
        expect(response).to redirect_to(ingredient_url(ingredient))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        ingredient = Ingredient.create! valid_attributes
        patch ingredient_url(ingredient), params: { ingredient: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ingredient" do
      ingredient = Ingredient.create! valid_attributes
      expect {
        delete ingredient_url(ingredient)
      }.to change(Ingredient, :count).by(-1)
    end

    it "redirects to the ingredients list" do
      ingredient = Ingredient.create! valid_attributes
      delete ingredient_url(ingredient)
      expect(response).to redirect_to(ingredients_url)
    end
  end
end
