class ChangeIsSpecialistToBeBooleanInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_specialist, :boolean, default: false
  end
end
