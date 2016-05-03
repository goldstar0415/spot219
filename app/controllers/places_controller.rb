class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
    @cities = City.limit(10)
    @cate = Category.limit(10)
  end
  
  

  # GET /places/1
  # GET /places/1.json
  def show
    @cate = Category.limit(10)
    @cities = City.limit(10)
    @places = Place.all
  end

  # GET /places/new
  def new
    @place = Place.new
    @cities = City.uniq.pluck(:city_name)
  end

  # GET /places/1/edit
  def edit
    @cities = City.uniq.pluck(:city_name)
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.user = current_user
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
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
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
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def search
    @search = Place.search do
      fulltext params[:search]
    end
    @places = @search.results
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
      params.require(:place).permit(:name, :about, :country, :city, :address, :phone, :fb, :twit, :insta, :web, :map, :image, category_ids: [])
    end
    
    def require_same_user
      if current_user != @place.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own places."
        redirect_to root_path
      end
    end
    
end
