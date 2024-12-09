class RegionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  # GET /regions or /regions.json
  def index
    @regions = Region.all
  end

  # GET /regions/1 or /regions/1.json
  def show
    @region = Region.find(params[:id])
    @landmarks = @region.landmarks
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
  end

  # POST /regions or /regions.json
  def create
    @region = current_user.regions.build(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: "Region was successfully created." }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1 or /regions/1.json
  def update
    @region = Region.find(params[:id])
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: "Region was successfully updated." }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1 or /regions/1.json
  def destroy
    @region = Region.find(params[:id])
    @region.destroy!

    respond_to do |format|
      format.html { redirect_to regions_path, status: :see_other, notice: "Region was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   # Only allow a list of trusted parameters through.
    def region_params
      params.expect(region: [ :name, :description, :user_id ])
    end

    def check_admin
      unless current_user.admin?
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to regions_path  # Redirect to the regions list or a different page
      end
    end
end
