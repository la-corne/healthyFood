class WelcomeController < ApplicationController
  before_action :flag_navigation_bar, :only => [:contact_us, :home, :profile, :saved, :service]


  def login

  end

  def signup

  end

  def contact_us
  end


  def home
  end


  def profile
  end


  def saved
  end


  def service
  end


  private

  def flag_navigation_bar
    @navigation_bar = true
  end

end
