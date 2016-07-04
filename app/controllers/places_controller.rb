class PlacesController < ApplicationController
  layout 'listing', only: :index
  skip_before_action :verify_authenticity_token, if: :json_request?, only: [:autocomplete]
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :search, :autocomplete]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # LIMIT = 15


  #
  #
  def stat
    render layout: 'setting'
  end


  #
  #
  def autocomplete
    respond_to do |f|
      f.html
      f.json do
        render json: Place.search(params[:term], {
          fields: ['name^5', 'city'],
          limit: 5,
          load: false,
          misspellings: { below: 5 }
        }).map{ |p| "#{p.name}, #{p.city}" }.to_json
      end
    end
  end


  #
  #
  def index
    keywords = params[:search].present? ? params[:search] : '*'

    @places = Place.search keywords, page: params[:page], per_page: 12
    @cities = City.limit(10)
    @cate = Category.limit(10)
    @blog = Blog.last
    @page_title = 'Places'
  end


  #
  #
  def show
    @cate = Category.limit(10)
    @cities = City.limit(10)
    @places = Place.all
    @blog = Blog.last
    @claim = Claim.new
    @shopping_cart = ShoppingCart.new
    @sliders = @place.sliders.order(:position)
    impressionist @place
  end


  #
  #
  def new
    @place = Place.new
    @business_hour = @place.build_business_hour
    @cities = City.all
    @place.sliders.build
  end


  #
  #
  def create
    @place = Place.new(place_params)
    @place.owner = current_user
    @place.save

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place }
        format.json { render :show, status: :created, location: @place }
      else
        flash.now[:error] = @place.errors.full_messages.to_sentence
        format.html { render :new  }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end


  #
  #
  def edit
    @cities = City.uniq.pluck(:name)
    @business_hour = @place.business_hour || @place.build_business_hour
  end


  #
  #
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place }
        format.json { render :show, status: :ok, location: @place }
      else
        flash.now[:error] = @place.errors.full_messages.to_sentence

        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end


  #
  #
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end


  protected
    #
    #
    def set_place
      @place = Place.find(params[:id])
    end


    #
    #
    def place_params
      business_hour_params = [:id, :place_id,
        :sun, :sun_open, :sun_close,
        :mon, :mon_open, :mon_close,
        :tue, :tue_open, :tue_close,
        :wed, :wed_open, :wed_close,
        :thu, :thu_open, :thu_close,
        :fri, :fri_open, :fri_close,
        :sat, :sat_open, :sat_close]

      params.require(:place).permit(:name, :about, :city_id,
        :address, :phone, :facebook, :twitter, :instagram, :web, :map, :image, :slug,
        :lat, :lng, category_ids: [],
        business_hour_attributes: business_hour_params,
        sliders_attributes: [:id, :user_id, :image, :position, :_destroy])
    end


    #
    #
    def require_same_user
      if !(current_user != @place.owner || !current_user.has_role?(:admin))
        flash[:danger] = "You can only edit or delete your own places."
        redirect_to root_path
      end
    end


    #
    #
    def json_request?
      request.format.json?
    end
end
