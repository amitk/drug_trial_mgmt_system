require 'rails_helper'

RSpec.describe PatientsController do
  let(:arm) { create(:arm) }
  describe '#index' do
    it 'returns 200' do
      get :index, params: { arm_id: arm.id }

      expect(response.status).to eq 200
    end

    it 'render index template' do
      get :index, params: { arm_id: arm.id }
  
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it 'returns 200' do
      get :new, params: { arm_id: arm.id }

      expect(response.status).to eq(200)
    end

    it 'render new template' do
      get :new, params: { arm_id: arm.id }

      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    context 'when params are invalid' do
      let(:params) {
        {
          patient: {
            name: '',
            contact_no: '7767983572',
            age: 24
          },
          arm_id: arm.id
        }
      }

      it 'does not creates a record' do
        post :create, params: params

        expect(Patient.count).to eq(0)
      end

      it 'renders new' do
        post :create, params: params

        expect(response).to render_template(:new)
      end
    end


    context 'when params are valid' do
      let(:params) {
        {
          patient: {
            name: 'Amit Kumar',
            contact_no: '7767983572',
            gender: 'Male',
            age: 24
          },
          arm_id: arm.id
        }
      }

      it 'creates a patient' do
        post :create, params: params

        expect(Patient.count).to eq(1)
      end

      it 'redirect to index' do
        post :create, params: params

        expect(response).to redirect_to(arm_patients_path(arm.id))
      end
    end
  end

  describe '#edit' do
    let(:patient) { create(:patient) }
    it 'renders edit template' do
      get :edit, params: { id: patient.id }

      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    let(:patient) { create(:patient) }
    
    context 'when params are invalid' do
      let(:params) {
        {
          patient: {
            name: '',
            contact_no: '9079693799',
          },
          id: patient.id
        }
      }

      it 'renders edit' do
        patch :update, params: params

        expect(response).to render_template(:edit)
      end
    end

    context 'when params are valid' do
      let(:params) {
        {
          patient: {
            name: 'Rooney',
            contact_no: '9079693799',
          },
          id: patient.id
        }
      }

      it 'update patient record' do
        patch :update, params: params

        expect(patient.reload.name).to eq('Rooney')
        expect(patient.reload.contact_no).to eq('9079693799')
      end

      it 'renders index template' do
        patch :update, params: params

        expect(response).to redirect_to(arm_patients_path(patient.arm.id))
      end
    end
  end
end
