class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_or_specialist

  # GET /diseases
  # GET /diseases.json
  def index
    @diseases = Disease.all
  end

  # GET /diseases/1
  # GET /diseases/1.json
  def show
  end

  # GET /diseases/new
  def new
    @disease = Disease.new
  end

  # GET /diseases/1/edit
  def edit
  end

  # POST /diseases
  # POST /diseases.json
  def create
    @disease = Disease.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to @disease, notice: 'Disease was successfully created.' }
        format.json { render :show, status: :created, location: @disease }
      else
        format.html { render :new }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diseases/1
  # PATCH/PUT /diseases/1.json
  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to diseases_path, notice: 'Disease was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease }
      else
        format.html { render :edit }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diseases/1
  # DELETE /diseases/1.json
  def destroy
    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: 'Disease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_disease
    @disease = Disease.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disease_params
    params.require(:disease).permit(:name)
  end

  def require_admin_or_specialist
    if !logged_in? || (logged_in? and (!current_user.admin? or !current_user.is_specialist?))
      flash[:danger] = 'Only admins can perform that action'
      redirect_to root_path
    end
  end
end
