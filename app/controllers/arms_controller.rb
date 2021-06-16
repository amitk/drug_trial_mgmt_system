class ArmsController < ApplicationController
  before_action :find_clinic

  def index
    @arms = Arm.where(clinic_id: params[:clinic_id]).page(params[:page] || 1)
  end

  def new
    @arm = @clinic.arms.new
  end

  def create
    new_arm = @clinic.arms.new(permit_params)
    if new_arm.save
      redirect_to clinic_arms_path(@clinic.id)
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def find_clinic
    @clinic = Clinic.find_by(id: params[:clinic_id])
  end

  def permit_params
    params.require(:arm).permit(:name, :limit)
  end
end
