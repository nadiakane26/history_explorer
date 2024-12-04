class LandmarksController < ApplicationController
  before_action :set_landmark, only: %i[ show edit update destroy ]

  # GET /landmarks or /landmarks.json
  def index
    @landmarks = Landmark.all
  end

  # GET /landmarks/1 or /landmarks/1.json
  def show
    @landmark = Landmark.find(params[:id])
  end

  # GET /landmarks/new
  def new
    @landmark = Landmark.new
  end

  # GET /landmarks/1/edit
  def edit
  end

  # POST /landmarks or /landmarks.json
  def create
    @landmark = current_user.landmarks.build(landmark_params)

    respond_to do |format|
      if @landmark.save
        format.html { redirect_to @landmark, notice: "Landmark was successfully created." }
        format.json { render :show, status: :created, location: @landmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landmarks/1 or /landmarks/1.json
  def update
    respond_to do |format|
      if @landmark.update(landmark_params)
        format.html { redirect_to @landmark, notice: "Landmark was successfully updated." }
        format.json { render :show, status: :ok, location: @landmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landmarks/1 or /landmarks/1.json
  def destroy
    @landmark.destroy!

    respond_to do |format|
      format.html { redirect_to landmarks_path, status: :see_other, notice: "Landmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landmark
      @landmark = Landmark.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def landmark_params
      params.expect(landmark: [ :name, :address, :description, :user_id, :region_id, :latitude, :longitude])
    end
end
