# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :find_arm, except: [:show, :destroy]
  
  def index
    @patients = @arm.patients.page(params[:page] || 1)
  end

  def new
    @patient = @arm.patients.new
  end

  def edit
  end

  def create
    new_patient = @arm.patients.new(permit_params)
    if new_patient.save
      redirect_to arm_patients_path(@arm.id)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def permit_params
    params.require(:patient).permit(:name, :contact_no, :gender, :age)
  end

  def find_arm
    @arm = Arm.find_by(id: params[:arm_id])
  end
end
