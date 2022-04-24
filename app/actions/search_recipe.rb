class SearchRecipe

  MAX_NUMBER_OF_RESULTS = 50

  # Create the SearchRecipe action
  # @params [Object] store A recipe store with a from method
  def initialize(store = Recipe)
    @store = store
  end

  # Search recipe from their ingredients
  # @params [String] ingredients_string Hold ingredients list separated by a comma
  def from(ingredients_string)
    ingredients = ingredients_string.split(',').map{ |ingredient| ingredient.rstrip.lstrip }
    @store.search(ingredients, MAX_NUMBER_OF_RESULTS)
  end
end