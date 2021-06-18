# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :find_arm, except: [:show, :destroy]
  before_action :find_patient, only: [:edit, :destroy]
  
  def index
    @patients = @arm.patients.page(params[:page] || 1)
  end

  def new
    @patient = @arm.patients.new
  end

  def edit
  end

  def create
    @patient = @arm.patients.new(permit_params)
    if @patient.save
      redirect_to arm_patients_path(@arm.id)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    redirect_to arm_patients_path(@patient.arm.id) if @patient.destroy
  end

  private

  def permit_params
    params.require(:patient).permit(:name, :contact_no, :gender, :age)
  end

  def find_arm
    @arm = Arm.find_by(id: params[:arm_id])
  end

  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end
end
