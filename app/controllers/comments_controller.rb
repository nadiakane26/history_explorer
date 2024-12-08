class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_landmark

    def create
      @comment = @landmark.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @landmark, notice: 'Comment has been created'
      else
        redirect_to @landmark, alert: 'Comment has not been created'
      end
    end

    def edit
  @comment = @landmark.comments.find(params[:id])
end

    def update
    @comment = @landmark.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @landmark, notice: 'Comment has been updated' }
      else
        format.html { redirect_to @landmark, alert: 'Comment was not updated!' }
      end
    end
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