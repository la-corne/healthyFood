class CreateSavedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_posts do |t|
      t.belongs_to :user
      t.belongs_to :savedpost, class: 'Post'
      t.timestamps
    end
  end
end
