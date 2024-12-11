class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_landmark
    before_action :set_comment, only: [:destroy]
    before_action :verify_comment_user, only: [:destroy]

    def create
        comment = @landmark.comments.create(comment_params.merge(user_id: current_user.id))
        redirect_to landmark_path(@landmark)
      end
  
    def destroy
      @comment.destroy
      redirect_to landmark_path(@landmark), status: :see_other
    end

    private
    
    def set_landmark
        @landmark = Landmark.find(params[:landmark_id])
      end

      def set_comment
        @comment = @landmark.comments.find(params[:id])
      end

      def comment_params
        params.expect(comment: [:body, :user_id, :landmark_id])
      end

      def verify_comment_user  
        unless @comment.user == current_user || current_user.admin?
            redirect_to landmark_path(@landmark), alert: "You are not authorized to modify this comment."
          end
    end
  end