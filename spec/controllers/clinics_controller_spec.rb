require 'rails_helper'

RSpec.describe ClinicsController do
  describe '#index' do
    it 'returns 200' do
      get :index

      expect(response.status).to eq 200
    end

    it 'renders index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it 'renders new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    let(:clinic) { create(:clinic) }
    it 'renders edit template' do
      get :edit, params: { id: clinic.id }

      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    context 'when params are invalid' do
      let(:params) {
        {
          clinic: {
            name: Faker::Name.name,
            doctor_ids: []
          }
        }
      }

      it 'renders new template' do
        post :create, params: params

        expect(response).to render_template(:new)
      end
    end

    context 'when params are valid' do
      let(:params) {
        {
          clinic: {
            name: Faker::Name.name,
            location: Faker::Address.city,
            doctor_ids: []
          }
        }
      }

      it 'renders index template' do
        post :create, params: params

        expect(response).to redirect_to(clinics_path)
      end

      it 'create a clinic' do
        post :create, params: params

        expect(Clinic.count).to eq(1)
      end
    end
  end

  describe '#update' do
    let(:clinic) { create(:clinic) }
    context 'when params are invalid' do
      let(:params) {
        {
          clinic: {
            name: Faker::Name.name,
            location: '',
            doctor_ids: []
          },
          id: clinic.id
        }
      }

      it 'renders edit template' do
        patch :update, params: params

        expect(response).to render_template(:edit)
      end
    end

    context 'when params are valid' do
      let(:clinic) { create(:clinic) }
      let(:params) {
        {
          clinic: {
            name: 'ruby hall clinic',
            location: Faker::Address.city,
            doctor_ids: []
          },
          id: clinic.id
        }
      }

      it 'renders index template' do
        patch :update, params: params

        expect(response).to redirect_to(clinics_path)
      end

      it 'updates a clinic' do
        patch :update, params: params

        expect(clinic.reload.name).to eq('ruby hall clinic')
      end
    end  
  end
end
