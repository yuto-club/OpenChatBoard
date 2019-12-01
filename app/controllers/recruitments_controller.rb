class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.all
  end
  
  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def new
    @recruitment = Recruitment.new
  end

  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy

    redirect_to recruitments_path
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)

    if @recruitment.save
      flash[:notice] = "Create new"
      redirect_to recruitments_path
    else
      flash[:notice] = @recruitment.errors.full_messages
      redirect_to new_recruitment_path
    end
  end

  def edit
    @recrutiment = Recruitment.find(params[:id])
  end
  def update
    @recruitment = Recruitment.find(params[:id])

    unless @recruitment.authenticate(recruitment_params['password'])
      flash[:notice] = "Password Invalid"
      redirect_to edit_recruitment\path(@recruitment) and return
    end
    
    if @recruitment.update(recruitment_params)
      flash[:notice] = "update success"
      redirect_to recruitments_path
    else
      flash[:notice] = @recruitment.errors.full_messages
      redirect_to recruitments_path
    end
  end

  private 
  def recruitment_params
    params.require(:recruitment).permit(:room_name, :room_url, :description,:password)
  end
end
