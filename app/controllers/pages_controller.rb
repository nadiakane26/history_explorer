class PagesController < ApplicationController
    def index
    end

    def nearby
    end

    def about
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
