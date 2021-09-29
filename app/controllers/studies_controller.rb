# frozen_string_literal: true

class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end

  def fetch
    Study.obtain
  end
end
