class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  # before_action :flag_navigation_bar, only: [:show, :edit]


  # GET /users
  # GET /users.json
  def index
    # if the user is logged in he isn't allowed to go to the welcome page
    # redirect_to profile_path if logged_in?
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # the profile page for the user
  def show;
  end

  # GET /users/new
  # sign up form
  def new
    # if the user is logged in he isn't allowed to go back to the sign up page
    redirect_to posts_path if logged_in?

    @user = User.new
  end

  # GET /users/1/edit
  # edit will be handled by update function
  # so when I click the save button in the setting (edit) page the update function is called
  def edit;
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      # lw l user l e7na bn3dl feh dh (user_params dii l data l mt3dla) et3mlo update fl db mn 8er errors
      if @user.update(user_params)
        # e3mlo redirect 3la l show (home)page
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else # lw 7sl error w m3rfsh y save fl db
        format.html { render :edit } # sebo zy m hwa fl edit (settings) page
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile_number,
                                 :username, :password, :email, :birthdate,
                                 :is_specialist, :weight, :height,
                                 :gender, :profile_photo, disease_ids: [])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = 'You can only edit your own account'
      redirect_to root_path
    end
  end

  # this will prevent the non admin users from having access to destroy action
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = 'Only admin users can perform that action'
      redirect_to root_path
    end
  end

  # def flag_navigation_bar
  #   @navigation_bar = true
  # end

end
