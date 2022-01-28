require 'rails_helper'

RSpec.describe StudiesController do
  describe '#index' do
    let!(:study) { create :study }
    it 'returns studies' do
      get :index

      expect(response.status).to eq(200)
    end
  end
end
