class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @places = Place.order(created_at: :desc).page(params[:page])
    @cities = City.limit(10)
    @cate = Category.limit(10)
    @blog = Blog.last
  end

  def show
    @cate = Category.limit(10)
    @cities = City.limit(10)
    @places = Place.all
    @blog = Blog.last
    @claim = Claim.new
    @open_days = @place.open_days.where(open: true)
    @shopping_cart = ShoppingCart.new
    @sliders = @place.sliders.order(:position)
  end

  def new
    @place = Place.new
    @cities = City.all

    @open_days = []
    Date::DAYNAMES.each do |day|
      @open_days << @place.open_days.build(day_in_week: day)
    end
    @place.sliders.build
  end

  def edit
    @cities = City.uniq.pluck(:city_name)

    if @place.open_days.blank?
      Date::DAYNAMES.each do |day|
        @place.open_days.build(day_in_week: day)
      end
    end

    @open_days = @place.open_days
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.save
    #binding.pry
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      #binding.pry
      if @place.update(place_params)
        format.html { redirect_to @place }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.comments.each do |comment|
      comment.destroy
    end
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

  def search
    @places = Place.search params[:search]

    @cities = City.limit(10)
    @cate = Category.limit(10)
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :about, :country, :city,
        :address, :phone, :fb, :twit, :insta, :web, :map, :image, :subdomain,
        :city_id, :latitude, :longitude, category_ids: [],
        open_days_attributes: [ :id, :day_in_week, :start_time, :end_time, :open ],
        sliders_attributes: [:id, :user_id, :image, :position, :_destroy])
    end

    def require_same_user
      if current_user != @place.user and !has_role?(:admin)
        flash[:danger] = "You can only edit or delete your own places."
        redirect_to root_path
      end
    end
end
