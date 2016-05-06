class BlogCommentsController < ApplicationController
  
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.blog_comments.create(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private
  
  def comment_params
    params.require(:blog_comment).permit(:title, :description, :blog_id, :number)
  end
  
end
