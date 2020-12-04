class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :update, :destroy, :edit]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @clinic_ids = @doctor.clinics.pluck(:id)
  end

  def show
  end

  def create
    @doctor = Doctor.new(permit_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def update
    if @doctor.update(permit_params)
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def permit_params
    params.require(:doctor).permit(:name, :gender, :contact_no, clinic_ids: [])
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end
end
