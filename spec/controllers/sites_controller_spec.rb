require 'rails_helper'

RSpec.describe SitesController do
  describe '#index' do
    it 'returns 200' do
      get :index

      expect(response.status).to eq 200
    end
  end
end
