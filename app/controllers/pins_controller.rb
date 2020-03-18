class PinsController < ApplicationController
  def index
    @pins = Pin.all
    @markers = @pins.map do |pin|
      {
        lat: pin.latitude,
        lng: pin.longitude,
        image_url: helpers.asset_url("pin.png"),
        infoWindow: render_to_string(partial: "info_window", locals: { pin: pin })
      }
    end
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id
    if @pin.save
      redirect_to dashboard_path(@pin)
    else
      render "new"
    end
  end

  def new
    @pin = Pin.new
  end


  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to pins_path
  end

  def show
    @pin = Pin.find(params[:id])
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :user_id, :address, :address, :photo)
  end
end
