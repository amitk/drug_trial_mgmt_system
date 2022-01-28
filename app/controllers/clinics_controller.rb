# frozen_string_literal: true

class ClinicsController < ApplicationController
  before_action :find_clinic, only: %i[show edit update destroy]

  def index
    @clinics = Clinic.page(params[:page] || 1)
  end

  def new
    @clinic = Clinic.new
    @doctors = Doctor.all
  end

  def edit
    @doctor_ids = @clinic.doctors.pluck(:id)
  end

  def create
    @clinic = Clinic.new(permit_params)
    params[:clinic][:doctor_ids].each do |id|
      @clinic.doctors << Doctor.find_by(id: id) if id.present?
    end if params[:clinic][:doctor_ids].present?

    if @clinic.save
      redirect_to clinics_path
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
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
    redirect_to clinics_path if @clinic.destroy
  end

  private

  def permit_params
    params.require(:clinic).permit(:name, :location, doctor_ids: []) if params[:clinic].present?
  end

  def find_clinic
    @clinic = Clinic.find(params[:id])
  end
end
