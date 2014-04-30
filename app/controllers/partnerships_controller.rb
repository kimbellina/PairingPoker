class PartnershipsController < ApplicationController

  # POST /partnerships
  # POST /partnerships.json
  def create
    @partnership = current_user.partnerships.build(partnership_params)
    
    if @partnership.save
      flash[:notice] = "Added partnership."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add partnership."
      redirect_to root_url
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def partnership_params
      params.require(:partnership).permit(:message, :partner_id)
    end
end
