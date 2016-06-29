class WelcomeController < ApplicationController
  #
  #
  def index
    if session[:user_city].present?
      redirect_to controller: 'cities', action: 'show', id: session[:user_city]
    else
      redirect_to controller: 'places', action: 'index'
    end
  end
end
