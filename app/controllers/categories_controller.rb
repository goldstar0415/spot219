class CategoriesController < ApplicationController
  layout 'listing', only: :show
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]


  #
  #
  def index
    @categories = Category.page(params[:page]).per(15)
  end


  #
  #
  def new
    @category = Category.new
  end


  #
  #
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end


  #
  #
  def edit
    @category = Category.find(params[:id])
  end


  #
  #
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was successfuly updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end


  #
  #
  def show
    @cities = City.limit(10)
    @category = Category.find(params[:id])
    @cate = Category.limit(10)
    @category_places = @category.places.order(created_at: :desc).page(params[:page]).per(15)
    @blog = Blog.last
    @page_title = @category.name
  end


  protected
    #
    #
    def category_params
      params.require(:category).permit(:name)
    end


    #
    #
    def require_admin
      redirect_with_permission_error unless current_user.has_role?(:admin)
    end
end
