class VotesController < ApplicationController
  def new
    @vote = Vote.new
    authorize @vote
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @vote = Vote.new(params_vote)
    @vote.pin = @pin
    @vote.user = current_user
    if @vote.save

      redirect_to pin_path(@pin)
    else
      render "pins/show"
    end
    authorize @vote
  end

  def params_vote
    params.require(:vote).permit(:note)
  end
end
