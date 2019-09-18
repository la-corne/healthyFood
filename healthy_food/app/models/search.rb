class Search < ApplicationRecord
  def self.search_posts(search_value)
    posts = Post.where('name like ?', "%#{search_value}%") if name.present?
    posts
  end

  def self.search_recipes(search_value)
    recipes = Recipe.where('name like ?', "%#{search_value}%") if name.present?
    recipes
  end
end