module Votable
  extend ActiveSupport::Concern

  included do
    before_action :find_likeable, only: [ :like, :unlike ]
    before_action :authenticate_user!, only: [ :like, :unlike ]
  end

  def like
    @likeable.upvote_by(current_user)

    respond_to do |format|
      format.html { redirect_back(fallback_location: @likeable) }
      format.turbo_stream do
        # Render Turbo Stream to update the like button dynamically
        render turbo_stream: turbo_stream.replace(@likeable, partial: "likes/like_button", locals: { likeable: @likeable })
      end
    end
  end

  def unlike
    @likeable.unvote_by(current_user)

    respond_to do |format|
      format.html { redirect_back(fallback_location: @likeable) }
      format.turbo_stream do
        # Render Turbo Stream to update the like button dynamically
        render turbo_stream: turbo_stream.replace(@likeable, partial: "likes/like_button", locals: { likeable: @likeable })
      end
    end
  end

  private

  def find_likeable
    if params[:controller] == "landmarks"
      @likeable = Landmark.friendly.find(params[:slug])
    elsif params[:controller] == "comments"
      @landmark = Landmark.friendly.find(params[:landmark_slug]) if params[:landmark_slug]
      @likeable = @landmark.comments.find(params[:id])
    else
      raise ActiveRecord::RecordNotFound, "Unable to find votable resource"
    end
  end
end
