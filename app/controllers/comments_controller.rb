class CommentsController < ApplicationController
  
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @place, notice: 'Review was successfully created.'}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:title, :description, :place_id)
  end
end
