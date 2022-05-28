class AddArchivedToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :archived, :boolean, default: false
  end
end
