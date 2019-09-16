class RemoveDiseasesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :diseases, :text
  end
end
