class ArmsController < ApplicationController
  before_action :find_clinic
  before_action :find_arm, only: [:update, :destroy]
  def index
    @arms = Arm.where(clinic_id: params[:clinic_id]).page(params[:page] || 1)
  end

  def new
    @arm = @clinic.arms.new
  end

  def edit
    @arm = Arm.find(params[:id])
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
    if @arm.update(permit_params)
      redirect_to clinic_arms_path(@arm.clinic.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def find_clinic
    @clinic = Clinic.find_by(id: params[:clinic_id])
  end

  def find_arm
    @arm = Arm.find_by(id: params[:id])
  end

  def permit_params
    params.require(:arm).permit(:name, :limit)
  end
end
