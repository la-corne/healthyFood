class RemoveBrithdateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :brithdate, :string
  end
end
