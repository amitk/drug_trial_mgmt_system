# frozen_string_literal: true

class StudiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @studies = Study.all
  end

  def pushed
    result = PushedStudy.new(params[:studies]).process
    render json: { message: "Studies pushed successfully" }, status: :ok and return if result

    render json: { message: "Error pushing studies" }, status: :unprocessable_entity
  end
end
