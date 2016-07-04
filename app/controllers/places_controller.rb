class PlacesController < ApplicationController
  layout 'listing', only: :index
  skip_before_action :verify_authenticity_token, if: :json_request?
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
        render json: Place.search(params[:q], {
          fields: ['name^5', 'city'],
          limit: 5,
          load: false,
          misspellings: { below: 5 }
        }).map{ |p| "#{p.name}, #{p.city}" }.to_json, callback: params[:callback]
      end
    end
  end


  #
  #
  def index
    keywords = params[:search].present? ? params[:search] : '*'

    @places = Place.search keywords, page: params[:page], per_page: 12
    # @places = params[:search].present? ? Place.search(params[:search]) : Place.featured

    # if @places.count < LIMIT
    #   items = Place.where.not(id: @places.ids)
    #   (LIMIT - @places.count).times do |i|
    #     @places << items[i] if items[i]
    #   end
    # end

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

    @open_days = @place.open_days

    @shopping_cart = ShoppingCart.new
    @sliders = @place.sliders.order(:position)

    # @place.view!(current_user.try(:id))
    impressionist @place
  end


  #
  #
  def new
    @place = Place.new
    # @place.open_days.build

    @cities = City.all
    # build_opendays
    # @open_days = @place.open_days

    @place.sliders.build
  end


  #
  #
  def create
    ap params
    @place = Place.new(place_params)
    @place.owner = current_user
    @place.save

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place }
        format.json { render :show, status: :created, location: @place }
      else
        build_opendays
        @open_days = @place.open_days
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
    # build_opendays
    # @open_days = @place.open_days
  end


  #
  #
  def update
    ap params
    respond_to do |format|
      #binding.pry
      if @place.update(place_params)
        format.html { redirect_to @place }
        format.json { render :show, status: :ok, location: @place }
      else
        # build_opendays
        # @open_days = @place.open_days
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
      params.require(:place).permit(:name, :about, :city_id,
        :address, :phone, :facebook, :twitter, :instagram, :web, :map, :image, :slug,
        :lat, :lng, category_ids: [],
        open_days_attributes: [ :id, :day_in_week, :start_time, :end_time, :open ],
        sliders_attributes: [:id, :user_id, :image, :position, :_destroy])
    end


    #
    #
    def require_same_user
      if current_user != @place.owner and !has_role?(:admin)
        flash[:danger] = "You can only edit or delete your own places."
        redirect_to root_path
      end
    end


    #
    #
    def build_opendays
      Enum::Place::DAY_NAME[:options].each do |day|
        @place.open_days.build(day_in_week: day.to_s)
      end if @place.open_days.empty?
    end


    #
    #
    def json_request?
      request.format.json?
    end
end
