class SavedRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :savedrecipe, class_name: 'Recipe'
end
