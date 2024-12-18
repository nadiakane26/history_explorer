class LandmarksController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit ]
  before_action :verify_landmark_user, only: [ :edit, :update, :destroy ]
  before_action :set_landmark, except: [ :index, :new, :create ]

  # GET /landmarks or /landmarks.json
  def index
    @landmarks = Landmark.order(created_at: :desc).paginate(page: params[:page], per_page: 9)
    @user_likes = current_user.likes.where(likeable_type: 'Landmark').pluck(:likeable_id) if current_user
  end


  # GET /landmarks/1 or /landmarks/1.json
  def show
    @comments = @landmark.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 6)

    respond_to do |format|
      format.html # Regular HTML request
      format.js   # JavaScript request (for AJAX)
    end
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
    @landmark.images.attach(params[:images])

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

  def set_landmark
    @landmark = Landmark.friendly.find(params[:slug])
  end

    # Only allow a list of trusted parameters through.
    def landmark_params
      params.expect(landmark: [ :name, :address, :description, :user_id, :region_id, :latitude, :longitude, images: [] ])
    end

    def verify_landmark_user
      @landmark = Landmark.friendly.find(params[:slug])
      unless @landmark.user == current_user || current_user&.admin?
        respond_to do |format|
            format.html { redirect_to @landmark, alert: "You are not authorized to modify this landmark." }
            format.json { render :show, status: :ok, location: @landmark }
      end
      end
  end
end
