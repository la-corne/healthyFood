class RemoveRecipeIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :recipe_id, :integer
  end
end
