class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.all
  end
  
  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def new
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy

    redirect_to recruitments_path
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)

    @recruitment.save!
    redirect_to recruitments_path
  end

  private 
  def recruitment_params
    params.require(:recruitment).permit(:room_name, :room_url, :description)
  end
end
