class WelcomeController < ApplicationController
  #
  #
  def index
    if session[:user_city].present?
      redirect_to controller: 'cities', action: 'show', id: City.find_by(name: session[:user_city]).slug
    else
      redirect_to controller: 'places', action: 'index'
    end
  end
end
