class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_landmark

    def create
        comment = @landmark.comments.create(comment_params.merge(user_id: current_user.id))
        redirect_to landmark_path(@landmark)
      end
  
    def destroy
      @comment = @landmark.comments.find(params[:id])
      @comment.destroy
      redirect_to landmark_path(@landmark), status: :see_other
    end

    private
    
    def set_landmark
        @landmark = Landmark.find(params[:landmark_id])
    end

      def comment_params
        params.expect(comment: [:body, :user_id, :landmark_id])
      end
  end