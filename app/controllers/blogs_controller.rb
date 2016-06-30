class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:show]


  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = (current_user.has_role?(:admin) ? Blog.all : current_user.blogs).page(params[:page]).per(15)
  end


  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @commentable = @blog
    impressionist @blog
  end


  # GET /blogs/new
  def new
    @blog = Blog.new
  end


  # GET /blogs/1/edit
  def edit
  end


  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end


  protected
    #
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end


    #
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :city_id)
    end


    #
    #
    def require_admin
      if !user_signed_in? || (user_signed_in? and !has_role?(:admin, :mayor))
        flash[:danger] = "Only admins can perform that action"
        redirect_to categories_path
      end
    end
end
