require 'rails_helper'

RSpec.describe DoctorsController do
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
    let(:doctor) { create(:doctor) }
    it 'renders edit template' do
      get :edit, params: { id: doctor.id }

      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    context 'when params are invalid' do
      let(:params) {
        {
          doctor: {
            name: Faker::Name.name,
            clinic_ids: []
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
          doctor: {
            name: Faker::Name.name,
            gender: 'Female',
            contact_no: '7767983214',
            clinic_ids: []
          }
        }
      }

      it 'renders index template' do
        post :create, params: params

        expect(response).to redirect_to(doctors_path)
      end

      it 'create a doctor' do
        post :create, params: params

        expect(Doctor.count).to eq(1)
      end
    end
  end

  describe '#update' do
    let(:doctor) { create(:doctor) }
    context 'when params are invalid' do
      let(:params) {
        {
          doctor: {
            name: Faker::Name.name,
            gender: '',
            contact_no: '3232343432',
            clinic_ids: []
          },
          id: doctor.id
        }
      }

      it 'renders edit template' do
        patch :update, params: params

        expect(response).to render_template(:edit)
      end
    end

    context 'when params are valid' do
      let(:doctor) { create(:doctor) }
      let(:params) {
        {
          doctor: {
            name: 'Anand',
            location: Faker::Address.city,
            clinic_ids: []
          },
          id: doctor.id
        }
      }

      it 'renders index template' do
        patch :update, params: params

        expect(response).to redirect_to(doctors_path)
      end

      it 'updates a doctor' do
        patch :update, params: params

        expect(doctor.reload.name).to eq('Dr. Anand')
      end
    end  
  end
end
