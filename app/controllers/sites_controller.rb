# frozen_string_literal: true

class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def fetch_sites; end
end
