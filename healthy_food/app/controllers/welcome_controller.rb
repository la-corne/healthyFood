class WelcomeController < ApplicationController

  def home
    # if the user is logged in he isn't allowed to go to the welcome page
    redirect_to posts_path if logged_in?

  end

  def contact_us; end


 private


end
