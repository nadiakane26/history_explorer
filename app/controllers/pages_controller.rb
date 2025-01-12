class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :my_landmarks ]

    def index
    end

    def nearby
    end

    def about
    end

    def my_landmarks
      @landmarks = current_user.landmarks
      @liked_landmarks = Landmark.find(ActsAsVotable::Vote.where(voter: current_user, votable_type: 'Landmark').pluck(:votable_id))
      @saved_landmarks = current_user.saved_landmarks
    end

    def search
      @landmarks = []
      @regions = []

      if params[:search].present?
        # Search for landmarks
        @landmarks = Landmark.where("name ILIKE ?", "%#{params[:search]}%")
        # Search for regions
        @regions = Region.where("name ILIKE ?", "%#{params[:search]}%")
      end
    end
end
