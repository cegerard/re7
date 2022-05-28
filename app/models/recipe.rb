class Recipe < ApplicationRecord

  def self.last_ten_recipes
    Recipe.last(10)
  end

  # Search for recipe from ingredients list
  # @params [Array<String>] ingredients Hold the ingredients list
  # @params [integer] max The max number or recipes to return
  def self.search(ingredients, max = 50)
    return [] unless ingredients.present?

    ingredient_param = ingredients.map{ |ingredient| "%#{ingredient}%" }
    where_sql = ingredient_param.map{'ingredients LIKE ?'}.join(' AND ')

    Recipe.where(where_sql, *ingredient_param).limit(max)
  end

  def archive
    update(archived: true)
  end

end
