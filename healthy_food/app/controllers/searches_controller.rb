class SearchesController < ApplicationController

  def search
    params[:search_param].strip!
    unless params[:search_param].blank?
      # search in posts
      @posts = Search.search_posts(params[:search_param])
      # search in recipes
      @recipes = Search.search_recipes(params[:search_param])
    end
  end

end