class ClinicsController < ApplicationController
  before_action :find_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @clinics = Clinic.all
  end

  def new
    @clinic = Clinic.new
    @doctors = Doctor.all
  end

  def show
  end

  def edit

  end

  def create
    binding.pry
    @clinic = Clinic.new(permit_params)

    if @clinic.save
      redirect_to clinics_path
    else
      render :new
    end
  end

  def update
    if @clinic.update(permit_params)
      redirect_to clinics_path
    else
      render :edit
    end
  end

  def destroy
    @clinic.destroy
    redirect_to clinics_path
  end

  private

  def permit_params
    params.require(:clinic).permit(:name, :location, doctor_ids: [])
  end

  def find_clinic
    @clinic = Clinic.find(params[:id])
  end
end
