class ClaimsController < ApplicationController
  def create
    @claim = Claim.new(claim_params)
    @claim.user = current_user if user_signed_in?
    @claim.save

    respond_to do |format|
      if @claim.save
        format.html { redirect_to :back, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: :back }
      else
        format.html { redirect_to :back, alert: @claim.errors.full_messages }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def claim_params
      params.require(:claim).permit(:first_name, :last_name, :email, :phone, :proof, :place_id)
    end
end
