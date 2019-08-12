class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :username
      t.string :password
      t.string :email
      t.string :brithdate
      t.binary :is_specialist
      t.float :weight
      t.float :height
      t.text :diseases
      t.string :gender
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
