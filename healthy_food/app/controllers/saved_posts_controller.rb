class SavedPostsController < ApplicationController

  def destroy
    @saved_post = current_user.saved_posts.where(savedpost_id: params[:id]).first
    @saved_post.destroy
    flash[:notice] = 'post was successfully removed'
    redirect_to saved_path
  end

end