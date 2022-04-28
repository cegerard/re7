class RecipesController < ApplicationController
  def index
    @recipes = Recipe.last_ten_recipes
  end

  def search
    @query = params[:query]

    result = SearchRecipe.new.from(@query) if @query.present?

    @found_recipes = result || []
    render template: 'recipes/search_results'
  end
end
