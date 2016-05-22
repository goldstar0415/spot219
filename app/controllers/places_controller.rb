class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.order(created_at: :desc).paginate(page: params[:page], per_page: 18)
    @cities = City.limit(10)
    @cate = Category.limit(10)
    @blog = Blog.last
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @cate = Category.limit(10)
    @cities = City.limit(10)
    @places = Place.all
    @blog = Blog.last
    @claim = Claim.new
    @open_days = @place.open_days.where(open: true)
    @shopping_cart = ShoppingCart.new

  end

  # GET /places/new
  def new
    @place = Place.new
    @cities = City.all

    @open_days = []
    Date::DAYNAMES.each do |day|
      @open_days << @place.open_days.build(day_in_week: day)
    end
  end

  # GET /places/1/edit
  def edit
    @cities = City.uniq.pluck(:city_name)
    @open_days = @place.open_days
    if @open_days.blank?
      @open_days = []
      Date::DAYNAMES.each do |day|
        @open_days << @place.open_days.build(day_in_week: day)
      end
    end
  end

  # POST /places
  # POST /places.json
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

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
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

  # DELETE /places/1
  # DELETE /places/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :about, :country, :city,
        :address, :phone, :fb, :twit, :insta, :web, :map, :image,
        :city_id, :latitude, :longitude, category_ids: [], open_days_attributes: [ :id, :day_in_week, :start_time, :end_time, :open ])
    end

    def require_same_user
      if current_user != @place.user and !has_role?(:admin)
        flash[:danger] = "You can only edit or delete your own places."
        redirect_to root_path
      end
    end

end
