class AddColumnToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :budget, :string
    add_column :recipes, :prep_time, :string
    add_column :recipes, :cook_time, :string
    add_column :recipes, :total_time, :string
  end
end
