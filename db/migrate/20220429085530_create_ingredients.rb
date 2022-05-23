class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.integer :energy, null: false
      t.float :carbohydrate, null: false
      t.float :salt, null: false
      t.float :protein, null: false
      t.float :lipids, null: false
      t.float :sugar, null: false
      t.float :fibers, null: false
      t.float :saturated_fatty_acids, null: false
      t.boolean :archived, default: false

      t.timestamps
    end

    add_index :ingredients, :name, unique: true
  end
end
