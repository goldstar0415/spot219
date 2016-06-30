class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create


  #
  #
  def create
    # @place = Place.find(params[:place_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @place }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  protected
    #
    #
    def comment_params
      params.require(:comment).permit(:title, :description, :rating, :commentable_id, :commentable_type)
    end
end
