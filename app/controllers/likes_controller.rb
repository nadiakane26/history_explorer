class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
      @like = current_user.likes.new(like_params)

      if @like.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path, alert: @like.errors.full_messages.to_sentence)
      end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like&.destroy
    redirect_back(fallback_location: root_path)
    else
    redirect_back(fallback_location: root_path, alert: "Failed to remove like.")
    end
  end

  private
  def like_params
    params.expect(like: [ :likeable_id, :likeable_type ])
  end
end
