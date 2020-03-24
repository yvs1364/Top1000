class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    authorize @visit
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @visit = Visit.new
    @visit.pin = @pin
    @visit.user = current_user
    if @visit.save
      redirect_to pin_path(@pin)
    else
      render "pins/show"
    end
    authorize @visit
  end

  def params_visit
    params.require(:visit).permit(:pin_id, :user_id)
  end
end
