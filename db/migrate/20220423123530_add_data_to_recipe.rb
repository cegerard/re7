class AddDataToRecipe < ActiveRecord::Migration[7.0]
  def up
    File.foreach(Rails.root.join('db', 'migrate', 'recipes-fr.jsonl')) do |raw_recipe|
      recipe = JSON.parse(raw_recipe)
      Recipe.create(
        title: recipe['name'],
        ingredients: recipe['ingredients'].join(', '),
      )
    end
  end

  def down
    Recipe.destroy_all
  end
end
