class HomeController < ApplicationController
  # noinspection RailsParamDefResolve
  # before_action :authenticate_user!, only: :show


  def index
  end


  def show
    unless user_signed_in?
      redirect_to '/home/index'
    end
  end
end
