class CommentController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = Comment.new(params_comment)
    @comment.pin = @pin
    @comment.user = current_user
    # if @comment.save
    #   redirect_to pin_path(@pin)
    # else
    #   render "new"
    # end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to pin_path(@comment.pin)
  end

  def edit
  end

  def update
  end

  private

  def params_comment
    params.require(:comment).permit(:content)
  end
end
