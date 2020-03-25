class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @pins = Pin.all
    @friends = User.all

    @points = current_user.points

    case @points
    when 25..49
      current_user.level = 1
      current_user.save
    when 50..99
      current_user.level = 2
      current_user.save
    when 100..199
      current_user.level = 3
      current_user.save
    when 199..499
      current_user.level = 4
      current_user.save
    else
      current_user.level = 5
      current_user.save
    end
  end
end
