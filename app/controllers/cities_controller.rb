class CitiesController < ApplicationController
  layout 'listing', only: :show
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # before_action :require_permission, only: [:edit, :update]


  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
    @places = Place.all
  end


  # GET /cities/1
  # GET /cities/1.json
  def show
    @cate = Category.limit(10)
    @places = @city.places.order(featured: :desc).page(params[:place_page]).per(16)
    @cities = City.limit(10)
    @blog = Blog.last

    cookies[:first_time] = false
  end


  # GET /cities/new
  def new
    @city = City.new
  end


  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)
    @city.creator ||= current_user

    respond_to do |format|
      if @city.save
        format.html { redirect_to new_place_path, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /cities/1/edit
  #
  def edit
    redirect_with_permission_error unless current_user.has_any_role?(:admin, { name: :mayor, resource: @city })
  end


  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    redirect_with_permission_error unless current_user.has_any_role?(:admin, { name: :mayor, resource: @city })

    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    redirect_with_permission_error unless current_user.has_role?(:admin)

    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end


  #
  #
  def location
    if params['latitude'] && params['longitude']
      cookies[:latitude] = params['latitude']
      cookies[:longitude] = params['longitude']
    end

    city = City.search(params['latitude'], params['longitude']).first rescue nil
    render json: { first_time: !city.nil?, slug: city.try(:slug) }
  end


  protected
    #
    #
    def set_city
      @city = City.find params[:id]
    end


    #
    #
    def city_params
      params.require(:city).permit(:country, :about, :name, :creator,
        :lat, :lng, :distance, :slug)
    end
end
