class AddDetailsToRecipe < ActiveRecord::Migration[7.0]
  def up
    File.foreach(Rails.root.join('db', 'migrate', 'recipes-fr.jsonl')) do |raw_recipe|
      recipe = JSON.parse(raw_recipe)
      Recipe.find_by(title: recipe['name']).update(
        budget: recipe['budget'],
        prep_time: recipe['prep_time'],
        cook_time: recipe['cook_time'],
        total_time: recipe['total_time']
      )
    end
  end

  def down
    Recipe.all.each do |recipe|
      recipe.update(
        budget: nil,
        prep_time: nil,
        cook_time: nil,
        total_time: nil
      )
    end
  end
end
