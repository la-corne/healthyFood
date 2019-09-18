class SavedRecipesController < ApplicationController

  def destroy
    @saved_recipe = current_user.saved_recipes.where(savedrecipe_id: params[:id]).first
    @saved_recipe.destroy
    flash[:notice] = 'recipe was successfully removed'
    redirect_to saved_path
  end

end