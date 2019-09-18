class CreateSavedRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_recipes do |t|
      t.belongs_to :user
      t.belongs_to :savedrecipe, class: 'Recipe'
      t.timestamps
    end
  end
end
