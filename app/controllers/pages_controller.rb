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
      @liked_landmarks = current_user.likes.map(&:likeable).select { |likeable| likeable.is_a?(Landmark) }
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
