class Recipe < ApplicationRecord

  def self.last_ten_recipes
    Recipe.last(10)
  end

  def self.search(ingredients_query)
    Recipe.where("ingredients LIKE ?", "%#{ingredients_query}%")
  end

end
