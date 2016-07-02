class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all.page(params[:page]).per(15)
  end


  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @comment = Comment.new commentable: @blog
    impressionist @blog
  end


  # GET /blogs/new
  def new
    redirect_with_permission_error unless current_user.has_any_role?(:admin, :mayor)
    @blog = Blog.new
  end


  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    redirect_with_permission_error unless current_user.has_any_role?(
      :admin,
      { name: :mayor, resource: @blog.city }
      )

    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        current_user.add_role :creator, @blog
        format.html { redirect_to @blog }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /blogs/1/edit
  def edit
    redirect_with_permission_error unless current_user.has_any_role?(
      :admin,
      { name: :creator, resource: @blog }
      )
  end


  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    redirect_with_permission_error unless current_user.has_any_role?(
      :admin,
      { name: :creator, resource: @blog }
      )

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
    redirect_with_permission_error unless current_user.has_any_role?(
      :admin,
      { name: :creator, resource: @blog }
      )

    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end


  protected
    #
    #
    def set_blog
      @blog = Blog.find params[:id]
    end


    #
    #
    def blog_params
      params.require(:blog).permit :title, :body, :image, :city
    end
end
