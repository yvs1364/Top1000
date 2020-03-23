class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @pins = Pin.all
    @friends = User.all
  end
end
