class RemoveWeightFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :weight, :float
  end
end
