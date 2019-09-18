# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # if the current user already with us return it
    # if not (||=) go and search for it in the database
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?

    # !current_user.nil?
    # current_user.present? returns true if the current user is not nill
    # puts "current user id = #{current_user.id}"
    # return true if there is a current user means if the user logged in

    # && !current_user.present?
    #     puts "!current_user.present? #{!current_user.present?}"
    #     puts "current_user.nil? #{current_user.nil?}"
    # puts "current user is nil = #{current_user.nil?}"
    !!current_user
  end

  def require_user
    if !logged_in?

      flash[:danger] = 'You must be logged in to perform that action'

      redirect_to root_path

    end
  end

  def search
    unless params[:search_param].blank?
      @posts = ApplicationRecord.search(params[:search_param])
      @recipes = ApplicationRecord.search(params[:search_param]) if @posts.blank?
      flash.now[:danger] = 'No results match this search criteria' if @recipes.blank?
    end
    respond_to do |format|
      format.js { render partial: 'layouts/result' }
    end
  end


end
