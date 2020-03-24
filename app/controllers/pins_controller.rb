class PinsController < ApplicationController
  def index
    @pins = policy_scope(Pin).order(created_at: :desc)
    @pins = Pin.near([current_user.position_latitude, current_user.position_longitude], 5)
    @user_marker =
      {
        lat: current_user.position_latitude,
        lng: current_user.position_longitude,
        image_url: helpers.asset_url("mark.png")
      }
    @markers = @pins.map do |pin|
      {
        lat: pin.latitude,
        lng: pin.longitude,
        image_url: helpers.asset_url("pin.png"),
        infoWindow: render_to_string(partial: "info_window", locals: { pin: pin })
      }
    end
  end

  def update_user_position
    authorize Pin
    @user = current_user
    @user.position_latitude = params[:latitude]
    @user.position_longitude = params[:longitude]
    @user.save
    @user_marker =
      {
        lat: current_user.position_latitude,
        lng: current_user.position_longitude,
        image_url: helpers.asset_url("mark.png")
      }
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { head :no_content }
    end
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id
    results = Geocoder.search(@pin.address)
    results.first.coordinates
    @pin.latitude = results.first.coordinates[0]
    @pin.longitude = results.first.coordinates[1]

    if @pin.save
      redirect_to pin_path(@pin)
    else
      render :new
    end
    authorize @pin
  end

  def new
    @pin = Pin.new
    authorize @pin
    @comment = Comment.new
    authorize @comment
    @vote = Vote.new

    authorize @vote
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to pins_path
    authorize @pin
  end

  def show
    @pin = policy_scope(Pin).order(created_at: :desc)
    @pin = Pin.find(params[:id])
    @comment = Comment.new
    @vote = Vote.new
    authorize @pin
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :user_id, :address, :address, :photo)
  end
end
