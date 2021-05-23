class Study < ApplicationRecord

  def self.obtain
    response = FARADAY.get do |request|
      request.headers = { 'Content-Type' => 'application/json'}
      request.url ENV['STUDY_SITE_HOST']
    end

    return unless response.status == 200
  end
end