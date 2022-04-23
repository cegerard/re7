class RecipesController < ApplicationController
  def index
    @recipes = Recipe.last_ten_recipes
  end

  def search
    @found_recipes = Recipe.search(params[:query])
    p @found_recipes
    render template: 'recipes/search_results'
  end
end
