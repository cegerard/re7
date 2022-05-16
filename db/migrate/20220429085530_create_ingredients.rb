class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :energy
      t.float :carbohydrate
      t.float :salt
      t.float :protein
      t.float :lipids
      t.float :sugar
      t.float :fibers
      t.float :saturated_fatty_acids
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
