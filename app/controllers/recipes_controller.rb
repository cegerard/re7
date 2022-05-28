class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show archive ]

  def index
    @recipes = Recipe.last_ten_recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end

  def search
    @query = params[:query]

    result = SearchRecipe.new.from(@query) if @query.present?

    @found_recipes = result || []
    render template: 'recipes/search_results'
  end

  def archive
    @recipe.archive

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Recipe was successfully archived." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
