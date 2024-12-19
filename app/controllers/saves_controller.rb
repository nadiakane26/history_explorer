class SavesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_landmark, only: [:create, :destroy]
  
    def create
      # Create a new save for the current user and the landmark
      @save = current_user.saves.new(landmark: @landmark)
  
      if @save.save
        redirect_back fallback_location: root_path
      else
        redirect_back fallback_location: root_path, alert: @save.errors.full_messages.to_sentence
      end
    end
  
    def destroy
      # Find the save record by landmark and user
      @save = current_user.saves.find_by(landmark: @landmark)
      
      if @save&.destroy
        redirect_back fallback_location: root_path
      else
        redirect_back fallback_location: root_path
      end
    end
  
    private
  
    # Find the landmark by its slug
    def set_landmark
      @landmark = Landmark.friendly.find(params[:landmark_slug])  # Assuming you are using FriendlyId for slugs
    end
  end
  